import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Navigation/NavigationBar.dart';
import '../Register/CompleteProfile.dart';
import '../utils.dart';
import 'ForgotPassword.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? refreshToken; // Lưu trữ RefreshToken
  bool _isPassword = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false; 

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _usernameController.text = prefs.getString('email') ?? '';
      // Uncomment the following line if you also want to load the password
      // _passwordController.text = prefs.getString('password') ?? '';
      _rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  void login(String email, password) async {
    try {
      var request = http.Request(
        'POST',
        Uri.parse(
          'http://fruitseasonapims-001-site1.btempurl.com/api/auths/login',
        ),
      );
      request.headers['Content-Type'] = 'application/json; charset=UTF-8';
      request.body = json.encode({
        'email': email,
        'password': password,
      });
      var response = await request.send();
      print('response: $response');
      if (response.statusCode != 200) {
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
        // Save credentials only if "Remember Me" is checked
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (_rememberMe) {
          prefs.setString('email', email);
          // Uncomment the following line if you want to save the password as well
          // prefs.setString('password', password);
        } else {
          // Clear saved credentials if "Remember Me" is unchecked
          prefs.remove('email');
          prefs.remove('password');
        }

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Navigation()),
        );
      }

      var body = await response.stream.bytesToString();
      print('$body');
      print('status code: ${response.statusCode}');
      var jsonResponse = json.decode(body);
      var accountID = jsonResponse['data']['userId'];
      var accessToken = jsonResponse['data']['accessToken'];
      var emailuser = jsonResponse['data']['email'];
      var fullName = jsonResponse['data']['fullName'];
      refreshToken = jsonResponse['data']['refreshToken'];

      print('$accountID');
      print('$accessToken');

      if (accountID != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('accountID', accountID);
      }

      if (emailuser != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', emailuser);
      }
       if (fullName != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('fullName', fullName);
      }

      if (accessToken != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 418;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: 926 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0 * fem,
                top: 0 * fem,
                child: Align(
                  child: SizedBox(
                    width: 418 * fem,
                    height: 561.91 * fem,
                    child: Image.asset(
                      'assets/mobile/images/fruit-home.jpg',
                      width: 428 * fem,
                      height: 912.91 * fem,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0 * fem,
                top: 439 * fem,
                child: Align(
                  child: SizedBox(
                    width: 428 * fem,
                    height: 467 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xfff4f5f9),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10 * fem),
                          topRight: Radius.circular(10 * fem),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16.5410614014 * fem,
                top: 450.2958984375 * fem,
                child: Container(
                  width: 393.88 * fem,
                  height: 388.66 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 3.2 * fem),
                        child: Text(
                          'Xin chào!',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 25 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            letterSpacing: 0.75 * fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 27.47 * fem),
                        child: Text(
                          'Vui lòng đăng nhập vào tài khoản',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            letterSpacing: 0.45 * fem,
                            color: Color(0xff868889),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            1.03 * fem, 0 * fem, 0 * fem, 0.15 * fem),
                        padding: EdgeInsets.fromLTRB(
                            15.95 * fem, 0 * fem, 0 * fem, 1.23 * fem),
                        width: 380.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(5 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 21.71 * fem, 0.83 * fem),
                              width: 23.78 * fem,
                              height: 18.05 * fem,
                              child: Image.asset(
                                'assets/mobile/images/group-9Qu.png',
                                width: 23.78 * fem,
                                height: 18.05 * fem,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  labelText: 'Nhập địa chỉ email',
                                  labelStyle: TextStyle(
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.45 * fem,
                                    color: Color(0xff868889),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            1.03 * fem, 0 * fem, 0 * fem, 21.63 * fem),
                        padding: EdgeInsets.fromLTRB(
                            15.95 * fem, 8.54 * fem, 0.48 * fem, 0 * fem),
                        height: 61.8 * fem,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(5 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 27.65 * fem, 0 * fem),
                              width: 17.83 * fem,
                              height: 23.69 * fem,
                              child: Image.asset(
                                'assets/mobile/images/group-5-zyP.png',
                                width: 17.83 * fem,
                                height: 23.69 * fem,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: _isPassword,
                                decoration: InputDecoration(
                                  labelText: 'Nhập mật khẩu',
                                  labelStyle: TextStyle(
                                    fontSize: 15 * fem,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff868889),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: _isPassword
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isPassword = !_isPassword;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value?.isNotEmpty == true &&
                                      value!.length > 4) {
                                    return null;
                                  } else if (value?.isNotEmpty == true &&
                                      value!.length < 5) {
                                    return 'Password is that short';
                                  } else {
                                    return 'Please give password already';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            10.93 * fem, 0 * fem, 8.84 * fem, 18.2 * fem),
                        width: double.infinity,
                        height: 23 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 40.39 * fem, 0 * fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Ghi nhớ đăng nhập',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 15 * ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5 * ffem / fem,
                                      letterSpacing: 0.45 * fem,
                                      color: Color(0xff868889),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()),
                                );
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Text(
                                'Quên mật khẩu',
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5 * ffem / fem,
                                  letterSpacing: 0.45 * fem,
                                  color: Color(0xff407ec6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            1.03 * fem, 0 * fem, 0 * fem, 0.6 * fem),
                        width: 392.85 * fem,
                        height: 58.8 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xffaddb80),
                          borderRadius: BorderRadius.circular(5 * fem),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3f6cc51d),
                              offset: Offset(0 * fem, 10 * fem),
                              blurRadius: 4.5 * fem,
                            ),
                          ],
                        ),
                        child: TextButton(
                          onPressed: () {
                            login(_usernameController.text.toString(),
                                _passwordController.text.toString());
                          },
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            59.96 * fem, 0 * fem, 0 * fem, 0 * fem),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompleteProfile()),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w300,
                                height: 1.5 * ffem / fem,
                                letterSpacing: 0.45 * fem,
                                color: Color(0xff000000),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Bạn chưa có tài khoản ?',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w300,
                                    height: 1.5 * ffem / fem,
                                    letterSpacing: 0.45 * fem,
                                    color: Color(0xff868889),
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                ),
                                TextSpan(
                                  text: 'Đăng ký',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    letterSpacing: 0.45 * fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
