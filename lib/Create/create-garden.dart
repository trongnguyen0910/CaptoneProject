import 'dart:convert';
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'create.dart';

class CreateGarden extends StatefulWidget {
  @override
  State<CreateGarden> createState() => _CreateGardenState();
}

class _CreateGardenState extends State<CreateGarden> {
  final _gardennameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _regionController = TextEditingController();

  File? image;

  _creategarden() async {
    final prefs = await SharedPreferences.getInstance();
    final accountID = prefs.getInt('accountID');
    final accessToken = prefs.getString('accessToken');
    print('acc: $accountID');
    var gardenname = _gardennameController.text;
    var description = _descriptionController.text;
    var region = _regionController.text;

    String imageURL = image != null ? image!.path : "";

    if (imageURL.isEmpty) {
      print('No image selected');
      return;
    }

    var request = http.Request(
      'POST',
      Uri.parse('http://fruitseasonapi-001-site1.atempurl.com/api/gardens'),
    );
    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['Authorization'] = 'Bearer $accessToken';

    var data = {
      "gardenName": gardenname,
      "description": description,
      "region": region,
      "userId": accountID,
      "image": imageURL,
    };
    request.body = jsonEncode(data);

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
        var errorMessage = responseBody['errors']['errorMessage'];
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Error',
            message: errorMessage,
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

  String imageToBase64(File imageFile) {
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
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

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // creategardenne4 (3152:2961)
        width: double.infinity,
        height: 926 * fem,
        decoration: BoxDecoration(
          color: Color(0xfff4f5f9),
        ),
        child: Stack(
          children: [
            Positioned(
              // bodyuya (3152:2963)
              left: 18 * fem,
              top: 358 * fem,
              child: Container(
                width: 392.88 * fem,
                height: 552.71 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // detailRh2 (3152:2965)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0.88 * fem, 45.7 * fem),
                      width: 392 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // nameYWk (3152:2974)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 14 * fem, 18 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    // autogrouplururXS (LtKoxKp5Rb9GyGorVqLUrU)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 14 * fem),
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: InputDecoration(
                                              labelText: 'Garden name',
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
                                            controller: _gardennameController,
                                          ),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25 * fem,
                          ),
                          Container(
                            // descriptionUKr (3152:2978)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 14 * fem, 14 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupuzzqn5e (LtKoozid3hd1dzHEBRUZzQ)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 14 * fem),
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
                                          controller: _descriptionController,
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
                            // regionySx (3152:3006)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 14 * fem, 18 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // autogroupp4xr61n (LtKofLJPXye1w3yJAqP4Xr)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 14 * fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: _regionController,
                                          decoration: InputDecoration(
                                            labelText: 'Region',
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
                                        ),
                                      ),
                                    ],
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
                        _creategarden();
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
              // rectangle59rSC (3152:3005)
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
              // titlebarYZv (3152:2983)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    16.77 * fem, 65.11 * fem, 142.56 * fem, 29.84 * fem),
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
                      // creategardenjeQ (3152:2985)
                      'Create Garden',
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
