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
    return Container(
      margin: EdgeInsets.fromLTRB(30 * fem,0 * fem, 0 * fem, 0 * fem),
      height: 250 * fem,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding:
                EdgeInsets.fromLTRB(57.5 * fem, 13 * fem, 13 * fem, 1 * fem),
            width: 180 * fem,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
               image: NetworkImage(
                   '$image',
                  ),
                   colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(
                            0.3), // Điều này làm cho hình ảnh bị mờ và độ sáng giảm đi
                        BlendMode
                            .darken, // Điều này làm cho hình ảnh trở nên tối hơn
                      ),
              ),
               borderRadius: BorderRadius.circular(15.0),
               
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  child: Container(
                  width: double.infinity,
                  child: StrokeText(
                    text: '$plantName',
                    textStyle: TextStyle(
                      fontSize: 20 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1 * ffem / fem,
                      color: Colors.black,
                    ),
                    strokeWidth: 3,
                    strokeColor: Colors.white,
                  ),
                ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15 * fem,
          ),
          
        ],
      ),
    );
  }
}
