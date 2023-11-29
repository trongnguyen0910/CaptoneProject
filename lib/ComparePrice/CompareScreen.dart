import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Controller/ComparePriceController.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ListComparePrice extends StatelessWidget {
  final int? historyId;
  final String? fruitName;
  final double? price;
  final String? location;
  final String? status;
  final DateTime? createdDate;

  ListComparePrice({
    required this.historyId,
    required this.fruitName,
    required this.price,
    required this.location,
    required this.status,
    required this.createdDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Material(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              // Handle tap if needed
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "$fruitName",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Ngày tạo: ${DateFormat('dd-MM-yyyy hh:mm:ss').format(createdDate!)}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Địa điểm: $location",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Trạng thái: $status",
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                status == "Active" ? Colors.green : Colors.red,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "${price?.toStringAsFixed(0)}vnđ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
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
