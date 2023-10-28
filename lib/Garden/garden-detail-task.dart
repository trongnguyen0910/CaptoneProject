import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Controller/PlantController.dart';
import '../Plant/PlantDetail.dart';
import '../Plant/PlantObject.dart';
import '../Task/TaskDetail.dart';
import '../Task/TaskObject.dart';
import '../model/TaskModel.dart';
import 'garden.dart';
import 'package:http/http.dart' as http;

class GardenDetailTask extends StatefulWidget {
  final int id;
  GardenDetailTask({required this.id});

  @override
  _GardenDetailTaskState createState() => _GardenDetailTaskState();
}

class _GardenDetailTaskState extends State<GardenDetailTask> {
  int _currentTabIndex = 0;
  String taskSearchText = "";
  String plantSearchText = "";
  List<DataPlant> dataplant = [];
  @override
  void initState() {
    super.initState();
    getPlant(widget.id);
  }

  Future<void> getPlant(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    print('id: $id');
    final url =
        'http://fruitseasonapi-001-site1.atempurl.com/api/plants/plants?activeOnly=true&gardenId=$id';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Plant: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          dataplant =
              responseTrans.map((item) => DataPlant.fromJson(item)).toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DataPlant> filteredTrans = dataplant.where((item) {
      return item.cropName!
          .toLowerCase()
          .contains(plantSearchText.toLowerCase());
    }).toList();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Garden List', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Garden()),
              );
            },
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Task'),
              Tab(text: 'Plant'),
            ],
            onTap: (index) {
              setState(() {
                _currentTabIndex = index;
              });
            },
            labelColor: Colors.black,
            indicatorColor: Colors.black,
          ),
        ),
        body: _currentTabIndex == 0
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          taskSearchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Tasks...',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: TaskModel.taskModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Filter your task items based on 'taskSearchText'
                        // Example: if (TaskModel.taskModel[index].contains(taskSearchText))
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TaskDetail(),
                              ),
                            );
                          },
                          child: TaskObject(
                            index: index,
                            press: () {},
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          plantSearchText = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Plants...',
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300.0,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: filteredTrans.length,
                      itemBuilder: (BuildContext context, int index) {
                        // Filter your plant items based on 'plantSearchText'
                        // Example: if (PlantModel.plantModel[index].contains(plantSearchText))
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlantDetail(dataPlant:dataplant[index]),
                              ),
                            );
                          },
                          child: PlantObject(
                              cropName: filteredTrans[index].cropName,
                              image: filteredTrans[index].image,
                              press: () {}),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
