import 'dart:convert';
import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/DataFruitController.dart';
import 'ViewFruit.dart';



class PostImageFruit extends StatefulWidget {
  final int fruitId;
   const PostImageFruit({Key? key, required this.fruitId}) : super(key: key);
  
  @override
  State<PostImageFruit> createState() => _PostImageFruitState();
}

class _PostImageFruitState extends State<PostImageFruit> {
  File? image;

  
_createimage(int fruitId) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
   
   var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://fruitseasonms.azurewebsites.net/api/fruit-images'),
    );
    request.headers['accept'] = 'multipart/form-data';
    request.headers['Authorization'] = 'Bearer $accessToken';
    request.fields['FruitId'] = fruitId.toString();
    var imageFile = File(image!.path);
    var imageStream = http.ByteStream(imageFile.openRead());
    var imageLength = await imageFile.length();

    var multipartFile = http.MultipartFile(
      'UploadFiles',
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
            MaterialPageRoute(builder: (context) => ViewFruit()),
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
      appBar: AppBar(
          title: Text('Thêm hình ảnh cho sản phẩm',
              style: TextStyle(color: Colors.black)),
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
                    GestureDetector(
                      onTap: () {
                        _createimage(widget.fruitId);
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
          ],
        ),
      ),
    ));
  }
}
