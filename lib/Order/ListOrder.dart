import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/ComparePriceController.dart';

import 'package:http/http.dart' as http;

import '../Controller/OrderController.dart';
import 'OrderObject.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({Key? key}) : super(key: key);

  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  List<DataOrder> order = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    getOrder();
  }

  Future<void> getOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    final url = 'https://fruitseasonapims-001-site1.btempurl.com/api/orders';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    print('responseTrans: $responseTrans');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          order =
              responseTrans.map((item) => DataOrder.fromJson(item)).toList();
        });
      }
    }
  }
  List<DataOrder> sortOrderByStatus(List<DataOrder> order) {
    order.sort((a, b) {
      Map<String, int> statusOrder = {
        'Pending': 0,
        'Accepted': 1,
        'Rejected': 2,
        'Cancelled': 3,
      };

     int aStatus = statusOrder[a.status!]!;
     int bStatus = statusOrder[b.status!]!;

   
      return aStatus.compareTo(bStatus);
    });
    return order;
  }

  @override
  Widget build(BuildContext context) {
    List<DataOrder> sortedOrder = sortOrderByStatus(order);
    List<DataOrder> filteredTrans = sortedOrder.where((item) {
      return item.phoneNumber!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý đơn hàng', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTrans.length,
              itemBuilder: (BuildContext context, int index) {
              return OrderObject(
                  orderId: filteredTrans[index].orderId,
                  fullName: filteredTrans[index].fullName,
                  phoneNumber: filteredTrans[index].phoneNumber,
                  totalAmount: filteredTrans[index].totalAmount,
                  status: filteredTrans[index].status,
                  orderDate: filteredTrans[index].orderDate,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




