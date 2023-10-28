import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Controller/ComparePriceController.dart';

class ListComparePrice extends StatelessWidget {
  int? historyId;
  String? fruitName;
  double? price;
  String? location;
  String? status;
  DateTime? createdDate;
  dynamic updateDate;

  ListComparePrice({
    required this.historyId,
    required this.fruitName,
    required this.price,
    required this.location,
    required this.status,
    required this.createdDate,
    required this.updateDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 241, 241, 241),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0.0, right: 10.0),
                child: Container(
                  height: MediaQuery.of(context).size.width / 3.5,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "$historyId",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Text(
                          "Name: ",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "$fruitName",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color.fromARGB(255, 255, 19, 2),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Create Date: ",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          DateFormat('dd-MM-yyyy hh:mm:ss')
                              .format(createdDate!),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Location: ",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "$location",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Status: ",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "$status",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Price: ",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "$price",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
