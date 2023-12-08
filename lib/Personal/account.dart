import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Order/ListOrder.dart';
import '../SignIn/SignIn.dart';
import 'about-me.dart';
import 'VoiceToText.dart';
import 'address.dart';

class Personal extends StatefulWidget {
  @override
  State<Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
  _signout() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final email = prefs.getString('email');
    print('email: $email');

    var url =
        'https://fruitseasonms.azurewebsites.net/api/auths/logout';

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };

    var body = jsonEncode(email);

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      var statusCode = response.statusCode;
      print('Status code: $statusCode');

      if (response.statusCode == 200) {
        print('đã đăng xuất');
      } else if (response.statusCode != 200) {
        var responseString = response.body;
        var responseBody = json.decode(responseString);
        var errorMessage = responseBody['errors'];

        print('Response body: $responseString');
        print('Error 400: $errorMessage');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          title: Text('Thông tin tài khoản',
              style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
         
        ),
        body: Container(
          width: double.infinity,
          child: Container(
            // accountjLd (2953:1152)
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xfff4f5f9),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // avatarn1P (93:1607)
                  margin: EdgeInsets.fromLTRB(
                      156 * fem, 20 * fem, 153.21 * fem, 28.08 * fem),
                  width: double.infinity,
                  height: 120.92 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // maskgroupJEd (93:1570)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 118.79 * fem,
                            height: 117.82 * fem,
                            child: Image.asset(
                              'assets/mobile/images/mask-group.png',
                              width: 118.79 * fem,
                              height: 117.82 * fem,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // group191rQZ (93:1606)
                        left: 81.2803726196 * fem,
                        top: 96.1137695312 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 25.01 * fem,
                            height: 24.8 * fem,
                            child: Image.asset(
                              'assets/mobile/images/group-191.png',
                              width: 25.01 * fem,
                              height: 24.8 * fem,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // oliviaaustinXWh (93:1571)
                  margin:
                      EdgeInsets.fromLTRB(3 * fem, 0 * fem, 0 * fem, 2 * fem),
                  child: Text(
                    'Olivia Austin',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3333333333 * ffem / fem,
                      letterSpacing: -0.5 * fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // oliviaaustingmailcomd3w (93:1572)
                  margin:
                      EdgeInsets.fromLTRB(2 * fem, 0 * fem, 0 * fem, 48 * fem),
                  child: Text(
                    'oliviaaustin@gmail.com',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.6666666667 * ffem / fem,
                      letterSpacing: -0.5 * fem,
                      color: Color(0xff868889),
                    ),
                  ),
                ),
                Container(
                  // bodyXQD (155:985)
                  margin: EdgeInsets.fromLTRB(
                      42.04 * fem, 0 * fem, 31.12 * fem, 108.23 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        // aboutmeejj (94:858)
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AboutMe()),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // groupmZT (94:864)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 15.63 * fem, 0 * fem),
                                width: 20.84 * fem,
                                height: 20.67 * fem,
                                child: Image.asset(
                                  'assets/mobile/images/group-DJH.png',
                                  width: 20.84 * fem,
                                  height: 20.67 * fem,
                                ),
                              ),
                              Container(
                                // aboutmee7T (94:859)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 244.41 * fem, 0.6 * fem),
                                child: Text(
                                  'Giới thiệu',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 12 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    letterSpacing: 0.36 * fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // groupLky (94:860)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                width: 10.96 * fem,
                                height: 18.6 * fem,
                                child: Image.asset(
                                  'assets/mobile/images/group-KjF.png',
                                  width: 10.96 * fem,
                                  height: 18.6 * fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // autogroupv6ghSZ7 (MwWhvPNkkJKU7nyksBV6gh)
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 35.56 * fem, 0 * fem, 0 * fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // myaddresskZo (94:954)
                              margin: EdgeInsets.fromLTRB(
                                  0.44 * fem, 0 * fem, 0 * fem, 53.12 * fem),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ListOrder()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // group203qr9 (94:1086)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 18.25 * fem, 0 * fem),
                                        width: 23.1 * fem,
                                        height: 25.67 * fem,
                                        child: Image.asset(
                                          'assets/mobile/images/checklist.png',
                                          width: 15.1 * fem,
                                          height: 20.67 * fem,
                                        ),
                                      ),
                                      Container(
                                        // myaddressXys (94:955)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0.41 * fem, 0.6 * fem),
                                        child: Text(
                                          'Danh sách đơn hàng',
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5 * ffem / fem,
                                            letterSpacing: 0.36 * fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                             Container(
                              // myaddresskZo (94:954)
                              margin: EdgeInsets.fromLTRB(
                                  0.44 * fem, 0 * fem, 0 * fem, 53.12 * fem),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SettingsPage()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // group203qr9 (94:1086)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 18.25 * fem, 0 * fem),
                                        width: 23.1 * fem,
                                        height: 25.67 * fem,
                                        child: Image.asset(
                                          'assets/mobile/images/microphone.png',
                                          width: 15.1 * fem,
                                          height: 20.67 * fem,
                                        ),
                                      ),
                                      Container(
                                        // myaddressXys (94:955)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0.41 * fem, 0.6 * fem),
                                        child: Text(
                                          'Voice to text',
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 12 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.5 * ffem / fem,
                                            letterSpacing: 0.36 * fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                await _signout();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Container(
                                // signoutiYZ (94:986)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 105.36 * fem, 0 * fem),
                                width: double.infinity,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 14.59 * fem, 0 * fem),
                                      width: 21.88 * fem,
                                      height: 20.76 * fem,
                                      child: Image.asset(
                                        'assets/mobile/images/group-206.png',
                                        width: 21.88 * fem,
                                        height: 20.76 * fem,
                                      ),
                                    ),
                                    Container(
                                      // signoutYGh (94:987)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0.43 * fem, 0 * fem, 0 * fem),
                                      child: Text(
                                        'Đăng xuất',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.36 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
