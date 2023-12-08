import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

import 'SignIn.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // forgotpasswordLos (2872:3709)
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff4f5f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupux7xSru (2G1FEYscBuuuU5MmiuuX7X)
              padding: EdgeInsets.fromLTRB(
                  13 * fem, 17 * fem, 9 * fem, 129.83 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // titlebaruR3 (135:992)
                    margin: EdgeInsets.fromLTRB(
                        4.57 * fem, 30 * fem, 129.95 * fem, 129.89 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // backarrowEiD (15:1003)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 100.7 * fem, 0.13 * fem),
                          width: 23.78 * fem,
                          height: 16.54 * fem,
                          child: Image.asset(
                            'assets/mobile/images/backarrow.png',
                            width: 23.78 * fem,
                            height: 16.54 * fem,
                          ),
                        ),
                        Text(
                          // findyouremail94V (135:993)
                          'Quên mật khẩu',
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
                  Container(
                    // bodyf2q (137:1090)
                    margin: EdgeInsets.fromLTRB(
                        5 * fem, 0 * fem, 8.15 * fem, 0 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogrouphoqjNxq (2G1FR3a7wjRvE6Tt3UHoqj)
                          padding: EdgeInsets.fromLTRB(
                              57.44 * fem, 0 * fem, 57.41 * fem, 47.72 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // findyouraccounttwB (10:436)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 7.55 * fem, 22 * fem),
                                child: Text(
                                  'Tạo mật khẩu mới',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 25 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                // pleaseenteryouremailaddresstos (137:956)
                                constraints: BoxConstraints(
                                  maxWidth: 278 * fem,
                                ),
                                child: Text(
                                  'Vui lòng nhập mật khẩu mới của bạn.',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    letterSpacing: 0.45 * fem,
                                    color: Color(0xff4a4844),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // emailfieldVg5 (135:1002)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 13.44 * fem),
                          padding: EdgeInsets.fromLTRB(28.95 * fem, 9.64 * fem,
                              20.42 * fem, 25.37 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // groupBYu (135:1004)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 21.71 * fem, 0.76 * fem),
                                width: 23.78 * fem,
                                height: 18.11 * fem,
                                child: Image.asset(
                                  'assets/mobile/images/group-9Qu.png',
                                  width: 23.78 * fem,
                                  height: 18.11 * fem,
                                ),
                              ),
                              Expanded(
                                // Use Expanded to constrain the width of TextFormField
                                child: TextFormField(
                                  // emailaddressMER (10:288)
                                  decoration: InputDecoration(
                                    labelText: 'Nhập mật khẩu mới',
                                    labelStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.45 * fem,
                                      color: Color(0xff868889),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),

                            ],
                          ),
                        ),
                        Container(
                          // emailfieldVg5 (135:1002)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 13.44 * fem),
                          padding: EdgeInsets.fromLTRB(28.95 * fem, 9.64 * fem,
                              20.42 * fem, 25.37 * fem),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(5 * fem),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // groupBYu (135:1004)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 21.71 * fem, 0.76 * fem),
                                width: 23.78 * fem,
                                height: 18.11 * fem,
                                child: Image.asset(
                                  'assets/mobile/images/group-9Qu.png',
                                  width: 23.78 * fem,
                                  height: 18.11 * fem,
                                ),
                              ),
                              Expanded(
                                // Use Expanded to constrain the width of TextFormField
                                child: TextFormField(
                                  // emailaddressMER (10:288)
                                  decoration: InputDecoration(
                                    labelText: 'Xác minh lại mật khẩu mới',
                                    labelStyle: TextStyle(
                                      fontSize: 15 * ffem,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 0.45 * fem,
                                      color: Color(0xff868889),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 62.01 * fem,
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
                            child: Center(
                              child: Text(
                                'Gửi',
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
    ));
  }
}
