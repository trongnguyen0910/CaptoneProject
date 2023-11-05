import 'package:flutter/material.dart';

import '../model/GardenModel.dart';
import '../model/TaskModel.dart';

class TaskObject extends StatelessWidget {
  final VoidCallback press;
  String? gardenTaskName;
  DateTime? gardenTaskDate;
  String? status;
  TaskObject({
    required this.press,
    required this.gardenTaskName,
    required this.gardenTaskDate,
    required this.status,
  });
  @override
  Widget build(BuildContext context) {
    final double fem = 1.0; // Define your fem value here
    final double ffem = 1.0; // Define your ffem value here

    return Container(
      padding: EdgeInsets.fromLTRB(15 * fem, 10 * fem, 15 * fem, 10 * fem),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffebebeb)),
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(10 * fem),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '$gardenTaskName',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  '$status',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 1.5 * ffem / fem,
                    color: '$status' == "Completed"
                        ? Color.fromARGB(
                            255, 1, 124, 5) // Màu xanh cho trạng thái "done"
                        : Colors.red, // Màu đỏ cho trạng thái khác
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 18 * fem),
            constraints: BoxConstraints(
              maxWidth: 251 * fem,
            ),
            child: Text(
              '$gardenTaskDate',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13 * ffem,
                fontWeight: FontWeight.w400,
                height: 1.5 * ffem / fem,
                color: Color(0xff000000),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
