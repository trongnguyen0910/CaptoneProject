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
import '../Controller/VarietyController.dart';
import '../GetX/GardenGetX.dart';
import 'create.dart';

class CreateSeason extends StatefulWidget {
  @override
  State<CreateSeason> createState() => _CreateSeasonState();
}

class _CreateSeasonState extends State<CreateSeason> {
  final _seasonnameController = TextEditingController();
  final _seasondescriptionController = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _endDate = TextEditingController();
  @override
  void initState() {
    super.initState();
    getGarden();
  }

  File? image;
  List<DataGarden> datagarden = [];
  int? selectedGardenId;

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

  _createSeason() async {
    final prefs = await SharedPreferences.getInstance();
    final accountID = prefs.getInt('accountID');
    final accessToken = prefs.getString('accessToken');
    print('acc: $accountID');
    var seasonname = _seasonnameController.text;
    var seasondescription = _seasondescriptionController.text;
    var startDate = _startDate.text;
    var endDate = _endDate.text;
    String imageURL = image != null ? image!.path : "";

    if (imageURL.isEmpty) {
      print('No image selected');
      return;
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://fruitseasonms.azurewebsites.net/api/seasons'),
    );
    request.headers['accept'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $accessToken';
    request.fields['SeasonName'] = seasonname;
    request.fields['Description'] = seasondescription;
    request.fields['StartDate'] = startDate;
    request.fields['EndDate'] = endDate;
    request.fields['GardenId'] = selectedGardenId.toString();
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
          title: Text('Tạo mới mùa vụ', style: TextStyle(color: Colors.black)),
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
                  top: 318 * fem,
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
                                                labelText: 'Tên mùa vụ',
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
                                              controller: _seasonnameController,
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
                                                  _seasondescriptionController,
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
                                              _startDate.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickeddate);
                                            });
                                          }
                                        },
                                        controller: _startDate,
                                        decoration: InputDecoration(
                                          labelText: 'Ngày bắt đầu',
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
                                              _endDate.text =
                                                  DateFormat('yyyy-MM-dd')
                                                      .format(pickeddate);
                                            });
                                          }
                                        },
                                        controller: _endDate,
                                        decoration: InputDecoration(
                                          labelText: 'Ngày kết thúc',
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
                            _createSeason();
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
                  top: 122 * fem,
                  child: GestureDetector(
                    onTap: () {
                      pickImage();
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
