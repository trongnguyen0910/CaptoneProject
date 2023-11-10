import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/DataFruitController.dart';
import '../Controller/DataPostController.dart';
import '../Controller/GardenController.dart';
import '../GetX/GardenGetX.dart';
import '../HomeScreen/Home.dart';
import '../model/GardenModel.dart';

import 'package:http/http.dart' as http;

import 'PostObject.dart';
import 'ViewPostExpertDetail.dart';



class ViewPost extends StatefulWidget {
  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  List<DataPost> datapost = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    getPost();
  }

  Future<void> getPost() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonapims-001-site1.btempurl.com/api/posts?activeOnly=true';
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
          datapost =
              responseTrans.map((item) => DataPost.fromJson(item)).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DataPost> filteredTrans = datapost.where((item) {
      return item.postTitle!.toLowerCase().contains(searchText.toLowerCase());
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
      body: SingleChildScrollView(
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
            GridView.builder(
              shrinkWrap: true, // Ensure the GridView takes the required space
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemCount: filteredTrans.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetail(datapost: datapost[index]),
                      ),
                    );
                  },
                  child: PostObject(
                    fullName: filteredTrans[index].fullName,
                    type: filteredTrans[index].type,
                    postContent: filteredTrans[index].postContent,
                    postImage: filteredTrans[index].postImage,
                    press: () {},
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
