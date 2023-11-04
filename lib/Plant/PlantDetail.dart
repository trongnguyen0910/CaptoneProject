import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Controller/PlantController.dart';
import '../Garden/garden-detail-task.dart';
import '../QR/QrCode.dart';

class PlantDetail extends StatelessWidget {
  final DataPlant dataPlant;
   WebViewController controller = WebViewController();
  PlantDetail({Key? key, required this.dataPlant}) : super(key: key);
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
            if (await controller.canGoBack()) {
              await controller.goBack();
            } else {
              Navigator.of(context).pop();
            }
          },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            // plantdetailfUD (3014:1080)
            padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 35 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // bodyBeq (3014:1081)
                  margin:
                      EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 140 * fem),
                  width: double.infinity,
                  height: 496 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // organicmountainworksasasellerf (3014:1083)
                        left: 14 * fem,
                        top: 430 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 399 * fem,
                            height: 156 * fem,
                            child: Text(
                              '${dataPlant.description}',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // plantdate0104202315072023estim (3014:1084)
                        left: 14 * fem,
                        top: 325 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 224 * fem,
                            height: 90 * fem,
                            child: Text(
                              'Plant date: ${dataPlant.plantingDate}\nHarvesting Date: ${dataPlant.harvestingDate}\nGarden: ${dataPlant.gardenName}',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff868889),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // organiclemons51T (3014:1085)
                        left: 14 * fem,
                        top: 299.1450195312 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 125 * fem,
                            height: 23 * fem,
                            child: Text(
                              '${dataPlant.plantName}',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // image2wJZ (3014:1086)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 428 * fem,
                            height: 260 * fem,
                            child: Image.network(
                              '${dataPlant.image}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // primarybuttonM7P (3014:1114)
                  margin:
                      EdgeInsets.fromLTRB(17 * fem, 0 * fem, 17 * fem, 0 * fem),
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff6cc51d),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QrCode(dataPlant:dataPlant),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              'Show QR Code',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
