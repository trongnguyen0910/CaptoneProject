import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

import '../Controller/DataFruitController.dart';



class FruitObject extends StatelessWidget {
  String? fruitName;
  double? price;
  int? quantityAvailable;
  List<FruitImage>? fruitImages;
  final VoidCallback press;
  
  FruitObject({
    required this.fruitName,
    required this.price,
    required this.quantityAvailable,
    required this.fruitImages,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 500;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Card(
      margin: EdgeInsets.fromLTRB(30 * fem, 0, 30 * fem, 20 * fem),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Container(
            height: 110 * fem,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${fruitImages![0].imageUrl}'),
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$fruitName',
                  style: TextStyle(
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10 * fem),
                Text(
                  'Price: $price', 
                  style: TextStyle(fontSize: 16 * ffem),
                ),
                SizedBox(height: 10 * fem),
                Text(
                  'Available: $quantityAvailable', 
                  style: TextStyle(fontSize: 16 * ffem),
                ),
                SizedBox(height: 10 * fem),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
