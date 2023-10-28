import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/GardenModel.dart';

class GardenObject extends StatelessWidget {
  String? gardenName;
  String? description;
  String? fullName;
  String? region;
  String? image;
  final VoidCallback press;
  GardenObject({
    required this.gardenName,
    required this.description,
    required this.fullName,
    required this.region,
    required this.image,
    required this.press,
  });
  @override
  Widget build(BuildContext context) {
    final double fem = 1.0;
    final double ffem = 1.0;

    return Card(
      margin: EdgeInsets.only(bottom: 30.0 * fem, right: 20.0 * fem, left: 20.0 * fem),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0 * fem),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0 * fem),
              topRight: Radius.circular(10.0 * fem),
            ),
            child: Image.network(
              '$image',
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '$gardenName',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    SizedBox(width: 130.0 * fem),
                    Text(
                      '$fullName',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0 * fem), // Khoảng cách giữa gardenName và description
                Text(
                  '$description',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14 * ffem,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(height: 10.0 * fem),
                 Container(
            width: 85 * fem,
            height: 30 * fem,
            decoration: BoxDecoration(
              color: Color(0xfff0f0f0),
              borderRadius: BorderRadius.circular(5 * fem),
            ),
            child: Center(
              child: Text(
                '$region',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2125 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
