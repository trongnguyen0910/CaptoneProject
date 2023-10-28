import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/ComparePriceController.dart';

import 'package:http/http.dart' as http;

import 'CompareScreen.dart';



class CompareScreen extends StatefulWidget {
  const CompareScreen({Key? key}) : super(key: key);

  @override
  State<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  List<DataCompare> trans = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    getTrans();
  }

  Future<void> getTrans() async {
    final url = 'http://fruitseasonapi-001-site1.atempurl.com/api/fruit-histories';
    Map<String, String> headers = {
      'accept': '*/*',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];

    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          trans = responseTrans.map((item) => DataCompare.fromJson(item)).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DataCompare> filteredTrans = trans.where((item) {
      return item.fruitName!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 54, 135, 54),
        title: Text('Compare Price'),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                searchText = '';
              });
            },
          ),
        ],
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
                return ListComparePrice(
                  historyId: filteredTrans[index].historyId,
                  fruitName: filteredTrans[index].fruitName,
                  price: filteredTrans[index].price,
                  location: filteredTrans[index].location,
                  status: filteredTrans[index].status,
                  createdDate: filteredTrans[index].createdDate,
                  updateDate: filteredTrans[index].updateDate,
                );
              },
            ),
          ),
        ],
      ),
    );
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


