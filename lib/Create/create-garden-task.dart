import 'dart:convert';
import 'dart:io';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:myapp/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/GardenController.dart';
import '../Controller/PlantController.dart';
import '../GetX/GardenGetX.dart';
import 'create.dart';

class CreateGardenTask extends StatefulWidget {
  @override
  State<CreateGardenTask> createState() => _CreateGardenTaskState();
}

class _CreateGardenTaskState extends State<CreateGardenTask> {
  final _tasknameController = TextEditingController();
  final _taskdescriptionController = TextEditingController();
  final TextEditingController _date = TextEditingController();
   @override
  void initState() {
    super.initState();
    getGarden();
  }
  
  File? image;
   List<DataGarden> datagarden = [];
   List<DataPlant> dataplant = [];
    int? selectedGardenId;
     int? selectedPlantId;
   Future<void> getGarden() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'http://fruitseasonapims-001-site1.btempurl.com/api/gardens?activeOnly=true';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Garden: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          datagarden =
              responseTrans.map((item) => DataGarden.fromJson(item)).toList();
        });
        Get.find<GardenController>().updateGardenList(datagarden);
      }
    }
  }
   Future<void> getPlant(int selectedGardenId) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    print('id: $selectedGardenId');
    final url =
        'http://fruitseasonapims-001-site1.btempurl.com/api/plants/plants?activeOnly=true&gardenId=$selectedGardenId';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Plant: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          dataplant =
              responseTrans.map((item) => DataPlant.fromJson(item)).toList();
        });
         Get.find<GardenController>().updatePlantList(dataplant);
      }
    }
  }

  _createtaskgarden() async {
    final prefs = await SharedPreferences.getInstance();
    final accountID = prefs.getInt('accountID');
    final accessToken = prefs.getString('accessToken');
    print('acc: $accountID');
    var taskname = _tasknameController.text;
    var taskdescription = _taskdescriptionController.text;
    var date = _date.text;
    

    String imageURL = image != null ? image!.path : "";

    if (imageURL.isEmpty) {
      print('No image selected');
      return;
    }

   var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://fruitseasonapims-001-site1.btempurl.com/api/garden-tasks'),
    );
    request.headers['accept'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $accessToken';
    request.fields['GardenTaskName'] = taskname;
    request.fields['Description'] = taskdescription;
    request.fields['GardenTaskDate'] = date;
    request.fields['GardenId'] = selectedGardenId.toString();
    request.fields['PlantId'] = selectedPlantId.toString();

    // var data = {
    //   "taskName": taskname,
    //   "description": taskdescription,
    //   "region": garden,
    //   "userId": accountID,
    //   "image": imageURL,
    // };
    // request.body = jsonEncode(data);

    var imageFile = File(image!.path);
    var imageStream = http.ByteStream(imageFile.openRead());
    var imageLength = await imageFile.length();

    var multipartFile = http.MultipartFile(
      'UploadFile',
      imageStream,
      imageLength,
      filename: imageFile.path,
      contentType: MediaType('image', 'png'),
    );
    request.files.add(multipartFile);

    try {
      var response = await request.send();
      var statusCode = response.statusCode;
      print('Status code: $statusCode');

      if (response.statusCode == 200) {
        print('ok');
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green, // Màu nền màu xanh
          content: AwesomeSnackbarContent(
            title: 'Success', // Tiêu đề thành công
            message: 'Operation was successful', // Tin nhắn thành công
            contentType: ContentType.success, // Loại snackbar thành công
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Create()),
          );
        });
      } else if (response.statusCode != 200) {
        var responseString = await response.stream.bytesToString();
          var responseBody = json.decode(responseString);
          var errorMessage = responseBody['errors'];
          String errorContent = errorMessage.toString(); 
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Error',
              message: errorContent,
              contentType: ContentType.failure,
            ),
          );

          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
          print('Response body: $responseString');
          print('Error 400: $errorMessage');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future pickImage() async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        final imageFile = File(pickedImage.path);
        setState(() {
          image = imageFile;
        });
      } else {
        print('No image selected');
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  var gardenList = Get.find<GardenController>().gardenList;
  var plantList = Get.find<GardenController>().plantList;
  String? selectedGardenName;
  String? selectedPlantName;

  void callGetPlant() {
  if (selectedGardenId != null) {
    getPlant(selectedGardenId!);
  }
}
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // creategardentask5rx (3154:3128)
        width: double.infinity,
        height: 996 * fem,
        decoration: BoxDecoration(
          color: Color(0xfff4f5f9),
        ),
        child: Stack(
          children: [
            Positioned(
              // bodyCRn (3154:3130)
              left: 18 * fem,
              top: 318 * fem,
              child: Container(
                width: 392.88 * fem,
                height: 752.71 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // detailVfn (3154:3132)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0.88 * fem, 30.7 * fem),
                      width: 392 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // namezMe (3154:3143)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 14 * fem, 12 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // autogroupdmqlhG4 (LtKoAgTTv81Bq2o4bfDmQL)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 12 * fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Task name',
                                            labelStyle: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.45 * fem,
                                            ),
                                            suffixText: '*',
                                            suffixStyle: TextStyle(
                                              color: Color(0xffe74c3c),
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.45 * fem,
                                            ),
                                          ),
                                          controller: _tasknameController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25 * fem,
                          ),
                          Container(
                            // descriptionFD2 (3154:3138)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 14 * fem, 12 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogrouprualwbe (LtKo124tzte1199DWYRUAL)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 12 * fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Description',
                                            labelStyle: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.45 * fem,
                                            ),
                                            suffixText: '*',
                                            suffixStyle: TextStyle(
                                              color: Color(0xffe74c3c),
                                              fontSize: 15 * ffem,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.45 * fem,
                                            ),
                                          ),
                                          controller:
                                              _taskdescriptionController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25 * fem,
                          ),
                          Container(
                            // startXrg (3154:3260)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 15 * fem, 12 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DropdownButtonFormField<int>(
                                  value: selectedGardenId,
                                   decoration: InputDecoration(
                                            labelText: 'Garden Name',
                                            labelStyle:
                                                TextStyle(color: Colors.black,fontSize: 15),
                                            
                                          ),
                                  items: gardenList.map((DataGarden garden) {
                                    return DropdownMenuItem<int>(
                                      value: garden.gardenId,
                                      child: Text(garden.gardenName ?? ''),
                                    );
                                  }).toList(),
                                  onChanged: (int? gardenId) {
                                    setState(() {
                                      selectedGardenId = gardenId;
                                      print('selectedGardenId: $selectedGardenId');
                                      callGetPlant();
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25 * fem,
                          ),
                          Container(
                            // startXrg (3154:3260)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 15 * fem, 12 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DropdownButtonFormField<int>(
                                  value: selectedPlantId,
                                   decoration: InputDecoration(
                                            labelText: 'Plant Name',
                                            labelStyle:
                                                TextStyle(color: Colors.black,fontSize: 15),
                                            
                                          ),
                                  items: plantList.map((DataPlant plant) {
                                    return DropdownMenuItem<int>(
                                      value: plant.plantId,
                                      child: Text(plant.plantName ?? ''),
                                    );
                                  }).toList(),
                                  onChanged: (int? plantId) {
                                    setState(() {
                                      selectedPlantId = plantId;
                                      print('selectedPlantId: $selectedPlantId');
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25 * fem,
                          ),
                          Container(
                            // startdAx (3154:3256)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 15 * fem, 25 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    onTap: () async {
                                      DateTime? pickeddate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1000),
                                              lastDate: DateTime(2101));
                                      if (pickeddate != null) {
                                        setState(() {
                                          _date.text = DateFormat('yyyy-MM-dd')
                                              .format(pickeddate);
                                        });
                                      }
                                    },
                                    controller: _date,
                                    decoration: InputDecoration(
                                      labelText: 'Start Date',
                                      labelStyle: TextStyle(
                                        fontFamily: 'Satoshi',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2575 * ffem / fem,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value?.isEmpty == true) {
                                        return 'Please enter your date';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                     GestureDetector(
                      onTap: () {
                        _createtaskgarden();
                      },
                      child: Container(
                        // primarybuttonoyi (3152:2964)
                        margin: EdgeInsets.fromLTRB(
                            0.03 * fem, 0 * fem, 0 * fem, 0 * fem),
                        width: double.infinity,
                        height: 62.01 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff6cc51d),
                          borderRadius: BorderRadius.circular(5 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f6cc51d),
                              offset: Offset(0 * fem, 10 * fem),
                              blurRadius: 4.5 * fem,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Save change',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              // rectangle60edn (3154:3168)
              left: 0 * fem,
              top: 122 * fem,
              child: GestureDetector(
                onTap: () {
                  // Add your onTap functionality here
                  pickImage(); // For example, call the pickImage function when tapped
                },
                child: Align(
                  child: image != null
                      ? Image.file(
                          image!,
                          width: 128,
                          height: 128,
                          fit: BoxFit.cover,
                        )
                      : SizedBox(
                          width: 428 * fem,
                          height: 200 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5 * fem),
                            child: Image.asset(
                              'assets/mobile/images/add-image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
              ),
            ),
            Positioned(
              // titlebarMHJ (3154:3149)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    16.77 * fem, 65.11 * fem, 156.06 * fem, 29.84 * fem),
                width: 428 * fem,
                height: 121.95 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Create()),
                        );
                      },
                      child: Container(
                        // backarrowNRe (3145:2686)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0.42 * fem, 103.09 * fem, 0 * fem),
                        width: 24.58 * fem,
                        height: 17.09 * fem,
                        child: Image.asset(
                          'assets/mobile/images/backarrow.png',
                          width: 24.58 * fem,
                          height: 17.09 * fem,
                        ),
                      ),
                    ),
                    Text(
                      // createtaskLQ8 (3154:3151)
                      'Create Task',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.5 * ffem / fem,
                        letterSpacing: 0.54 * fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
