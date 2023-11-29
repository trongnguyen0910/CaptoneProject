import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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

    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 375),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.convex,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15 * fem)),
              depth: 50,
              intensity: 0.7,
              lightSource: LightSource.top,
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.all(15 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.assignment,
                        color: Colors.blue, // Customize the icon color
                        size: 24 * fem,
                      ),
                      SizedBox(width: 12 * fem),
                      Expanded(
                        child: Text(
                          '$gardenTaskName',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Text(
                        '${status == "Pending" ? "Chưa hoàn thành" : status == "InProgress" ? "Đang thực hiện" :  status == "Completed"? "Hoàn thành" : "Hủy bỏ"}',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w600,
                          color: status == 'Completed'
                              ? Colors.green // Green color for "Completed" status
                              : status == 'InProgress' ? Colors.orange
                              : status == 'Pending'? Colors.red:
                              Color.fromARGB(255, 118, 123, 118), // Red color for other statuses
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12 * fem),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey, // Customize the icon color
                        size: 16 * fem,
                      ),
                      SizedBox(width: 8 * fem),
                      Text(
                        '${gardenTaskDate?.toString() ?? ''}',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
