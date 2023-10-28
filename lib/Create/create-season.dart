import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

import 'create.dart';

class CreateSeason extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        // createseasonB7e (3145:2654)
        width: double.infinity,
        height: 926 * fem,
        decoration: BoxDecoration(
          color: Color(0xfff4f5f9),
        ),
        child: Stack(
          children: [
            Positioned(
              // body71J (3149:2887)
              left: 18 * fem,
              top: 358 * fem,
              child: Container(
                width: 392.88 * fem,
                height: 532.71 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // detail2e4 (3149:2922)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0.88 * fem, 80.7 * fem),
                      width: 392 * fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // nameMRS (3149:2935)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 15 * fem, 18 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // autogroupzzbrTzG (LtKpk8q5VyWjJLiJF6Zzbr)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 14 * fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // seasonnamezjJ (3149:2940)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 197 * fem, 0 * fem),
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
                                                text: 'Season name',
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
                                              TextSpan(
                                                text: ' ',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // r9E (3154:3123)
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
                                  // gardenwithnamen2t (3152:2945)
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
                          SizedBox(
                            height: 25 * fem,
                          ),
                          Container(
                            // description6JU (3152:2946)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 18 * fem, 14 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroup86fanSC (LtKpayRgHVqe2vjQhF86Fa)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 14 * fem),
                                  width: double.infinity,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // descriptionKBE (3152:2948)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 188 * fem, 0 * fem),
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
                                                text: 'Description',
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
                                        // 9Jg (3154:3124)
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
                                  // inmostregionsthesoilisnotwarme (3152:2949)
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
                          SizedBox(
                            height: 25 * fem,
                          ),
                          Container(
                            // start4px (3152:2950)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 15 * fem, 12 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // startdateyBE (3152:2952)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 187 * fem, 0 * fem),
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
                                  // FY4 (3152:2957)
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
                          SizedBox(
                            height: 25 * fem,
                          ),
                          Container(
                            // endyyr (3152:2954)
                            padding: EdgeInsets.fromLTRB(
                                15 * fem, 15 * fem, 15 * fem, 12 * fem),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5 * fem),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // enddateJmE (3152:2956)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 268 * fem, 0 * fem),
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
                                          text: 'End Date',
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
                                Container(
                                  // next2eTi (3152:2959)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 2 * fem),
                                  width: 15 * fem,
                                  height: 15 * fem,
                                  child: Image.asset(
                                    'assets/mobile/images/next-2.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // primarybuttonmoE (3149:2888)
                      margin: EdgeInsets.fromLTRB(
                          0.03 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: double.infinity,
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
                  ],
                ),
              ),
            ),
            Positioned(
              // rectangle58QbJ (3152:2960)
              left: 0 * fem,
              top: 122 * fem,
              child: Align(
                child: SizedBox(
                  width: 428 * fem,
                  height: 200 * fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5 * fem),
                    child: Image.asset(
                      'assets/mobile/images/season.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // titlebarVse (3145:2683)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    16.77 * fem, 65.11 * fem, 142.56 * fem, 29.84 * fem),
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
                      // createseasonUUg (3145:2685)
                      'Create Season',
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
