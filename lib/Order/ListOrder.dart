import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Controller/ComparePriceController.dart';
import '../Controller/OrderController.dart';
import 'OrderDetail.dart';
import 'OrderObject.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({Key? key}) : super(key: key);

  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  List<DataOrder> order = [];
  String searchTextProcessed = '';
  String searchTextPending = '';
  String searchShipping = '';
  @override
  void initState() {
    super.initState();
    getOrder();
  }

  Future<void> getOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final accountID = prefs.getInt('accountID');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/orders?sellerUserId=$accountID';
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

  List<DataOrder> sortOrderByStatus(
      List<DataOrder> order, List<String> statuses) {
    return order.where((item) => statuses.contains(item.status)).toList();
  }

  void navigateToOrderDetailPage(DataOrder order) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => OrderDetailPage(order: order),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('Quản lý đơn hàng', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Đã xử lý'),
              Tab(text: 'Chưa xử lý'),
              Tab(text: 'Vận chuyển'),
            ],
            labelColor: Colors.black,
            indicatorColor: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchTextProcessed = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm...',
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Processed Orders
                  ListView.builder(
                    itemCount:
                        sortOrderByStatus(order, ['Accepted', 'Rejected','UserRefused'])
                            .where((item) => item.phoneNumber!
                                .toLowerCase()
                                .contains(searchTextProcessed.toLowerCase()))
                            .length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          navigateToOrderDetailPage(
                            sortOrderByStatus(
                                order, ['Accepted', 'Rejected','UserRefused'])[index],
                          );
                        },
                        child: OrderObject(
                          orderId: sortOrderByStatus(
                                  order, ['Accepted', 'Rejected','UserRefused'])[index]
                              .orderId,
                          fullName: sortOrderByStatus(
                                  order, ['Accepted', 'Rejected','UserRefused'])[index]
                              .fullName,
                          phoneNumber: sortOrderByStatus(
                                  order, ['Accepted', 'Rejected','UserRefused'])[index]
                              .phoneNumber,
                          totalAmount: sortOrderByStatus(
                                  order, ['Accepted', 'Rejected','UserRefused'])[index]
                              .totalAmount,
                          status: sortOrderByStatus(
                                  order, ['Accepted', 'Rejected','UserRefused'])[index]
                              .status,
                          orderDate: sortOrderByStatus(
                                  order, ['Accepted', 'Rejected','UserRefused'])[index]
                              .orderDate,
                        ),
                      );
                    },
                  ),

                  // Pending Orders
                  ListView.builder(
                    itemCount: sortOrderByStatus(order, ['Pending'])
                        .where((item) => item.phoneNumber!
                            .toLowerCase()
                            .contains(searchTextPending.toLowerCase()))
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          navigateToOrderDetailPage(
                            sortOrderByStatus(order, ['Pending'])[index],
                          );
                        },
                        child: OrderObject(
                          orderId: sortOrderByStatus(order, ['Pending'])[index]
                              .orderId,
                          fullName: sortOrderByStatus(order, ['Pending'])[index]
                              .fullName,
                          phoneNumber:
                              sortOrderByStatus(order, ['Pending'])[index]
                                  .phoneNumber,
                          totalAmount:
                              sortOrderByStatus(order, ['Pending'])[index]
                                  .totalAmount,
                          status: sortOrderByStatus(order, ['Pending'])[index]
                              .status,
                          orderDate:
                              sortOrderByStatus(order, ['Pending'])[index]
                                  .orderDate,
                        ),
                      );
                    },
                  ),
                   ListView.builder(
                    itemCount: sortOrderByStatus(order, ['Shipping'])
                        .where((item) => item.phoneNumber!
                            .toLowerCase()
                            .contains(searchShipping.toLowerCase()))
                        .length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          navigateToOrderDetailPage(
                            sortOrderByStatus(order, ['Shipping'])[index],
                          );
                        },
                        child: OrderObject(
                          orderId: sortOrderByStatus(order, ['Shipping'])[index]
                              .orderId,
                          fullName: sortOrderByStatus(order, ['Shipping'])[index]
                              .fullName,
                          phoneNumber:
                              sortOrderByStatus(order, ['Shipping'])[index]
                                  .phoneNumber,
                          totalAmount:
                              sortOrderByStatus(order, ['Shipping'])[index]
                                  .totalAmount,
                          status: sortOrderByStatus(order, ['Shipping'])[index]
                              .status,
                          orderDate:
                              sortOrderByStatus(order, ['Shipping'])[index]
                                  .orderDate,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
