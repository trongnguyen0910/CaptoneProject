import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Garden/garden-detail-task.dart';
import 'package:myapp/utils.dart';

class TaskDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
      
      child: Container(
        // taskdetailaXB (3007:3133)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 35*fem),
        width: double.infinity,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // titlebarVPF (3014:1047)
              width: double.infinity,
              height: 110*fem,
              decoration: BoxDecoration (
                color: Color(0xffffffff),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // taskdetailR21 (3014:1049)
                    left: 161.9709472656*fem,
                    top: 63*fem,
                    child: Align(
                      child: SizedBox(
                        width: 105*fem,
                        height: 27*fem,
                        child: Text(
                          'Task Detail',
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
                //   Positioned(
                //   // Điều chỉnh vị trí theo top ở đây
                //   left: 5.0 * fem,
                //   top: 48 * fem,
                //   child: IconButton(
                //     icon: Icon(Icons.arrow_back),
                //     onPressed: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => GardenDetailTask()));
                //     },
                //   ),
                // )
                 
                ],
              ),
            ),
            Container(
              // bodyo6R (3014:1079)
              margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // image2WFj (3014:1065)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 37.14*fem),
                    width: 428*fem,
                    height: 260*fem,
                    child: Image.asset(
                      'assets/mobile/images/image-2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    // planttomatoesQ6D (3014:1066)
                    margin: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 2.86*fem),
                    child: Text(
                      'Plant Tomatoes',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 18*ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5*ffem/fem,
                        letterSpacing: 0.18*fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Container(
                    // start01042023croptomatoseasons (3014:1075)
                    margin: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 16*fem),
                    constraints: BoxConstraints (
                      maxWidth: 233*fem,
                    ),
                    child: Text(
                      'Start: 01/04/2023\nCrop: Tomato - Season: Spring 2023',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 13*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5*ffem/fem,
                        color: Color(0xff868889),
                      ),
                    ),
                  ),
                  Container(
                    // tomatoplantsaretenderwarmseaso (3014:1074)
                    margin: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 128*fem),
                    constraints: BoxConstraints (
                      maxWidth: 393*fem,
                    ),
                    child: Text(
                      'Tomato plants are tender, warm-season crops that love the sun and cannot bear frost. \nIt’s important not to put plants in the ground too early. \n\nIn most regions, the soil is not warm enough to plant tomatoes outdoors until late spring and early summer, except in zone 10, where they are a fall and winter crop.',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 13*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5*ffem/fem,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  
                  Container(
                    // primarybuttont3K (3014:1076)
                    margin: EdgeInsets.fromLTRB(17*fem, 0*fem, 17*fem, 0*fem),
                    width: double.infinity,
                    height: 60*fem,
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
                        'Finish task',
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