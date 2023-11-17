import 'package:flutter/material.dart';

class FancyTextDivider extends StatelessWidget {
  final String text;

  const FancyTextDivider({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.star, // Thay đổi biểu tượng tùy ý
              color: Colors.amber, // Thay đổi màu sắc của biểu tượng
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.star, // Thay đổi biểu tượng tùy ý
              color: Colors.amber, // Thay đổi màu sắc của biểu tượng
            ),
          ),
        ],
      ),
    );
  }
}
