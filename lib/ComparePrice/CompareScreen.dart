import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Handle tap if needed
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
   Container(
  width: 60.0,
  height: 110.0,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Color.fromARGB(255, 255, 255, 255),
  ),
  child: Center(
    child: Image.asset(
      'assets/mobile/images/compareprice.png', // Đường dẫn tới hình ảnh trong assets
      width: 50.0,
      height: 50.0,
   
    ),
  ),
),

    SizedBox(width: 16.0),
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$fruitName",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.event,
                size: 18,
                color: Colors.grey,
              ),
              SizedBox(width: 4),
              Text(
                "Ngày tạo: ${DateFormat('dd-MM-yyyy hh:mm:ss').format(createdDate!)}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 18,
                color: Colors.black,
              ),
              SizedBox(width: 4),
              Text(
                "Địa điểm: $location",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                status == "Active" ? Icons.check_circle : Icons.cancel,
                size: 18,
                color: status == "Active" ? Colors.green : Colors.red,
              ),
              SizedBox(width: 4),
              Text(
                "Trạng thái: $status",
                style: TextStyle(
                  fontSize: 16,
                  color: status == "Active" ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              
              SizedBox(width: 4),
              Text(
                "Giá tiền: ${price?.toStringAsFixed(0)}vnđ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ],
),
          ),
        ),
      ),
    );
  }
}
