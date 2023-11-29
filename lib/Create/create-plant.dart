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
import '../Controller/VarietyController.dart';
import '../GetX/GardenGetX.dart';
import 'create.dart';

class CreatePlant extends StatefulWidget {
  @override
  State<CreatePlant> createState() => _CreatePlantState();
}

class _CreatePlantState extends State<CreatePlant> {
  final _plantnameController = TextEditingController();
  final _plantdescriptionController = TextEditingController();
  final _estimatedHarvestQuantityController = TextEditingController();
  final TextEditingController _harvestingDate = TextEditingController();
  final TextEditingController _plantingDate = TextEditingController();
  @override
  void initState() {
    super.initState();
    getGarden();
    getVariety();
  }

  File? image;
  List<DataGarden> datagarden = [];
  List<DataVariety> datavariety = [];
  int? selectedGardenId;
  int? selectedVarietyId;
  String? _selectedValue;

  Future<void> getGarden() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final accountID = prefs.getInt('accountID');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/gardens?activeOnly=true&userId=$accountID';
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

  Future<void> getVariety() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/crop-varieties?activeOnly=true';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Variety: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          datavariety =
              responseTrans.map((item) => DataVariety.fromJson(item)).toList();
        });
        Get.find<GardenController>().updateVarietyList(datavariety);
      }
    }
  }

  _createtaskgarden() async {
    final prefs = await SharedPreferences.getInstance();
    final accountID = prefs.getInt('accountID');
    final accessToken = prefs.getString('accessToken');
    print('acc: $accountID');
    var plantname = _plantnameController.text;
    var plantdescription = _plantdescriptionController.text;
    var harvestingDate = _harvestingDate.text;
    var plantingDate = _plantingDate.text;
    var estimatedHarvestQuantity = _estimatedHarvestQuantityController.text;
    var status = _selectedValue;

    String imageURL = image != null ? image!.path : "";

    if (imageURL.isEmpty) {
      print('No image selected');
      return;
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://fruitseasonms.azurewebsites.net/api/plants'),
    );
    request.headers['accept'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $accessToken';
    request.fields['PlantName'] = plantname;
    request.fields['Description'] = plantdescription;
    request.fields['PlantingDate'] = plantingDate;
    request.fields['HarvestingDate'] = harvestingDate;
    request.fields['GardenId'] = selectedGardenId.toString();
    request.fields['CropVarietyId'] = selectedVarietyId.toString();
    request.fields['Status'] = status.toString();
    request.fields['QuantityPlanted'] = estimatedHarvestQuantity;

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

  Map<String, String> valueMappings = {
    'YoungTree': 'Cây trẻ',
    'FloweringTree': 'Cây đang nở hoa',
    'Harvestable': 'Cây có thể thu hoạch',
    'Diseased': 'Cây bị bệnh',
    'Dead': 'Cây chết',
    'Seed': 'Hạt giống',
    'GerminatedSeed': 'Hạt giống đã nảy mầm',
    'Seedling': 'Cây con',
  };

  var gardenList = Get.find<GardenController>().gardenList;
  var varietyList = Get.find<GardenController>().varietyList;
  String? selectedGardenName;
  String? selectedvarietyName;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          title: Text('Tạo cây trồng', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // creategardentask5rx (3154:3128)
            width: double.infinity,
            height: 1406 * fem,
            decoration: BoxDecoration(
              color: Color(0xfff4f5f9),
            ),
            child: Stack(
              children: [
                Positioned(
                  // bodyCRn (3154:3130)
                  left: 18 * fem,
                  top: 278 * fem,
                  child: Container(
                    width: 392.88 * fem,
                    height: 1152.71 * fem,
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
                                                labelText: 'Tên cây trồng',
                                                labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
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
                                              controller: _plantnameController,
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
                                                labelText: 'Mô tả',
                                                labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
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
                                                  _plantdescriptionController,
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
                                            child:
                                                DropdownButtonFormField<String>(
                                              isExpanded: true,
                                              value: _selectedValue,
                                              decoration: InputDecoration(
                                                labelText: 'Trạng thái',
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                              items: valueMappings.keys
                                                  .map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(valueMappings[
                                                      value]!), 
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                // Lưu giá trị tiếng Anh
                                                setState(() {
                                                  _selectedValue = newValue!;
                                                });
                                              },
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
                                                  labelText: 'Số lượng trồng',
                                                  labelStyle: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
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
                                                keyboardType:
                                                    TextInputType.number,
                                                controller:
                                                    _estimatedHarvestQuantityController),
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
                                        labelText: 'Tên khu vườn',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      items:
                                          gardenList.map((DataGarden garden) {
                                        return DropdownMenuItem<int>(
                                          value: garden.gardenId,
                                          child: Text(garden.gardenName ?? ''),
                                        );
                                      }).toList(),
                                      onChanged: (int? gardenId) {
                                        setState(() {
                                          selectedGardenId = gardenId;
                                          print(
                                              'selectedGardenId: $selectedGardenId');
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
                                      value: selectedVarietyId,
                                      decoration: InputDecoration(
                                        labelText: 'Loại cây trồng',
                                        labelStyle: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      items: varietyList
                                          .map((DataVariety variety) {
                                        return DropdownMenuItem<int>(
                                          value: variety.cropVarietyId,
                                          child: Text(
                                              variety.cropVarietyName ?? ''),
                                        );
                                      }).toList(),
                                      onChanged: (int? varietyId) {
                                        setState(() {
                                          selectedVarietyId = varietyId;
                                          print(
                                              'selectedvarietyId: $selectedVarietyId');
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
                                              _plantingDate.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickeddate);
                                            });
                                          }
                                        },
                                        controller: _plantingDate,
                                        decoration: InputDecoration(
                                          labelText: 'Ngày trồng',
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
                                              _harvestingDate.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickeddate);
                                            });
                                          }
                                        },
                                        controller: _harvestingDate,
                                        decoration: InputDecoration(
                                          labelText: 'Ngày thu hoạch',
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
                                'Lưu',
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
                  top: 52 * fem,
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
              ],
            ),
          ),
        ));
  }
}
