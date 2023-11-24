import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/ComparePriceController.dart';

import 'package:http/http.dart' as http;

import '../HomeScreen/Home.dart';
import 'CompareScreen.dart';



class CompareScreen extends StatefulWidget {
  const CompareScreen({Key? key}) : super(key: key);

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  List<DataCompare> trans = [];
  List<DataCompare> allTrans = [];
  final scrollController = ScrollController();
  String searchText = '';
  int page = 1;
  int pageSize = 20;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    getTrans();
  }

  Future<void> getTrans() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');

    final url =
        'https://fruitseasonapims-001-site1.btempurl.com/api/fruit-histories?page=$page&pageSize=$pageSize&userId=0';
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
          trans = responseTrans.map((item) => DataCompare.fromJson(item)).toList();
          allTrans = List.from(allTrans)..addAll(trans);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DataCompare> filteredTrans = allTrans.where((item) {
      return item.fruitName!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('So sánh giá', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          // Check if swiped left
          if (details.primaryVelocity! < 0) {
            // Navigate to another screen using Navigator.push
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
            );
          }
        },
        child: Column(
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
                controller: scrollController,
                itemCount: filteredTrans.length + (isLoading ? 1 : 0),
                itemBuilder: (BuildContext context, int index) {
                  if (index == filteredTrans.length) {
                    if (isLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container();
                    }
                  } else {
                    return ListComparePrice(
                      historyId: filteredTrans[index].historyId,
                      fruitName: filteredTrans[index].fruitName,
                      price: filteredTrans[index].price,
                      location: filteredTrans[index].location,
                      status: filteredTrans[index].status,
                      createdDate: filteredTrans[index].createdDate,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        setState(() {
          isLoading = true;
        });
        page = page + 1;
        getTrans().then((_) {
          setState(() {
            isLoading = false;
          });
        });
      }
    }
  }
}



// Future<List<OrderProduct>> getOrder() async {
//    final prefs = await SharedPreferences.getInstance();
//    final accessToken = prefs.getString('accesstoken');
//     final url = 'https://node-js-wallet-fpt-2.herokuapp.com/orders/{id}';
//    Map<String, String> headers = {
//   'Authorization': 'Bearer $accessToken',
//    'Content-Type': 'application/json',
//   };
//    final response = await http.get(Uri.parse(url), headers: headers);

//     final responseOrder = json.decode(response.body) as List;
//     // print('responseData: $responseData');
//     if (response.statusCode == 200) {
//       return responseOrder.map((e) => OrderProduct.fromJson(e)).toList();
//     } else {
//       throw Exception("Fail to fetch");
//     }
//   }


