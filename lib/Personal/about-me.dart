import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
    body:SingleChildScrollView(
      child: Container(
        // aboutmeJ2d (3027:1081)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 37.21*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xfff4f5f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // titlebarnCh (153:982)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35.14*fem),
              padding: EdgeInsets.fromLTRB(4*fem, 50*fem, 4*fem, 29.84*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // autogroupazymuEh (MwWhVeayU1biuBEMgaaZYM)
                    margin: EdgeInsets.fromLTRB(12.77*fem, 0*fem, 162.48*fem, 0*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // backarrowQSM (86:1189)
                          margin: EdgeInsets.fromLTRB(0*fem, 0.42*fem, 126.16*fem, 0*fem),
                          width: 24.58*fem,
                          height: 17.09*fem,
                          child: Image.asset(
                            'assets/mobile/images/backarrow-W9o.png',
                            width: 24.58*fem,
                            height: 17.09*fem,
                          ),
                        ),
                        Text(
                          // aboutmefdB (86:1187)
                          'About me',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // bodyxMP (153:985)
              margin: EdgeInsets.fromLTRB(16.54*fem, 0*fem, 17.12*fem, 0*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // personaldetailrhf (153:983)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.46*fem, 29.21*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // personaldetailsYaV (86:1257)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 12.91*fem),
                          child: Text(
                            'Personal Details',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group170Dgd (86:1304)
                          margin: EdgeInsets.fromLTRB(0.46*fem, 0*fem, 0*fem, 0*fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group125KDs (86:1197)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.57*fem, 6.6*fem),
                                padding: EdgeInsets.fromLTRB(17.57*fem, 18.6*fem, 215.75*fem, 18.6*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5*fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // groupkpy (86:1199)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21.71*fem, 0*fem),
                                      width: 24.81*fem,
                                      height: 24.8*fem,
                                      child: Image.asset(
                                        'assets/mobile/images/group-9BP.png',
                                        width: 24.81*fem,
                                        height: 24.8*fem,
                                      ),
                                    ),
                                    Container(
                                      // nguyenvanaEEM (86:1201)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0.26*fem, 0*fem, 0*fem),
                                      child: Text(
                                        'Nguyen Van A',
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5*ffem/fem,
                                          letterSpacing: 0.45*fem,
                                          color: Color(0xff868889),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group106nM (86:1191)
                                margin: EdgeInsets.fromLTRB(0.57*fem, 0*fem, 0*fem, 5.17*fem),
                                padding: EdgeInsets.fromLTRB(18.61*fem, 19.64*fem, 131.75*fem, 19.37*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5*fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // groupZR3 (86:1193)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0.32*fem, 21.71*fem, 0*fem),
                                      width: 23.78*fem,
                                      height: 18.11*fem,
                                      child: Image.asset(
                                        'assets/mobile/images/group-tnm.png',
                                        width: 23.78*fem,
                                        height: 18.11*fem,
                                      ),
                                    ),
                                    Text(
                                      // nguyena123gmailcomr9F (86:1196)
                                      'nguyenA123@gmail.com',
                                      style: SafeGoogleFont (
                                        'Poppins',
                                        fontSize: 15*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5*ffem/fem,
                                        letterSpacing: 0.45*fem,
                                        color: Color(0xff868889),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group11kVX (86:1202)
                                margin: EdgeInsets.fromLTRB(0.57*fem, 0*fem, 0*fem, 0*fem),
                                padding: EdgeInsets.fromLTRB(18.65*fem, 18.6*fem, 210.75*fem, 19.37*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5*fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // telephone1DP7 (86:1204)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21.76*fem, 0.26*fem),
                                      width: 23.69*fem,
                                      height: 23.77*fem,
                                      child: Image.asset(
                                        'assets/mobile/images/telephone-1.png',
                                        width: 23.69*fem,
                                        height: 23.77*fem,
                                      ),
                                    ),
                                    Container(
                                      // VbX (86:1207)
                                      margin: EdgeInsets.fromLTRB(0*fem, 1.03*fem, 0*fem, 0*fem),
                                      child: Text(
                                        '095553320142 ',
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5*ffem/fem,
                                          letterSpacing: 0.45*fem,
                                          color: Color(0xff868889),
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
                  Container(
                    // changepassowordPS1 (153:984)
                    margin: EdgeInsets.fromLTRB(0.46*fem, 0*fem, 0*fem, 161.98*fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // changepassword65X (86:1258)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17.44*fem),
                          child: Text(
                            'Change Password',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 18*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5*ffem/fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // group169y9K (94:801)
                          margin: EdgeInsets.fromLTRB(1.03*fem, 0*fem, 0*fem, 0*fem),
                          width: 392.85*fem,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group9sEh (94:820)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.17*fem),
                                padding: EdgeInsets.fromLTRB(17.57*fem, 18.6*fem, 185.75*fem, 19.37*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5*fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group5Lty (94:823)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.69*fem, 0.26*fem),
                                      width: 17.83*fem,
                                      height: 23.77*fem,
                                      child: Image.asset(
                                        'assets/mobile/images/group-5-tch.png',
                                        width: 17.83*fem,
                                        height: 23.77*fem,
                                      ),
                                    ),
                                    Container(
                                      // currentpassworddNH (94:822)
                                      margin: EdgeInsets.fromLTRB(0*fem, 1.03*fem, 0*fem, 0*fem),
                                      child: Text(
                                        'Current password',
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5*ffem/fem,
                                          letterSpacing: 0.45*fem,
                                          color: Color(0xff868889),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group8KF7 (94:802)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5.17*fem),
                                padding: EdgeInsets.fromLTRB(17.57*fem, 18.6*fem, 15.18*fem, 19.64*fem),
                                width: double.infinity,
                                height: 62.01*fem,
                                decoration: BoxDecoration (
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5*fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group5BYD (94:810)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.69*fem, 0*fem),
                                      width: 17.83*fem,
                                      height: 23.77*fem,
                                      child: Image.asset(
                                        'assets/mobile/images/group-5.png',
                                        width: 17.83*fem,
                                        height: 23.77*fem,
                                      ),
                                    ),
                                    Container(
                                      // group175Nh (94:804)
                                      margin: EdgeInsets.fromLTRB(0*fem, 7.23*fem, 212.97*fem, 6.2*fem),
                                      height: double.infinity,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // ellipse4PeH (94:805)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.14*fem, 0*fem),
                                            width: 10.34*fem,
                                            height: 10.33*fem,
                                            child: Image.asset(
                                              'assets/mobile/images/ellipse-4.png',
                                              width: 10.34*fem,
                                              height: 10.33*fem,
                                            ),
                                          ),
                                          Container(
                                            // ellipse551K (94:806)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.14*fem, 0*fem),
                                            width: 10.34*fem,
                                            height: 10.33*fem,
                                            child: Image.asset(
                                              'assets/mobile/images/ellipse-5.png',
                                              width: 10.34*fem,
                                              height: 10.33*fem,
                                            ),
                                          ),
                                          Container(
                                            // ellipse6BKF (94:807)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.14*fem, 0*fem),
                                            width: 10.34*fem,
                                            height: 10.33*fem,
                                            child: Image.asset(
                                              'assets/mobile/images/ellipse-6.png',
                                              width: 10.34*fem,
                                              height: 10.33*fem,
                                            ),
                                          ),
                                          Container(
                                            // ellipse7HdB (94:808)
                                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.14*fem, 0*fem),
                                            width: 10.34*fem,
                                            height: 10.33*fem,
                                            child: Image.asset(
                                              'assets/mobile/images/ellipse-7.png',
                                              width: 10.34*fem,
                                              height: 10.33*fem,
                                            ),
                                          ),
                                          Container(
                                            // ellipse8CVF (94:809)
                                            width: 10.34*fem,
                                            height: 10.33*fem,
                                            child: Image.asset(
                                              'assets/mobile/images/ellipse-8.png',
                                              width: 10.34*fem,
                                              height: 10.33*fem,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // group78Nu (94:813)
                                      margin: EdgeInsets.fromLTRB(0*fem, 1.94*fem, 0*fem, 0*fem),
                                      width: 27.38*fem,
                                      height: 17.44*fem,
                                      child: Image.asset(
                                        'assets/mobile/images/group-7.png',
                                        width: 27.38*fem,
                                        height: 17.44*fem,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group10daZ (94:826)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                padding: EdgeInsets.fromLTRB(17.57*fem, 18.6*fem, 181.75*fem, 19.37*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(5*fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group5u2H (94:829)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 28.69*fem, 0.26*fem),
                                      width: 17.83*fem,
                                      height: 23.77*fem,
                                      child: Image.asset(
                                        'assets/mobile/images/group-5-F93.png',
                                        width: 17.83*fem,
                                        height: 23.77*fem,
                                      ),
                                    ),
                                    Container(
                                      // confirmpasswordzJd (94:828)
                                      margin: EdgeInsets.fromLTRB(0*fem, 1.03*fem, 0*fem, 0*fem),
                                      child: Text(
                                        'Confirm password',
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5*ffem/fem,
                                          letterSpacing: 0.45*fem,
                                          color: Color(0xff868889),
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
                  Container(
                    // primarybuttonfvZ (86:1190)
                    margin: EdgeInsets.fromLTRB(1.03*fem, 0*fem, 0.46*fem, 0*fem),
                    width: double.infinity,
                    height: 62.01*fem,
                    decoration: BoxDecoration (
                      color: Color(0xff6cc51d),
                      borderRadius: BorderRadius.circular(5*fem),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x3f6cc51d),
                          offset: Offset(0*fem, 10*fem),
                          blurRadius: 4.5*fem,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Save settings',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5*ffem/fem,
                          color: Color(0xffffffff),
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
    )
          );
  }
}