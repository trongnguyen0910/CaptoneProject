import 'package:flutter/material.dart';

import '../Controller/OrderController.dart';

class OrderDetailPage extends StatelessWidget {
  final DataOrder order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết đơn hàng', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightGreen.shade300, Colors.green],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng mặt hàng',
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.green,
                        size: 36.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: order.orderDetails?.length,
                      itemBuilder: (context, index) {
                        var detail = order.orderDetails![index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 16.0),
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              detail.fruitName!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pacifico',
                                fontSize: 18.0,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Số lượng: ${detail.quantity}'),
                                Text('Giá: ${detail.unitPrice}'),
                                Text('Tổng tiền: ${detail.totalAmount}'),
                                Text('Loại: ${detail.oderDetailType}'),
                                if (detail.oderDetailType == 'PreOrder')
                                  Text('Mặt hàng giảm giá: ${detail.discountName}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.green.shade600, Colors.green.shade800],
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    child: Text(
                      'Tổng tiền: ${order.totalAmount}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Ngày đặt hàng: ${order.createdDate}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                  Text(
                    'Địa chỉ giao hàng: ${order.deliveryAddress}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                      fontFamily: 'Pacifico',
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
