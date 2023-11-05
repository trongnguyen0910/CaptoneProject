import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Controller/GardenTaskController.dart';
import 'package:myapp/Garden/garden-detail-task.dart';
import 'package:myapp/utils.dart';

class TaskDetail extends StatelessWidget {
  final DataGardenTask datagardentask;
  TaskDetail({Key? key, required this.datagardentask}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Detail', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 95 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                        // image2WFj (3014:1065)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 37.14 * fem),
                        width: 428 * fem,
                        height: 260 * fem,
                       child: Image.network(
                              '${datagardentask.image}',
                              fit: BoxFit.cover,
                            ),
                      ),
                      Container(
                        // planttomatoesQ6D (3014:1066)
                        margin: EdgeInsets.fromLTRB(
                            14 * fem, 0 * fem, 0 * fem, 2.86 * fem),
                        child: Text(
                          '${datagardentask.gardenTaskName}',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            letterSpacing: 0.18 * fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        // start01042023croptomatoseasons (3014:1075)
                        margin: EdgeInsets.fromLTRB(
                            14 * fem, 0 * fem, 0 * fem, 16 * fem),
                        constraints: BoxConstraints(
                          maxWidth: 233 * fem,
                        ),
                        child: Text(
                          'Bắt đầu: ${datagardentask.createdDate}\nKết thúc: ${datagardentask.gardenTaskDate} ',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 13 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            color: Color(0xff868889),
                          ),
                        ),
                      ),
                      Container(
                        // tomatoplantsaretenderwarmseaso (3014:1074)
                        margin: EdgeInsets.fromLTRB(
                            14 * fem, 0 * fem, 0 * fem, 188 * fem),
                        constraints: BoxConstraints(
                          maxWidth: 393 * fem,
                        ),
                        child: Text(
                          '${datagardentask.description}',
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
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.all(20 * fem),
                width: double.infinity,
                height: 60 * fem,
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
                    'Finish task',
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
    );
  }
}