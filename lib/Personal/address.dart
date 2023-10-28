import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class MyAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        // addressHow (3027:1082)
        padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 37.21 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xfff4f5f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // titlebarmUD (137:1101)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 25.84 * fem),
              padding:
                  EdgeInsets.fromLTRB(4 * fem, 50 * fem, 4 * fem, 29.84 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupxichTvh (MwWgGWxq88CkCbxjHuXicH)
                    margin: EdgeInsets.fromLTRB(
                        12.77 * fem, 0 * fem, 13.57 * fem, 0 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // backarrowmwP (86:1448)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0.42 * fem, 117.15 * fem, 0 * fem),
                          width: 24.58 * fem,
                          height: 17.09 * fem,
                          child: Image.asset(
                            'assets/mobile/images/backarrow-SB3.png',
                            width: 24.58 * fem,
                            height: 17.09 * fem,
                          ),
                        ),
                        Container(
                          // myaddresssDj (86:1446)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 117.15 * fem, 0 * fem),
                          child: Text(
                            'My Address',
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
                        ),
                        Container(
                          // add1Z6Z (86:1563)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 1.16 * fem),
                          width: 23.78 * fem,
                          height: 23.77 * fem,
                          child: Image.asset(
                            'assets/mobile/images/add-1.png',
                            width: 23.78 * fem,
                            height: 23.77 * fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // bodyTSq (139:957)
              margin: EdgeInsets.fromLTRB(
                  17.57 * fem, 0 * fem, 17.57 * fem, 0 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // defaultaddressC9X (89:1836)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 189.13 * fem),
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 34.1 * fem, 0 * fem, 74.41 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group174tY9 (89:1835)
                          margin: EdgeInsets.fromLTRB(
                              19.64 * fem, 0 * fem, 16.54 * fem, 24.27 * fem),
                          width: double.infinity,
                          height: 71.84 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group142CHw (86:1459)
                                margin: EdgeInsets.fromLTRB(0 * fem, 2.07 * fem,
                                    15.51 * fem, 1.56 * fem),
                                padding: EdgeInsets.fromLTRB(21.71 * fem,
                                    18.16 * fem, 21.71 * fem, 17.88 * fem),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/mobile/images/ellipse-28.png',
                                    ),
                                  ),
                                ),
                                child: Center(
                                  // group68R (86:1573)
                                  child: SizedBox(
                                    width: 24.81 * fem,
                                    height: 32.18 * fem,
                                    child: Image.asset(
                                      'assets/mobile/images/group-6QR.png',
                                      width: 24.81 * fem,
                                      height: 32.18 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                // group144oYd (86:1453)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 96.32 * fem, 0 * fem),
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // nguyenvanawPw (86:1454)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 0.77 * fem),
                                      child: Text(
                                        'Nguyen Van A',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.45 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // crescentdaylaportcaliforniauni (86:1455)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 3.07 * fem),
                                      constraints: BoxConstraints(
                                        maxWidth: 158 * fem,
                                      ),
                                      child: Text(
                                        '2811 Crescent Day. LA Port\nCalifornia, United States 77571',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 10 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.3 * fem,
                                          color: Color(0xff868889),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // HcD (86:1457)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                      child: Text(
                                        '+84 92344324',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 10 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.3 * fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group160CUH (86:1463)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 4.64 * fem, 0 * fem, 0 * fem),
                                width: 18.61 * fem,
                                height: 18.6 * fem,
                                child: Image.asset(
                                  'assets/mobile/images/group-160.png',
                                  width: 18.61 * fem,
                                  height: 18.6 * fem,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // line18VyB (86:1466)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 31.04 * fem),
                          width: double.infinity,
                          height: 1 * fem,
                          decoration: BoxDecoration(
                            color: Color(0xffebebeb),
                          ),
                        ),
                        Container(
                          // group172Rrq (86:1789)
                          margin: EdgeInsets.fromLTRB(
                              25.85 * fem, 0 * fem, 25.85 * fem, 0 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group125Lyo (86:1801)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 5.17 * fem),
                                padding: EdgeInsets.fromLTRB(20.68 * fem,
                                    13.44 * fem, 238.06 * fem, 14.47 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xfff4f5f9),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // groupE3b (86:1803)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 24.81 * fem, 0 * fem),
                                      width: 18.61 * fem,
                                      height: 18.6 * fem,
                                      child: Image.asset(
                                        'assets/mobile/images/group-iUR.png',
                                        width: 18.61 * fem,
                                        height: 18.6 * fem,
                                      ),
                                    ),
                                    Container(
                                      // namewCu (86:1805)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 0.6 * fem),
                                      child: Text(
                                        'Name',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.36 * fem,
                                          color: Color(0xff868889),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group126qZB (86:1806)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 5.17 * fem),
                                padding: EdgeInsets.fromLTRB(22.74 * fem,
                                    12.4 * fem, 225.06 * fem, 12.65 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xfff4f5f9),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group8HP (86:1809)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 24.81 * fem, 0 * fem),
                                      width: 16.54 * fem,
                                      height: 21.45 * fem,
                                      child: Image.asset(
                                        'assets/mobile/images/group-ZNZ.png',
                                        width: 16.54 * fem,
                                        height: 21.45 * fem,
                                      ),
                                    ),
                                    Container(
                                      // addressqhb (86:1808)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 1.39 * fem),
                                      child: Text(
                                        'Address',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.36 * fem,
                                          color: Color(0xff868889),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupqadfjny (MwWfXhrqGFysEQ62nEQaDF)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 5.17 * fem),
                                width: double.infinity,
                                height: 46.51 * fem,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group128ShP (86:1824)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 4.14 * fem, 0 * fem),
                                      padding: EdgeInsets.fromLTRB(
                                          21.71 * fem,
                                          13.44 * fem,
                                          78.42 * fem,
                                          13.57 * fem),
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xfff4f5f9),
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // groupXyj (86:1827)
                                            margin: EdgeInsets.fromLTRB(
                                                0 * fem,
                                                1.03 * fem,
                                                23.92 * fem,
                                                0 * fem),
                                            width: 18.47 * fem,
                                            height: 18.46 * fem,
                                            child: Image.asset(
                                              'assets/mobile/images/group-u8V.png',
                                              width: 18.47 * fem,
                                              height: 18.46 * fem,
                                            ),
                                          ),
                                          Container(
                                            // cityrFK (86:1826)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 1.5 * fem),
                                            child: Text(
                                              'City',
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 12 * ffem,
                                                fontWeight: FontWeight.w500,
                                                height: 1.5 * ffem / fem,
                                                letterSpacing: 0.36 * fem,
                                                color: Color(0xff868889),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // group127aBK (86:1812)
                                      padding: EdgeInsets.fromLTRB(
                                          21.71 * fem,
                                          13.44 * fem,
                                          49.42 * fem,
                                          15.07 * fem),
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xfff4f5f9),
                                        borderRadius:
                                            BorderRadius.circular(5 * fem),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // groupgVF (86:1815)
                                            margin: EdgeInsets.fromLTRB(
                                                0 * fem,
                                                1.28 * fem,
                                                23.78 * fem,
                                                0 * fem),
                                            width: 18.61 * fem,
                                            height: 13.08 * fem,
                                            child: Image.asset(
                                              'assets/mobile/images/group-e8R.png',
                                              width: 18.61 * fem,
                                              height: 13.08 * fem,
                                            ),
                                          ),
                                          Text(
                                            // zipcodeoZs (86:1814)
                                            'Zip code',
                                            style: SafeGoogleFont(
                                              'Poppins',
                                              fontSize: 12 * ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5 * ffem / fem,
                                              letterSpacing: 0.36 * fem,
                                              color: Color(0xff868889),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group129wAH (86:1830)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 0 * fem, 5.17 * fem),
                                padding: EdgeInsets.fromLTRB(21.71 * fem,
                                    13.44 * fem, 12.41 * fem, 14.47 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xfff4f5f9),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // vector1vq (86:1833)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 23.78 * fem, 0 * fem),
                                      width: 18.61 * fem,
                                      height: 18.6 * fem,
                                      child: Image.asset(
                                        'assets/mobile/images/vector.png',
                                        width: 18.61 * fem,
                                        height: 18.6 * fem,
                                      ),
                                    ),
                                    Container(
                                      // countryLTK (86:1832)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 202.32 * fem, 0.6 * fem),
                                      child: Text(
                                        'Country',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.36 * fem,
                                          color: Color(0xff868889),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // polygon5qus (137:1104)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          1.03 * fem, 0 * fem, 0 * fem),
                                      width: 10.34 * fem,
                                      height: 9.3 * fem,
                                      child: Image.asset(
                                        'assets/mobile/images/polygon-5.png',
                                        width: 10.34 * fem,
                                        height: 9.3 * fem,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // group11mHj (86:1795)
                                padding: EdgeInsets.fromLTRB(21.74 * fem,
                                    13.44 * fem, 183.06 * fem, 14.47 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xfff4f5f9),
                                  borderRadius: BorderRadius.circular(5 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // telephone1Uhw (86:1797)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          1.03 * fem, 24.84 * fem, 0 * fem),
                                      width: 17.51 * fem,
                                      height: 17.57 * fem,
                                      child: Image.asset(
                                        'assets/mobile/images/telephone-1-kMw.png',
                                        width: 17.51 * fem,
                                        height: 17.57 * fem,
                                      ),
                                    ),
                                    Container(
                                      // phonenumberZzH (86:1800)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 0 * fem, 0.6 * fem),
                                      child: Text(
                                        'Phone number',
                                        style: SafeGoogleFont(
                                          'Poppins',
                                          fontSize: 12 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5 * ffem / fem,
                                          letterSpacing: 0.36 * fem,
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
                    // primarybuttonSoB (86:1694)
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
                        'Save settings',
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
          ],
        ),
      ),
    ));
  }
}
