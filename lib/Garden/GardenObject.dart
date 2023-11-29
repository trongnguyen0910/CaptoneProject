import 'package:flutter/material.dart';

import '../model/GardenModel.dart';

class GardenObject extends StatelessWidget {
  final String? gardenName;
  final String? description;
  final String? fullName;
  final String? region;
  final String? image;
  final int? quantityplant;
  final VoidCallback press;

  GardenObject({
    required this.gardenName,
    required this.description,
    required this.fullName,
    required this.region,
    required this.image,
    required this.quantityplant,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    final double fem = 1.0;
    final double ffem = 1.0;

    return Card(
      margin: EdgeInsets.all(15.0 * fem),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0 * fem),
      ),
      elevation: 8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0 * fem),
              topRight: Radius.circular(15.0 * fem),
            ),
            child: Image.network(
              '$image',
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tên khu vườn: $gardenName',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24 * ffem,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16.0 * fem),
                Text(
                  'Mô tả: $description',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555555),
                  ),
                ),
                SizedBox(height: 20.0 * fem),
                Container(
                  padding: EdgeInsets.all(15.0 * fem),
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$region',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff333333),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.location_on),
                        onPressed: press,
                        color: Colors.red,
                      ),
                    ],
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
