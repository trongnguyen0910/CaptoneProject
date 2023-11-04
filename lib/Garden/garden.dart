import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/GardenController.dart';
import '../GetX/GardenGetX.dart';
import '../HomeScreen/Home.dart';
import '../model/GardenModel.dart';
import 'GardenObject.dart';
import 'garden-detail-task.dart';
import 'package:http/http.dart' as http;

class Garden extends StatefulWidget {
  @override
  State<Garden> createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  List<DataGarden> datagarden = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    getGarden();
  }

  Future<void> getGarden() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'http://fruitseasonapims-001-site1.btempurl.com/api/gardens?activeOnly=true';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Garden: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          datagarden =
              responseTrans.map((item) => DataGarden.fromJson(item)).toList();
        });
        Get.find<GardenController>().updateGardenList(datagarden);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DataGarden> filteredTrans = datagarden.where((item) {
      return item.gardenName!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: Text('Garden List', style: TextStyle(color: Colors.black)),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            GardenDetailTask(id: datagarden[index].gardenId!),
                      ),
                    );
                  },
                  child: GardenObject(
                      gardenName: filteredTrans[index].gardenName,
                      description: filteredTrans[index].description,
                      fullName: filteredTrans[index].fullName,
                      region: filteredTrans[index].region,
                      image: filteredTrans[index].image,
                      press: () {}),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
