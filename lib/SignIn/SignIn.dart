
import 'dart:convert';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Garden/News.dart';
import '../HomeScreen/Home.dart';
import '../Navigation/NavigationBar.dart';
import '../Register/CompleteProfile.dart';
import 'ForgotPassword.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}
 
class _LoginState extends State<Login> {
  bool _isPassword = true;
  final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
void login(String email, password) async {
    try {
      var request = http.Request(
        'POST',
        Uri.parse(
            'http://fruitseasonapi-001-site1.atempurl.com/api/auths/login'),
      );
       request.headers['Content-Type'] = 'application/json; charset=UTF-8';
      request.body = json.encode({
        'email': email,
        'password': password,
      });

      var response = await request.send();
      print('response: $response');
      if (response.statusCode != 200) {
        final snackBar = SnackBar(
          /// need to set following properties for best effect of awesome_snackbar_content
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Error',
            message: 'Login something failed.',
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
      } else {
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
      // var accessToken = jsonResponse['AccessToken'];
      // var emailStylefer = jsonResponse['Account']['Email'];
      print('$accountID');
       print('$accessToken');
      // print('AccessToken: $accessToken');
      if (accountID != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setInt('accountID', accountID);
      }
      // if (emailStylefer != null) {
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //   await prefs.setString('emailStylefer', emailStylefer);
      // }
      if (accessToken != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', accessToken);
      }
      // ignore: unrelated_type_equality_checks
      
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
        // loginBJh (2872:3707)
        width: double.infinity,
        height: 926 * fem,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // maskgrouptiu (116:961)
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
              // rectangle39kyP (122:1002)
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
              // body2vu (122:1003)
              left: 16.5410614014 * fem,
              top: 450.2958984375 * fem,
              child: Container(
                width: 393.88 * fem,
                height: 388.66 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // welcomebackKv1 (10:261)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 3.2 * fem),
                      child: Text(
                        'Welcome back !',
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
                      // signintoyouraccountSDw (10:262)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 27.47 * fem),
                      child: Text(
                        'Sign in to your account',
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
                      // emailfieldYnm (10:383)
                      margin: EdgeInsets.fromLTRB(
                          1.03 * fem, 0 * fem, 0 * fem, 0.15 * fem),
                      padding: EdgeInsets.fromLTRB(
                          15.95 * fem, 0 * fem, 0 * fem, 1.23 * fem),
                      // Add a finite width constraint to the parent Container
                      width: 380.0, // Adjust the width according to your layout
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // groupdpD (10:269)
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
                            // Use Expanded to constrain the width of TextFormField
                            child: TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
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
                      // passwordfieldUZw (10:381)
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
                            // group5wTX (10:287)
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
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  fontSize: 15 * fem,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff868889),
                                ),
                                suffixIcon: IconButton(
                                  icon:
                                      // ignore: dead_code
                                      _isPassword
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
                      // autogroupqxx9svq (2G1L2QtcrkHCoLpBS5Qxx9)
                      margin: EdgeInsets.fromLTRB(
                          10.93 * fem, 0 * fem, 13.84 * fem, 18.2 * fem),
                      width: double.infinity,
                      height: 23 * fem,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // remembertogglennu (10:432)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 76.39 * fem, 0 * fem),
                            height: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // group67aH (10:306)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 1.72 * fem, 9.75 * fem, 0 * fem),
                                  width: 29.98 * fem,
                                  height: 16.48 * fem,
                                  child: Image.asset(
                                    'assets/mobile/images/group-6.png',
                                    width: 29.98 * fem,
                                    height: 16.48 * fem,
                                  ),
                                ),
                                Text(
                                  // remembermeDtD (10:302)
                                  'Remember me',
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
                            // forgotpasswordxL1 (10:308)
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
                              'Forgot password',
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
                          'Login',
                          style: TextStyle(
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // donthaveanaccountsignup7s7 (10:238)
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
                                text: 'Don’t have an account ?',
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
                                text: 'Sign up',
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
    ));
  }
}
