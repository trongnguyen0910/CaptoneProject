import 'dart:io';
import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:myapp/Home/welcomescreen.dart';
import 'package:myapp/utils.dart';
import 'package:intl/intl.dart';

// import '../API/Register.dart';
import '../SignIn/SignIn.dart';
import 'CreateAccount.dart';
import 'SuccessfulCreateAccount.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'VerifyAccount.dart';

class CompleteProfile extends StatefulWidget {
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _coverPhotoController = TextEditingController();
  _register() async {
    var email = emailController.text;
    var password = passwordController.text;
    var fullname = _fullnameController.text;
    var phone = _phonenumberController.text;
    var address = _addressController.text;
    var roleId = 4;
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://fruitseasonms.azurewebsites.net/api/auths/register'),
    );
    request.headers['accept'] = 'multipart/form-data';
    request.fields['FullName'] = fullname;
    request.fields['Password'] = password;
    request.fields['Email'] = email;
    request.fields['PhoneNumber'] = phone;
    request.fields['Address'] = address;
    request.fields['RoleId'] = roleId.toString();
    var imageFile = File(image!.path);
    var imageStream = http.ByteStream(imageFile.openRead());
    var imageLength = await imageFile.length();

    var multipartFile = http.MultipartFile(
      'ProfileImageUrl',
      imageStream,
      imageLength,
      filename: imageFile.path,
      contentType: MediaType(
        'image',
        'png',
      ),
    );
    request.files.add(multipartFile);
    var coverPhotoFile = File(_coverPhotoController.text);
    var coverPhotoStream = http.ByteStream(coverPhotoFile.openRead());
    var coverPhotoLength = await coverPhotoFile.length();

    var coverPhotoMultipartFile = http.MultipartFile(
      'ImageMomoUrl', // Change this to your desired field name
      coverPhotoStream,
      coverPhotoLength,
      filename: coverPhotoFile.path,
      contentType: MediaType('image', 'png'),
    );
    request.files.add(coverPhotoMultipartFile);

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
            title: 'Thành công', // Tiêu đề thành công
            message: 'Vui lòng xác nhận OTP', // Tin nhắn thành công
            contentType: ContentType.success, // Loại snackbar thành công
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Future.delayed(Duration(seconds: 2), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VerifyAccount()),
          );
        });
      } else if (response.statusCode != 200) {
        var responseString = await response.stream.bytesToString();
        var responseBody = json.decode(responseString);
        var errorMessage = responseBody['message'];
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

  bool _isPassword = true;
  bool? selectedGender;
  File? image;
  Future pickCoverPhoto() async {
    try {
      final coverPhoto =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (coverPhoto == null) return;
      final coverPhotoTemporary = File(coverPhoto.path);
      setState(() => _coverPhotoController.text = coverPhotoTemporary.path);
    } on PlatformException catch (e) {
      print('Failed to pick cover photo: $e');
    }
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Widget build(BuildContext context) {
    double baseWidth = 420;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.87;

    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký',
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
        padding: EdgeInsets.symmetric(horizontal: 30 * fem, vertical: 20 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: Container(
                width: double.infinity,
                height: 128 * fem,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10 * fem),
                  color: Colors.grey[200],
                ),
                child: image != null
                    ? Image.file(
                        image!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text(
                          'Tải ảnh đại diện',
                          style: TextStyle(
                            fontFamily: 'Satoshi',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff868889),
                          ),
                        ),
                      ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff868889),
                      ),
                    ),
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                  ),
                  SizedBox(height: 16 * fem),
                  TextFormField(
                    obscureText: _isPassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      labelStyle: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff868889),
                      ),
                      suffixIcon: IconButton(
                        icon: _isPassword
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPassword = !_isPassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value?.isNotEmpty == true && value!.length > 4) {
                        return null;
                      } else if (value?.isNotEmpty == true &&
                          value!.length < 5) {
                        return 'Password is too short';
                      } else {
                        return 'Please enter a valid password';
                      }
                    },
                  ),
                  SizedBox(height: 16 * fem),
                  TextFormField(
                    controller: _fullnameController,
                    decoration: InputDecoration(
                      labelText: 'Họ và tên',
                      labelStyle: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff868889),
                      ),
                    ),
                    validator: (value) {
                      if (value?.isNotEmpty == true && value!.length > 2) {
                        return null;
                      } else if (value?.isNotEmpty == true &&
                          value!.length < 3) {
                        return 'Name is too short';
                      } else {
                        return 'Please enter your full name';
                      }
                    },
                  ),
                  SizedBox(height: 16 * fem),
                  TextFormField(
                    controller: _phonenumberController,
                    decoration: InputDecoration(
                      labelText: 'Số điện thoại',
                      labelStyle: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff868889),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value?.isEmpty == true) {
                        return 'Please enter your phone number';
                      } else if (value!.length != 10) {
                        return 'Phone number must be 10 digits';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 16 * fem),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Địa chỉ',
                      labelStyle: TextStyle(
                        fontFamily: 'Satoshi',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff868889),
                      ),
                    ),
                    validator: (value) {
                      if (value?.isNotEmpty == true && value!.length > 2) {
                        return null;
                      } else if (value?.isNotEmpty == true &&
                          value!.length < 3) {
                        return 'Address is too short';
                      } else {
                        return 'Please enter your address';
                      }
                    },
                  ),
                  SizedBox(height: 16 * fem),
                  GestureDetector(
                    onTap: pickCoverPhoto,
                    child: Container(
                      width: double.infinity,
                      height: 128 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: Colors.grey[200],
                      ),
                      child: _coverPhotoController.text.isNotEmpty
                          ? Image.file(
                              File(_coverPhotoController.text),
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Text(
                                'Tải hình ảnh QR Momo',
                                style: TextStyle(
                                  fontFamily: 'Satoshi',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff868889),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20 * fem),
            GestureDetector(
              onTap: _register,
              child: Container(
                width: double.infinity,
                height: 50 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffaddb80),
                  borderRadius: BorderRadius.circular(25 * fem),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff5caa18),
                      offset: Offset(0 * fem, 4 * fem),
                      blurRadius: 5 * fem,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
     )
    );
  }
}
