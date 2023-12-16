import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Controller/GardenController.dart';
import '../GetX/GardenGetX.dart';
import '../HomeScreen/Home.dart';
import '../model/GardenModel.dart';
import 'GardenObject.dart';
import 'garden-detail-task.dart';

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
    final accountID = prefs.getInt('accountID');

    final url =
        'https://fruitseasonms.azurewebsites.net/api/gardens?activeOnly=true&userId=$accountID';
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

 Future<void> _deleteGarden(int gardenId) async {
    print('gardenId: $gardenId');
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/gardens/$gardenId';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.delete(Uri.parse(url), headers: headers);
    var statusCode = response.statusCode;
    print('Status: $statusCode');
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
        title: Text('Danh sách khu vườn', style: TextStyle(color: Colors.black)),
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
                hintText: 'Tìm kiếm...',
              ),
            ),
          ),
          Expanded(
  child: filteredTrans.isNotEmpty
      ? ListView.builder(
          itemCount: filteredTrans.length,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(25.0), 
              child: Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.15,
                secondaryActions: [
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () async {
                      // Show a confirmation dialog
                      bool confirm = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Confirm Deletion'),
                            content:
                                Text('Are you sure you want to delete this garden?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text('Delete'),
                              ),
                            ],
                          );
                        },
                      );
                      if (confirm == true) {
                        _deleteGarden(filteredTrans[index].gardenId!);
                        await getGarden();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) => Garden()),
                        );
                      }
                    },
                  ),
                ],
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GardenDetailTask(
                          id: filteredTrans[index].gardenId!,
                        ),
                      ),
                    );
                  },
                  child: GardenObject(
                    gardenName: filteredTrans[index].gardenName,
                    description: filteredTrans[index].description,
                    fullName: filteredTrans[index].fullName,
                    region: filteredTrans[index].region,
                    image: filteredTrans[index].image,
                    quantityplant: filteredTrans[index].quantityPlanted,
                    press: () {},
                  ),
                ),
              ),
            );
          },
        )
      : Center(
          child: CircularProgressIndicator(),
        ),
),

        ],
      ),
    );
  }
}
