import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

import '../Controller/DataFruitController.dart';



class PostObject extends StatelessWidget {
    String? fullName;
    String? type;
    String? postContent;
    String? postImage;
    String? postTitle;
  final VoidCallback press;
  
  PostObject({
    required this.fullName,
    required this.type,
    required this.postContent,
    required this.postImage,
    required this.postTitle,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    double baseWidth = 500;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Card(
      margin: EdgeInsets.fromLTRB(10 * fem, 0, 5 * fem, 0 * fem),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120 * fem,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('$postImage'),
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
                  '$postTitle',
                  style: TextStyle(
                    fontSize: 20 * ffem,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10 * fem),
                Text(
                  'Type: $type', 
                  style: TextStyle(fontSize: 16 * ffem),
                ),
                SizedBox(height: 10 * fem),
                Text(
                  'Full Name: $fullName', 
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
