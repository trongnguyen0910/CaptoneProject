import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Personal/account.dart';
import 'ListOrder.dart';

class OrderObject extends StatefulWidget {
  final int? orderId;
  final String? fullName;
  final DateTime? orderDate;
  final String? status;
  final double? totalAmount;
  final String? phoneNumber;

  OrderObject({
    required this.orderId,
    required this.fullName,
    required this.orderDate,
    required this.status,
    required this.totalAmount,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  State<OrderObject> createState() => _OrderObjectState();
}

class _OrderObjectState extends State<OrderObject> {
  Future<void> UpdateOrder(int orderId, String action) async {
    print('orderId: $orderId');
    print('action: $action');
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/orders/$orderId/process?action=$action';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.put(Uri.parse(url), headers: headers);
    var statusCode = response.statusCode;
    print('Response Body: ${response.body}');

    print('Statud Code: $statusCode');
    if (statusCode == 200) {
      // Show toast for success
      Fluttertoast.showToast(
        msg: 'Update successful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } else {
      var responseString = response.body;
      var responseBody = json.decode(responseString);
      var errorMessage = responseBody['errors'];
      String errorContent = errorMessage.toString();
      final snackBar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Error',
          message: errorContent,
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool showButtons =
        widget.status == "Pending" || widget.status == "Shipping";
    return AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
                child: Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Colors.grey[200],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Mã đơn hàng: ${widget.orderId}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Tên người mua: ${widget.fullName}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Ngày mua: ${DateFormat('dd-MM-yyyy hh:mm:ss').format(widget.orderDate!)}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Số điện thoại: ${widget.phoneNumber}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Trạng thái: ${widget.status == "Accepted" ? "Chấp nhận" : widget.status == "Rejected" ? "Từ chối" : widget.status == "Shipping" ? "Đang vận chuyển" : widget.status == "UserRefused" ? "Hủy Đơn" : "Chờ duyệt"}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: widget.status == "Accepted"
                                        ? Colors.green
                                        : widget.status == "Rejected"
                                            ? Colors.red
                                            : widget.status == "Shipping"
                                                ? Color.fromARGB(
                                                    255, 54, 171, 244)
                                                : widget.status == "UserRefused"
                                                    ? Color.fromARGB(
                                                        255, 164, 0, 0)
                                                    : Colors.orange,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Tổng tiền: ${widget.totalAmount?.toStringAsFixed(3)}vnđ",
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
                  SizedBox(height: 16),
                  Visibility(
                    visible: showButtons,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (widget.status == "Pending") {
                              await UpdateOrder(widget.orderId!, "Shipping");
                            } else {
                              await UpdateOrder(widget.orderId!, "Accepted");
                            }
                           

                            // Sử dụng setState để rebuild lại widget và cập nhật giao diện ngay lập tức
                            setState(() {});
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) => ListOrder(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("Yes"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (widget.status == "Pending") {
                              await UpdateOrder(widget.orderId!, "Rejected");
                            } else {
                              await UpdateOrder(widget.orderId!, "UserRefused");
                            }
                             setState(() {});
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (BuildContext context) => ListOrder(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("No"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}
