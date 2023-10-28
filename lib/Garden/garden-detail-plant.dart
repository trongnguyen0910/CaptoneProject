import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class GardenDetailPlant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // gardendetailplantPX7 (3004:2738)
        width: double.infinity,
        height: 942*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // rectangle55X7X (3004:2739)
              left: 0*fem,
              top: 187*fem,
              child: Align(
                child: SizedBox(
                  width: 428*fem,
                  height: 675*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xfff4f5f9),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // frame169dRT (3004:3025)
              left: 18*fem,
              top: 263*fem,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 392*fem,
                  height: 583*fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupmha9v9f (MwWmX7iHtG4AzPrNLjMHA9)
                        width: double.infinity,
                        height: 253*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // productitemrZ7 (29:381)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22*fem, 0*fem),
                              padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
                              width: 185*fem,
                              decoration: BoxDecoration (
                                color: Color(0xffffffff),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // autogroup4oppLjB (MwWmeXfc96ovo8yuWA4oPP)
                                    padding: EdgeInsets.fromLTRB(44.88*fem, 21*fem, 45.06*fem, 21*fem),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // group32FLM (21:212)
                                          margin: EdgeInsets.fromLTRB(1.12*fem, 0*fem, 0*fem, 0*fem),
                                          width: 93.94*fem,
                                          height: 94*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // ellipse16y1T (21:185)
                                                left: 8.0828857422*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 85.86*fem,
                                                    height: 84*fem,
                                                    child: Image.asset(
                                                      'assets/mobile/images/ellipse-16-18m.png',
                                                      width: 85.86*fem,
                                                      height: 84*fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // peach241FUm (155:1213)
                                                left: 0*fem,
                                                top: 22*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 91*fem,
                                                    height: 72*fem,
                                                    child: Image.asset(
                                                      'assets/mobile/images/peach-24-1-jv1.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8*fem,
                                        ),
                                        Container(
                                          // tomato71B (21:187)
                                          margin: EdgeInsets.fromLTRB(1.18*fem, 0*fem, 0*fem, 0*fem),
                                          child: Text(
                                            'Tomato',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 15*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8*fem,
                                        ),
                                        Container(
                                          // dozenn7K (21:188)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 58.06*fem, 0*fem),
                                          child: Text(
                                            'dozen',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff868889),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // line2tg9 (21:211)
                                    width: double.infinity,
                                    height: 1*fem,
                                    decoration: BoxDecoration (
                                      color: Color(0xffebebeb),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // productiteme9X (3004:2983)
                              padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
                              width: 185*fem,
                              decoration: BoxDecoration (
                                color: Color(0xffffffff),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // autogrouppeq18aV (MwWmu75eoQUPdPQW4NpeQ1)
                                    padding: EdgeInsets.fromLTRB(44.88*fem, 21*fem, 45.06*fem, 21*fem),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // group323SZ (I3004:2983;21:212)
                                          margin: EdgeInsets.fromLTRB(1.12*fem, 0*fem, 0*fem, 0*fem),
                                          width: 93.94*fem,
                                          height: 94*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // ellipse16Zfo (I3004:2983;21:185)
                                                left: 8.0828857422*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 85.86*fem,
                                                    height: 84*fem,
                                                    child: Image.asset(
                                                      'assets/mobile/images/ellipse-16.png',
                                                      width: 85.86*fem,
                                                      height: 84*fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // peach241GaD (I3004:2983;155:1213)
                                                left: 0*fem,
                                                top: 22*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 91*fem,
                                                    height: 72*fem,
                                                    child: Image.asset(
                                                      'assets/mobile/images/peach-24-1-maZ.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8*fem,
                                        ),
                                        Container(
                                          // tomatoNNM (I3004:2983;21:187)
                                          margin: EdgeInsets.fromLTRB(1.18*fem, 0*fem, 0*fem, 0*fem),
                                          child: Text(
                                            'Tomato',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 15*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8*fem,
                                        ),
                                        Container(
                                          // dozenfMT (I3004:2983;21:188)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 58.06*fem, 0*fem),
                                          child: Text(
                                            'dozen',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff868889),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // line2B4u (I3004:2983;21:211)
                                    width: double.infinity,
                                    height: 1*fem,
                                    decoration: BoxDecoration (
                                      color: Color(0xffebebeb),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupblrwKwo (MwWk8aCAUX94FAmNdaBLRw)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
                        width: double.infinity,
                        height: 234*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // productitemqv9 (3004:2991)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22*fem, 0*fem),
                              padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
                              width: 185*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: Color(0xffffffff),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // autogroupzda9jVj (MwWkK4tgELf51BsUx8ZdA9)
                                    padding: EdgeInsets.fromLTRB(44.88*fem, 21*fem, 45.06*fem, 21*fem),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // group32ech (I3004:2991;21:212)
                                          margin: EdgeInsets.fromLTRB(1.12*fem, 0*fem, 0*fem, 0*fem),
                                          width: 93.94*fem,
                                          height: 94*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // ellipse16NHo (I3004:2991;21:185)
                                                left: 8.0828857422*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 85.86*fem,
                                                    height: 84*fem,
                                                    child: Image.asset(
                                                      'assets/mobile/images/ellipse-16-Yyf.png',
                                                      width: 85.86*fem,
                                                      height: 84*fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // peach241U5w (I3004:2991;155:1213)
                                                left: 0*fem,
                                                top: 22*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 91*fem,
                                                    height: 72*fem,
                                                    child: Image.asset(
                                                      'assets/mobile/images/peach-24-1-rYq.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8*fem,
                                        ),
                                        Container(
                                          // tomatokZF (I3004:2991;21:187)
                                          margin: EdgeInsets.fromLTRB(1.18*fem, 0*fem, 0*fem, 0*fem),
                                          child: Text(
                                            'Tomato',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 15*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8*fem,
                                        ),
                                        Container(
                                          // dozenr6V (I3004:2991;21:188)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 58.06*fem, 0*fem),
                                          child: Text(
                                            'dozen',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff868889),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // line2NKj (I3004:2991;21:211)
                                    width: double.infinity,
                                    height: 1*fem,
                                    decoration: BoxDecoration (
                                      color: Color(0xffebebeb),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // productitemKVs (3004:2999)
                              padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 40*fem),
                              width: 185*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: Color(0xffffffff),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // autogroupu2i53Ay (MwWkdJsHNqPZwbtS8Hu2i5)
                                    padding: EdgeInsets.fromLTRB(44.88*fem, 21*fem, 45.06*fem, 21*fem),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // group32xYq (I3004:2999;21:212)
                                          margin: EdgeInsets.fromLTRB(1.12*fem, 0*fem, 0*fem, 0*fem),
                                          width: 93.94*fem,
                                          height: 94*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // ellipse16svh (I3004:2999;21:185)
                                                left: 8.0828857422*fem,
                                                top: 0*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 85.86*fem,
                                                    height: 84*fem,
                                                    child: Image.asset(
                                                      'assets/mobile/images/ellipse-16-QQZ.png',
                                                      width: 85.86*fem,
                                                      height: 84*fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // peach241aq7 (I3004:2999;155:1213)
                                                left: 0*fem,
                                                top: 22*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 91*fem,
                                                    height: 72*fem,
                                                    child: Image.asset(
                                                      'assets/mobile/images/peach-24-1-aPj.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8*fem,
                                        ),
                                        Container(
                                          // tomatoHjX (I3004:2999;21:187)
                                          margin: EdgeInsets.fromLTRB(1.18*fem, 0*fem, 0*fem, 0*fem),
                                          child: Text(
                                            'Tomato',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 15*ffem,
                                              fontWeight: FontWeight.w600,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff000000),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8*fem,
                                        ),
                                        Container(
                                          // dozenaid (I3004:2999;21:188)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 58.06*fem, 0*fem),
                                          child: Text(
                                            'dozen',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 12*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.5*ffem/fem,
                                              color: Color(0xff868889),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    // line2JPj (I3004:2999;21:211)
                                    width: double.infinity,
                                    height: 1*fem,
                                    decoration: BoxDecoration (
                                      color: Color(0xffebebeb),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroup1hzkeyP (MwWkqZ1t6HpvAHqtqH1hZK)
                        width: double.infinity,
                        height: 234*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // productitemCk1 (3004:3007)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 22*fem, 0*fem),
                              width: 185*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: Color(0xffffffff),
                              ),
                              child: Container(
                                // autogroupdat18df (MwWm2P3AywofHxjJr1dat1)
                                padding: EdgeInsets.fromLTRB(44.88*fem, 21*fem, 45.06*fem, 21*fem),
                                width: double.infinity,
                                height: 193*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group3241X (I3004:3007;21:212)
                                      margin: EdgeInsets.fromLTRB(1.12*fem, 0*fem, 0*fem, 0*fem),
                                      width: 93.94*fem,
                                      height: 94*fem,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // ellipse16Zys (I3004:3007;21:185)
                                            left: 8.0828857422*fem,
                                            top: 0*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 85.86*fem,
                                                height: 84*fem,
                                                child: Image.asset(
                                                  'assets/mobile/images/ellipse-16-U57.png',
                                                  width: 85.86*fem,
                                                  height: 84*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // peach241ekR (I3004:3007;155:1213)
                                            left: 0*fem,
                                            top: 22*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 91*fem,
                                                height: 72*fem,
                                                child: Image.asset(
                                                  'assets/mobile/images/peach-24-1.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8*fem,
                                    ),
                                    Container(
                                      // tomatojms (I3004:3007;21:187)
                                      margin: EdgeInsets.fromLTRB(1.18*fem, 0*fem, 0*fem, 0*fem),
                                      child: Text(
                                        'Tomato',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8*fem,
                                    ),
                                    Container(
                                      // dozenRPo (I3004:3007;21:188)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 58.06*fem, 0*fem),
                                      child: Text(
                                        'dozen',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5*ffem/fem,
                                          color: Color(0xff868889),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // productitemXxd (3004:3015)
                              width: 185*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                color: Color(0xffffffff),
                              ),
                              child: Container(
                                // autogroupgdahGvD (MwWmJnjVtM19BHx5iCgDAH)
                                padding: EdgeInsets.fromLTRB(44.88*fem, 21*fem, 45.06*fem, 21*fem),
                                width: double.infinity,
                                height: 193*fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group32aR7 (I3004:3015;21:212)
                                      margin: EdgeInsets.fromLTRB(1.12*fem, 0*fem, 0*fem, 0*fem),
                                      width: 93.94*fem,
                                      height: 94*fem,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            // ellipse16twb (I3004:3015;21:185)
                                            left: 8.0828857422*fem,
                                            top: 0*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 85.86*fem,
                                                height: 84*fem,
                                                child: Image.asset(
                                                  'assets/mobile/images/ellipse-16-1YD.png',
                                                  width: 85.86*fem,
                                                  height: 84*fem,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            // peach241CSV (I3004:3015;155:1213)
                                            left: 0*fem,
                                            top: 22*fem,
                                            child: Align(
                                              child: SizedBox(
                                                width: 91*fem,
                                                height: 72*fem,
                                                child: Image.asset(
                                                  'assets/mobile/images/peach-24-1-tzV.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8*fem,
                                    ),
                                    Container(
                                      // tomato5WH (I3004:3015;21:187)
                                      margin: EdgeInsets.fromLTRB(1.18*fem, 0*fem, 0*fem, 0*fem),
                                      child: Text(
                                        'Tomato',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.5*ffem/fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8*fem,
                                    ),
                                    Container(
                                      // dozenXt5 (I3004:3015;21:188)
                                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 58.06*fem, 0*fem),
                                      child: Text(
                                        'dozen',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 12*ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.5*ffem/fem,
                                          color: Color(0xff868889),
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
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              // navigation1HT (3004:2745)
              left: 0*fem,
              top: 862*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(30*fem, 25*fem, 30*fem, 25*fem),
                width: 428*fem,
                height: 80*fem,
                decoration: BoxDecoration (
                  border: Border.all(color: Color(0xffaddb80)),
                  color: Color(0xffffffff),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // homeactiveS7s (3004:2751)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 0*fem),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom (
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 30*fem,
                          height: 30*fem,
                          child: Image.asset(
                            'assets/mobile/images/home-active-39s.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // scannerWNd (3004:2750)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 55*fem, 0*fem),
                      width: 30*fem,
                      height: 30*fem,
                      child: Image.asset(
                        'assets/mobile/images/scanner.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // createQU1 (3004:2749)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 55*fem, 0*fem),
                      width: 30*fem,
                      height: 30*fem,
                      child: Image.asset(
                        'assets/mobile/images/create-r57.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      // bell77X (3004:2748)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 54*fem, 0*fem),
                      width: 30*fem,
                      height: 30*fem,
                      child: Image.asset(
                        'assets/mobile/images/bell-Rrq.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    TextButton(
                      // usercpy (3004:2747)
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 30*fem,
                        height: 30*fem,
                        child: Image.asset(
                          'assets/mobile/images/user-7TP.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // weekw6Z (3004:2740)
              left: 84*fem,
              top: 199*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(38*fem, 10*fem, 52*fem, 1*fem),
                width: 260*fem,
                height: 50*fem,
                decoration: BoxDecoration (
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10*fem),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(0*fem, 4*fem),
                      blurRadius: 2*fem,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupvnwmMAH (MwWnzVRhkcet9ZmHbSvNWM)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // task4Kb (3004:2742)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 67*fem, 0*fem),
                            child: Text(
                              'Task',
                              style: SafeGoogleFont (
                                'Poppins',
                                fontSize: 20*ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5*ffem/fem,
                                letterSpacing: 0.2*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            // plantkiD (3004:2744)
                            'Plant',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5*ffem/fem,
                              letterSpacing: 0.2*fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // line21sXw (3004:2743)
                      margin: EdgeInsets.fromLTRB(116*fem, 0*fem, 0*fem, 0*fem),
                      width: 50*fem,
                      height: 4*fem,
                      decoration: BoxDecoration (
                        color: Color(0x7f6cc51d),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // titlebarzMf (3004:2752)
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
                      // searchfieldtC9 (3004:2754)
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
                              // group69Z3P (I3004:2754;2888:1196)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 144.02*fem, 0*fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // group21VBw (I3004:2754;2888:1197)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 21.58*fem, 1*fem),
                                    width: 22.72*fem,
                                    height: 20*fem,
                                    child: Image.asset(
                                      'assets/mobile/images/group-21-ECy.png',
                                      width: 22.72*fem,
                                      height: 20*fem,
                                    ),
                                  ),
                                  Text(
                                    // searchkeywordsycu (I3004:2754;2888:1202)
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
                              // grouphJ1 (I3004:2754;2888:1192)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1.48*fem),
                              width: 21.11*fem,
                              height: 16.95*fem,
                              child: Image.asset(
                                'assets/mobile/images/group-Hx5.png',
                                width: 21.11*fem,
                                height: 16.95*fem,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // farm1detailBU5 (3004:2755)
                      left: 152.4709472656*fem,
                      top: 63*fem,
                      child: Align(
                        child: SizedBox(
                          width: 123*fem,
                          height: 27*fem,
                          child: Text(
                            'Farm 1 Detail',
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
                      // backarrowcpH (3004:2756)
                      left: 16.7707519531*fem,
                      top: 68*fem,
                      child: Align(
                        child: SizedBox(
                          width: 24.58*fem,
                          height: 16.54*fem,
                          child: Image.asset(
                            'assets/mobile/images/backarrow-nVw.png',
                            width: 24.58*fem,
                            height: 16.54*fem,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      // actionbartWu (3004:2757)
                      left: 18*fem,
                      top: 15*fem,
                      child: Container(
                        width: 393*fem,
                        height: 21*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // leftsidecC1 (I3004:2757;4:68)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 266.09*fem, 0*fem),
                              width: 56.79*fem,
                              height: double.infinity,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.circular(24*fem),
                              ),
                              child: Container(
                                // time8RF (I3004:2757;4:71)
                                padding: EdgeInsets.fromLTRB(14*fem, 1*fem, 16.79*fem, 0*fem),
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration (
                                  borderRadius: BorderRadius.circular(24*fem),
                                ),
                                child: Text(
                                  '9:41',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont (
                                    'SF Pro Text',
                                    fontSize: 15*ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.3333333333*ffem/fem,
                                    letterSpacing: -0.5*fem,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // rightsidebZj (I3004:2757;4:61)
                              margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 4.66*fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // mobilesignalv6D (I3004:2757;4:67)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.29*fem, 0*fem),
                                    width: 17.88*fem,
                                    height: 10.67*fem,
                                    child: Image.asset(
                                      'assets/mobile/images/mobile-signal-3Pf.png',
                                      width: 17.88*fem,
                                      height: 10.67*fem,
                                    ),
                                  ),
                                  Container(
                                    // wifiphP (I3004:2757;4:66)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.29*fem, 0.37*fem),
                                    width: 16.06*fem,
                                    height: 10.97*fem,
                                    child: Image.asset(
                                      'assets/mobile/images/wifi-45F.png',
                                      width: 16.06*fem,
                                      height: 10.97*fem,
                                    ),
                                  ),
                                  Container(
                                    // batteryvkR (I3004:2757;4:62)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                                    width: 25.59*fem,
                                    height: 11.33*fem,
                                    child: Image.asset(
                                      'assets/mobile/images/battery-K1K.png',
                                      width: 25.59*fem,
                                      height: 11.33*fem,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
          );
  }
}