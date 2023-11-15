import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stroke_text/stroke_text.dart';

import '../model/PlantModel.dart';



class PlantObject extends StatelessWidget {
  final VoidCallback press;
  String? plantName;
  String? image;

  PlantObject({
    required this.plantName,
    required this.image,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 500;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20 * fem, vertical: 10 * fem),
        height: 250 * fem,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Stack(
            children: [
              // Background Image
              Image.network(
                '$image',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              // Gradient Overlay
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),
              // Plant Name
              Positioned(
                bottom: 20 * fem,
                left: 20 * fem,
                child: Text(
                  '$plantName',
                  style: TextStyle(
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

