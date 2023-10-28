import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

import 'about-me.dart';
import 'address.dart';

class Personal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
    body:Container(
      width: double.infinity,
      child: Container(
        // accountjLd (2953:1152)
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfff4f5f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // titlebar3MK (3014:1169)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28*fem),
              width: double.infinity,
              height: 110*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // taskdetailY3B (3014:1171)
                    left: 161.9710083008*fem,
                    top: 63*fem,
                    child: Align(
                      child: SizedBox(
                        width: 105*fem,
                        height: 27*fem,
                        child: Text(
                          'Account',
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
                    // backarrownTK (3014:1172)
                    left: 16.7707977295*fem,
                    top: 68*fem,
                    child: Align(
                      child: SizedBox(
                        width: 24.58*fem,
                        height: 16.54*fem,
                        child: Image.asset(
                          'assets/mobile/images/backarrow-5Jh.png',
                          width: 24.58*fem,
                          height: 16.54*fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // avatarn1P (93:1607)
              margin: EdgeInsets.fromLTRB(156*fem, 0*fem, 153.21*fem, 28.08*fem),
              width: double.infinity,
              height: 120.92*fem,
              child: Stack(
                children: [
                  Positioned(
                    // maskgroupJEd (93:1570)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 118.79*fem,
                        height: 117.82*fem,
                        child: Image.asset(
                          'assets/mobile/images/mask-group.png',
                          width: 118.79*fem,
                          height: 117.82*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group191rQZ (93:1606)
                    left: 81.2803726196*fem,
                    top: 96.1137695312*fem,
                    child: Align(
                      child: SizedBox(
                        width: 25.01*fem,
                        height: 24.8*fem,
                        child: Image.asset(
                          'assets/mobile/images/group-191.png',
                          width: 25.01*fem,
                          height: 24.8*fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // oliviaaustinXWh (93:1571)
              margin: EdgeInsets.fromLTRB(3*fem, 0*fem, 0*fem, 2*fem),
              child: Text(
                'Olivia Austin',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 15*ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.3333333333*ffem/fem,
                  letterSpacing: -0.5*fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              // oliviaaustingmailcomd3w (93:1572)
              margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 48*fem),
              child: Text(
                'oliviaaustin@gmail.com',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 12*ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.6666666667*ffem/fem,
                  letterSpacing: -0.5*fem,
                  color: Color(0xff868889),
                ),
              ),
            ),
            Container(
              // bodyXQD (155:985)
              margin: EdgeInsets.fromLTRB(42.04*fem, 0*fem, 31.12*fem, 108.23*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    // aboutmeejj (94:858)
                    onPressed: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutMe()),
                        );
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // groupmZT (94:864)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15.63*fem, 0*fem),
                            width: 20.84*fem,
                            height: 20.67*fem,
                            child: Image.asset(
                              'assets/mobile/images/group-DJH.png',
                              width: 20.84*fem,
                              height: 20.67*fem,
                            ),
                          ),
                          Container(
                            // aboutmee7T (94:859)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 244.41*fem, 0.6*fem),
                            child: Text(
                              'About me',
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 12*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5*ffem/fem,
                                letterSpacing: 0.36*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // groupLky (94:860)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                            width: 10.96*fem,
                            height: 18.6*fem,
                            child: Image.asset(
                              'assets/mobile/images/group-KjF.png',
                              width: 10.96*fem,
                              height: 18.6*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // autogroupv6ghSZ7 (MwWhvPNkkJKU7nyksBV6gh)
                    padding: EdgeInsets.fromLTRB(0*fem, 35.56*fem, 0*fem, 0*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // myaddresskZo (94:954)
                          margin: EdgeInsets.fromLTRB(0.44*fem, 0*fem, 0*fem, 53.12*fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyAddress()),
                        );
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // group203qr9 (94:1086)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 18.25*fem, 0*fem),
                                    width: 15.1*fem,
                                    height: 20.67*fem,
                                    child: Image.asset(
                                      'assets/mobile/images/group-203.png',
                                      width: 15.1*fem,
                                      height: 20.67*fem,
                                    ),
                                  ),
                                  Container(
                                    // myaddressXys (94:955)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 232.41*fem, 0.6*fem),
                                    child: Text(
                                      'My Address',
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5*ffem/fem,
                                        letterSpacing: 0.36*fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // groupd1K (94:956)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                    width: 10.96*fem,
                                    height: 18.6*fem,
                                    child: Image.asset(
                                      'assets/mobile/images/group-UiM.png',
                                      width: 10.96*fem,
                                      height: 18.6*fem,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // signoutiYZ (94:986)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 105.36*fem, 0*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group206SUZ (94:1140)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14.59*fem, 0*fem),
                                width: 21.88*fem,
                                height: 20.76*fem,
                                child: Image.asset(
                                  'assets/mobile/images/group-206.png',
                                  width: 21.88*fem,
                                  height: 20.76*fem,
                                ),
                              ),
                              Container(
                                // signoutYGh (94:987)
                                margin: EdgeInsets.fromLTRB(0*fem, 0.43*fem, 0*fem, 0*fem),
                                child: Text(
                                  'Sign out',
                                  style: SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5*ffem/fem,
                                    letterSpacing: 0.36*fem,
                                    color: Color(0xff000000),
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
            
          ],
        ),
      ),
    )
          );
    
  }
}