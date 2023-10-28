import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

import 'create.dart';

class CreatePlant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        // createplantpv4 (3154:3169)
        width: double.infinity,
        height: 1056 * fem,
        decoration: BoxDecoration(
          color: Color(0xfff4f5f9),
        ),
        child: Stack(
          children: [
            Positioned(
              // primarybuttonYr4 (3154:3172)
              left: 18.0338134766 * fem,
              top: 988.6962890625 * fem,
              child: Container(
                width: 392.85 * fem,
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
            ),
            Positioned(
              // frame170mTv (3160:1162)
              left: 18 * fem,
              top: 147 * fem,
              child: Container(
                width: 392 * fem,
                height: 866 * fem,
                child: Container(
                  // bodyWAc (3154:3171)
                  width: double.infinity,
                  height: 847 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // imageenc (3160:1169)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 177 * fem, 25 * fem),
                        width: double.infinity,
                        height: 106 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // autogroupxenuMwv (LtKnQxDKwD1oLHXGvzxENU)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 12 * fem, 0 * fem),
                              width: 103 * fem,
                              height: double.infinity,
                              child: Stack(
                                children: [
                                  Positioned(
                                    // image3tS4 (3160:1168)
                                    left: 0 * fem,
                                    top: 6 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 100 * fem,
                                        height: 100 * fem,
                                        child: Image.asset(
                                          'assets/mobile/images/plant.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    // ellipse35Che (3160:1170)
                                    left: 93 * fem,
                                    top: 0 * fem,
                                    child: Align(
                                      child: SizedBox(
                                        width: 10 * fem,
                                        height: 10 * fem,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5 * fem),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                'assets/mobile/images/ellipse-35-bg.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group2465mS (3154:3266)
                              width: 100 * fem,
                              height: 100 * fem,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff000000)),
                                color: Color(0xffffffff),
                              ),
                              child: Center(
                                child: Text(
                                  'Add image',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 10 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    letterSpacing: 0.3 * fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // detailmPN (3154:3173)
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5 * fem),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // inforWLx (3160:1159)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 25 * fem),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5 * fem),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // basicinformation2q6 (3160:1160)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 15 * fem),
                                    child: Text(
                                      'Basic information',
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 * ffem / fem,
                                        letterSpacing: 0.45 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // name2Cp (3154:3184)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        15 * fem, 15 * fem, 14 * fem, 18 * fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // autogroupr84y5wn (LtKnGNdHhweVDmAAqxR84Y)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 14 * fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // plantnameD2Q (3154:3186)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    216 * fem,
                                                    0 * fem),
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 15 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5 * ffem / fem,
                                                      letterSpacing: 0.45 * fem,
                                                      color: Color(0xff868889),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Plant name',
                                                        style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height:
                                                              1.5 * ffem / fem,
                                                          letterSpacing:
                                                              0.45 * fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '*',
                                                        style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height:
                                                              1.5 * ffem / fem,
                                                          letterSpacing:
                                                              0.45 * fem,
                                                          color:
                                                              Color(0xffe74c3c),
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
                                                // oep (3154:3188)
                                                '12/50',
                                                textAlign: TextAlign.right,
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
                                        Text(
                                          // gardenwithnameka4 (3154:3187)
                                          'Garden with name ',
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 13 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5 * ffem / fem,
                                            letterSpacing: 0.39 * fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // descriptionHZz (3154:3179)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        15 * fem, 11 * fem, 14 * fem, 18 * fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // autogroup4rfvaZ6 (LtKn6dQXWFfcoTZVqJ4Rfv)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 14 * fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // descriptioni9W (3154:3181)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    192 * fem,
                                                    0 * fem),
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 15 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5 * ffem / fem,
                                                      letterSpacing: 0.45 * fem,
                                                      color: Color(0xff868889),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Description',
                                                        style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height:
                                                              1.5 * ffem / fem,
                                                          letterSpacing:
                                                              0.45 * fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '*',
                                                        style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height:
                                                              1.5 * ffem / fem,
                                                          letterSpacing:
                                                              0.45 * fem,
                                                          color:
                                                              Color(0xffe74c3c),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                // c8Q (3154:3183)
                                                '234/1000',
                                                textAlign: TextAlign.right,
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
                                        Container(
                                          // inmostregionsthesoilisnotwarme (3154:3182)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 4 * fem, 0 * fem),
                                          constraints: BoxConstraints(
                                            maxWidth: 359 * fem,
                                          ),
                                          child: Text(
                                            'In most regions, the soil is not warm enough to plant tomatoes outdoors until late spring and early summer, except in zone 10, where they are a fall and winter crop.',
                                            style: SafeGoogleFont(
                                              'Poppins',
                                              fontSize: 13 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.5 * ffem / fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // varietymfW (3154:3174)
                                    padding: EdgeInsets.fromLTRB(
                                        15 * fem, 15 * fem, 14 * fem, 18 * fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // autogroup48b2UZv (LtKmwPAw1KNqwddnMu48B2)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 0 * fem, 14 * fem),
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                // varietynameos6 (3154:3177)
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    200 * fem,
                                                    0 * fem),
                                                child: RichText(
                                                  text: TextSpan(
                                                    style: SafeGoogleFont(
                                                      'Poppins',
                                                      fontSize: 15 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.5 * ffem / fem,
                                                      letterSpacing: 0.45 * fem,
                                                      color: Color(0xff868889),
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Variety name',
                                                        style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height:
                                                              1.5 * ffem / fem,
                                                          letterSpacing:
                                                              0.45 * fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: '*',
                                                        style: SafeGoogleFont(
                                                          'Poppins',
                                                          fontSize: 15 * ffem,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          height:
                                                              1.5 * ffem / fem,
                                                          letterSpacing:
                                                              0.45 * fem,
                                                          color:
                                                              Color(0xffe74c3c),
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
                                                // uYk (3154:3176)
                                                '12/50',
                                                textAlign: TextAlign.right,
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
                                        Text(
                                          // gardenwithnamepvc (3154:3178)
                                          'Garden with name ',
                                          style: SafeGoogleFont(
                                            'Poppins',
                                            fontSize: 13 * ffem,
                                            fontWeight: FontWeight.w500,
                                            height: 1.5 * ffem / fem,
                                            letterSpacing: 0.39 * fem,
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
                              // plantMvY (3160:1158)
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5 * fem),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // seasoninformation6NL (3160:1161)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 15 * fem),
                                    child: Text(
                                      'Season information',
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 15 * ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5 * ffem / fem,
                                        letterSpacing: 0.45 * fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // gardenbpt (3160:1146)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        15 * fem, 15 * fem, 15 * fem, 12 * fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // gardenHBv (3160:1148)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 208 * fem, 0 * fem),
                                          child: RichText(
                                            text: TextSpan(
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 15 * ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5 * ffem / fem,
                                                letterSpacing: 0.45 * fem,
                                                color: Color(0xff868889),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Garden',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '*',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xffe74c3c),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // oZa (3160:1149)
                                          '01/01/2024',
                                          textAlign: TextAlign.right,
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
                                  Container(
                                    // startwvg (3160:1138)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        15 * fem, 15 * fem, 15 * fem, 12 * fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // startdate4Ec (3160:1140)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 187 * fem, 0 * fem),
                                          child: RichText(
                                            text: TextSpan(
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 15 * ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5 * ffem / fem,
                                                letterSpacing: 0.45 * fem,
                                                color: Color(0xff868889),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Start Date',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '*',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xffe74c3c),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // n48 (3160:1141)
                                          '01/01/2024',
                                          textAlign: TextAlign.right,
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
                                  Container(
                                    // havestingXXW (3160:1142)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        15 * fem, 15 * fem, 15 * fem, 12 * fem),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // harvestingdateD9S (3160:1144)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 140 * fem, 0 * fem),
                                          child: RichText(
                                            text: TextSpan(
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 15 * ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5 * ffem / fem,
                                                letterSpacing: 0.45 * fem,
                                                color: Color(0xff868889),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Harvesting Date',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '*',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xffe74c3c),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // KLt (3160:1145)
                                          '01/01/2024',
                                          textAlign: TextAlign.right,
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
                                  Container(
                                    // quantityplantf9r (3160:1150)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        15 * fem, 15 * fem, 15 * fem, 12 * fem),
                                    width: double.infinity,
                                    height: 50 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // quantityplanted9qi (3160:1152)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 184 * fem, 0 * fem),
                                          child: RichText(
                                            text: TextSpan(
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 15 * ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5 * ffem / fem,
                                                letterSpacing: 0.45 * fem,
                                                color: Color(0xff868889),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Quantity planted',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '*',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xffe74c3c),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // 3Jp (3160:1153)
                                          '1000',
                                          textAlign: TextAlign.right,
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
                                  Container(
                                    // havestingquantityb5S (3160:1154)
                                    padding: EdgeInsets.fromLTRB(
                                        15 * fem, 15 * fem, 15 * fem, 12 * fem),
                                    width: double.infinity,
                                    height: 50 * fem,
                                    decoration: BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius:
                                          BorderRadius.circular(5 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // estimatedquantityh8U (3160:1156)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 179 * fem, 0 * fem),
                                          child: RichText(
                                            text: TextSpan(
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 15 * ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5 * ffem / fem,
                                                letterSpacing: 0.45 * fem,
                                                color: Color(0xff868889),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'Estimated quantity',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xff000000),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: '*',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.5 * ffem / fem,
                                                    letterSpacing: 0.45 * fem,
                                                    color: Color(0xffe74c3c),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // np8 (3160:1157)
                                          '123',
                                          textAlign: TextAlign.right,
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              // titlebarv9e (3154:3190)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    16.77 * fem, 65.11 * fem, 153.06 * fem, 29.84 * fem),
                width: 428 * fem,
                height: 121.95 * fem,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Create()),
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
                      // createplantv3A (3154:3192)
                      'Create Plant',
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
            ),
            
          ],
        ),
      ),
      
    );
  }
}
