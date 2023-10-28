import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class NotificationClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body:Container(
      width: double.infinity,
      child: Container(
        // notification5gu (3027:1188)
        width: double.infinity,
        height: 942*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // frame271K (3027:1189)
              left: 0*fem,
              top: 187*fem,
              child: Container(
                width: 428*fem,
                height: 750*fem,
                child: Align(
                  // backgroundBG5 (3027:1190)
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 686*fem,
                    child: Container(
                      decoration: BoxDecoration (
                        color: Color(0xfff4f5f9),
                      ),
                    ),
                  ),
                ),
              ),
            ),
           
            Positioned(
              // titlebar6ZP (3027:1204)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                width: 428*fem,
                height: 187*fem,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      // searchfieldoCu (3027:1206)
                      left: 18*fem,
                      top: 118*fem,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(23.85*fem, 14*fem, 22.72*fem, 13*fem),
                        width: 393*fem,
                        height: 50*fem,
                        decoration: BoxDecoration (
                          color: Color(0xfff4f5f9),
                          borderRadius: BorderRadius.circular(5*fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // group694Pj (I3027:1206;2888:1196)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 144.02*fem, 0*fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // group21zgh (I3027:1206;2888:1197)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21.58*fem, 1*fem),
                                    width: 22.72*fem,
                                    height: 20*fem,
                                    child: Image.asset(
                                      'assets/mobile/images/group-21.png',
                                      width: 22.72*fem,
                                      height: 20*fem,
                                    ),
                                  ),
                                  Text(
                                    // searchkeywordsgpR (I3027:1206;2888:1202)
                                    'Search keywords..',
                                    style: SafeGoogleFont (
                                      'Poppins',
                                      fontSize: 15*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.5*ffem/fem,
                                      color: Color(0xff868889),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // groupy2q (I3027:1206;2888:1192)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.48*fem),
                              width: 21.11*fem,
                              height: 16.95*fem,
                              child: Image.asset(
                                'assets/mobile/images/group.png',
                                width: 21.11*fem,
                                height: 16.95*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // notificationcrV (3027:1207)
                      left: 159.0169029236*fem,
                      top: 63*fem,
                      child: Align(
                        child: SizedBox(
                          width: 111*fem,
                          height: 27*fem,
                          child: Text(
                            'Notification',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5*ffem/fem,
                              letterSpacing: 0.54*fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // backarrowGg9 (3027:1208)
                      left: 16.7707977295*fem,
                      top: 68*fem,
                      child: Align(
                        child: SizedBox(
                          width: 24.58*fem,
                          height: 16.54*fem,
                          child: Image.asset(
                            'assets/mobile/images/backarrow.png',
                            width: 24.58*fem,
                            height: 16.54*fem,
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
      )
          );
  }
}