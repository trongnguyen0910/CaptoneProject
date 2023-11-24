import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Controller/DiscountController.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_divider/text_divider.dart';

import '../Controller/DataFruitController.dart';
import '../Controller/GardenController.dart';
import '../Divider/CustomDivider.dart';
import '../GetX/GardenGetX.dart';
import '../HomeScreen/Home.dart';
import '../model/GardenModel.dart';
import 'FruitDetail.dart';
import 'FruitObject.dart';
import 'package:http/http.dart' as http;

import 'PostFruit.dart';

class ViewFruit extends StatefulWidget {
  @override
  State<ViewFruit> createState() => _ViewFruitState();
}

class _ViewFruitState extends State<ViewFruit> {
  ScrollController _scrollController = ScrollController();
  List<DataFruit> fruit = [];
  List<DataDiscount> discount = [];
  String searchText = '';
  bool _isFabVisible = true;

  @override
  void initState() {
    super.initState();
    getFruit();
    getDiscount();

    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isFabVisible = true;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isFabVisible = false;
        });
      }
    });
  }

  Future<void> getFruit() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonapims-001-site1.btempurl.com/api/fruits/fruit-farmers?activeOnly=true';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Fruit: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          fruit =
              responseTrans.map((item) => DataFruit.fromJson(item)).toList();
        });
      }
    }
  }

  Future<void> getDiscount() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonapims-001-site1.btempurl.com/api/fruit-discounts?activeOnly=true';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Fruit: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          discount =
              responseTrans.map((item) => DataDiscount.fromJson(item)).toList();
        });
      }
    }
  }

  String _formatDate(DateTime? date) {
    return date != null ? "${date.day}/${date.month}/${date.year}" : "N/A";
  }

  Widget customBox({
    double? discountPercentage,
    DateTime? discountExpiryDate,
    int? discountThreshold,
    String? fruitName,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => DetailPage(text, price, img)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Container(
            height: 300,
            width: 150,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Image(
                      image:
                          AssetImage("assets/mobile/images/avartarcomment.png"),
                    ),
                  ),
                ),
                 SizedBox(height: 16),
                Text(
                  "Tên sản phẩm: $fruitName",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  "Mục Tiêu: $discountThreshold",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  "Phần trăm giảm giá: ${(discountPercentage! * 100).toStringAsFixed(0)}%",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                LinearProgressIndicator(
                  value: 0.5, // Adjust this value based on progress
                  backgroundColor: Colors.grey[300]!,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                SizedBox(height: 16),
                Text(
                  "Ngày kết thúc: ${_formatDate(discountExpiryDate)}",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<DataFruit> filteredTrans = fruit.where((item) {
      return item.fruitName!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit List', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
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
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.0), // Adjust padding as needed
              child: FancyTextDivider(text: 'Danh sách trái cây đặt cọc'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(bottom: 25.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                    height: 330,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: discount
                          .length, // Use the length of the discount list
                      itemBuilder: (context, index) {
                        return customBox(
                          discountThreshold: discount[index].discountThreshold,
                          discountExpiryDate:
                              discount[index].discountExpiryDate,
                          discountPercentage:
                              discount[index].discountPercentage,
                          fruitName: discount[index].fruitName,
                        );
                      },
                    )),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10.0), // Adjust padding as needed
              child: FancyTextDivider(text: 'Danh sách trái cây'),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300.0,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FruitDetail(fruit: fruit[index]),
                      ),
                    );
                  },
                  child: FruitObject(
                    fruitName: filteredTrans[index].fruitName,
                    price: filteredTrans[index].price,
                    quantityAvailable: filteredTrans[index].quantityAvailable,
                    fruitImages: filteredTrans[index].fruitImages,
                    fruitId: filteredTrans[index].fruitId,
                    press: () {},
                  ),
                );
              },
              childCount: filteredTrans.length,
            ),
          ),
        ],
      ),
      floatingActionButton: _isFabVisible
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreatePost()));
              },
              tooltip: 'Add Post',
              child: Icon(Icons.add),
              backgroundColor: Color(0xff6cc51d),
            )
          : null,
    );
  }
}
