import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

import 'create.dart';

class CreateCrop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        // createcroppfz (3154:3209)
        width: double.infinity,
        height: 926*fem,
        decoration: BoxDecoration (
          color: Color(0xfff4f5f9),
        ),
        child: Stack(
          children: [
            Positioned(
              // bodyqzQ (3154:3211)
              left: 18*fem,
              top: 358*fem,
              child: Container(
                width: 392.88*fem,
                height: 532.71*fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // detailYP2 (3154:3213)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.88*fem, 230.7*fem),
                      width: 392*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(5*fem),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // nameFHS (3154:3224)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25*fem),
                            padding: EdgeInsets.fromLTRB(15*fem, 15*fem, 14*fem, 18*fem),
                            width: double.infinity,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5*fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // autogroup5vrpAHv (LtKm1Qis7xiVU76N9K5Vrp)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14*fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // varietyname5fn (3154:3226)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 200*fem, 0*fem),
                                        child: RichText(
                                          text: TextSpan(
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 15*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              letterSpacing: 0.45*fem,
                                              color: Color(0xff868889),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Variety name',
                                                style: SafeGoogleFont (
                                                  'Poppins',
                                                  fontSize: 15*ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5*ffem/fem,
                                                  letterSpacing: 0.45*fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: SafeGoogleFont (
                                                  'Poppins',
                                                  fontSize: 15*ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5*ffem/fem,
                                                  letterSpacing: 0.45*fem,
                                                  color: Color(0xffe74c3c),
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' ',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // 3nx (3154:3228)
                                        '12/50',
                                        textAlign: TextAlign.right,
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
                                Text(
                                  // gardenwithnameNaL (3154:3227)
                                  'Garden with name ',
                                  style: SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 13*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5*ffem/fem,
                                    letterSpacing: 0.39*fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // descriptionhMi (3154:3219)
                            padding: EdgeInsets.fromLTRB(15*fem, 15*fem, 14*fem, 14*fem),
                            width: double.infinity,
                            decoration: BoxDecoration (
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5*fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupphrabhz (LtKkgfm6GiHtyDQTRtPhRA)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14*fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // description7wE (3154:3221)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 192*fem, 0*fem),
                                        child: RichText(
                                          text: TextSpan(
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 15*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              letterSpacing: 0.45*fem,
                                              color: Color(0xff868889),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Description',
                                                style: SafeGoogleFont (
                                                  'Poppins',
                                                  fontSize: 15*ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5*ffem/fem,
                                                  letterSpacing: 0.45*fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              TextSpan(
                                                text: '*',
                                                style: SafeGoogleFont (
                                                  'Poppins',
                                                  fontSize: 15*ffem,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.5*ffem/fem,
                                                  letterSpacing: 0.45*fem,
                                                  color: Color(0xffe74c3c),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // 1v8 (3154:3223)
                                        '234/1000',
                                        textAlign: TextAlign.right,
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
                                  // inmostregionsthesoilisnotwarme (3154:3222)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                                  constraints: BoxConstraints (
                                    maxWidth: 359*fem,
                                  ),
                                  child: Text(
                                    'In most regions, the soil is not warm enough to plant tomatoes outdoors until late spring and early summer, except in zone 10, where they are a fall and winter crop.',
                                    style: SafeGoogleFont (
                                      'Poppins',
                                      fontSize: 13*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5*ffem/fem,
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
                    Container(
                      // primarybuttonN8Q (3154:3212)
                      margin: EdgeInsets.fromLTRB(0.03*fem, 0*fem, 0*fem, 0*fem),
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
                          'Save change',
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
            ),
            Positioned(
              // rectangle60aEU (3154:3250)
              left: 0*fem,
              top: 122*fem,
              child: Align(
                child: SizedBox(
                  width: 428*fem,
                  height: 200*fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5*fem),
                    child: Image.asset(
                      'assets/mobile/images/cropvariety.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // titlebarGd6 (3154:3230)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(16.77*fem, 65.11*fem, 117.56*fem, 29.84*fem),
                width: 428*fem,
                height: 121.95*fem,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Create()),
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
                      // createcropvariety4J4 (3154:3232)
                      'Create Crop Variety',
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
            ),
        
          ],
        ),
      ),
          );
  }
}