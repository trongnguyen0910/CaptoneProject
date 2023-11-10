import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Comment extends StatelessWidget {
    String? fullName;
    String? commentContent;
  Comment({ required this.fullName,required this.commentContent});

  @override
 Widget build(BuildContext context) {
    final double fem = 1.0;
    final double ffem = 1.0;

    return Container(
      margin: EdgeInsets.only(bottom: 18 * fem),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10 * fem),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10 * fem),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/mobile/images/avartarcomment.png'),
              radius: 20 * fem, // Điều chỉnh kích thước avatar tại đây
            ),
          ),
          SizedBox(width: 10 * fem), // Khoảng cách giữa avatar và thông tin

          Expanded(
            child: Container(
              padding: EdgeInsets.all(10 * fem),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$fullName',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5 * ffem,
                      color: Color(0xff000000),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    '$commentContent',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}