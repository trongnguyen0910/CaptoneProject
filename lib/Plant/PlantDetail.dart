import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Controller/PlantController.dart';
import '../Garden/garden-detail-task.dart';
import '../QR/QrCode.dart';
import '../Task/TaskPlant.dart';

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
      body: AnimationLimiter(
        child: SingleChildScrollView(
          child: Neumorphic(
            style: NeumorphicStyle(
              depth: 10,
              intensity: 0.8,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
            ),
            child: Container(
              padding: EdgeInsets.all(20 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 375),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    Container(
                      width: double.infinity,
                      height: 260 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * fem),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20 * fem),
                        child: Image.network(
                          '${dataPlant.image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20 * fem),
                    Text(
                      '${dataPlant.plantName}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10 * fem),
                    Text(
                      'Plant date: ${dataPlant.plantingDate}\nHarvesting Date: ${dataPlant.harvestingDate}\nGarden: ${dataPlant.gardenName}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff868889),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20 * fem),
                    Text(
                      '${dataPlant.description}',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20 * fem),
                    NeumorphicButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QrCode(dataPlant: dataPlant),
                          ),
                        );
                      },
                      style: NeumorphicStyle(
                        color: Color(0xff6cc51d),
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20 * fem, horizontal: 40 * fem),
                      child: Text(
                        'Show QR Code',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 15 * fem),
                    NeumorphicButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskPlant(id: dataPlant.plantId!),
                          ),
                        );
                      },
                      style: NeumorphicStyle(
                        color: Color(0xff6cc51d),
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20 * fem, horizontal: 40 * fem),
                      child: Text(
                        'Show Task',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}