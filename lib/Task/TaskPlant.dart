import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/GardenTaskController.dart';
import '../Controller/VarietyController.dart';
import '../Controller/VarietyStageController.dart';
import '../model/GardenModel.dart';
import '../model/TaskModel.dart';
import 'package:http/http.dart' as http;

import 'GrowthTask.dart';
import 'TaskDetail.dart';

class TaskPlant extends StatefulWidget {
  final int id;
  TaskPlant({required this.id});
  @override
  State<TaskPlant> createState() => _TaskPlantState();
}

class _TaskPlantState extends State<TaskPlant>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getTask(widget.id);
    getVarietyStage(widget.id);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<DataGardenTask> datagardentask = [];
  List<DataVariety> datavariety = [];
  List<DataVarietyStage> datavarietystage = [];
  String taskSearchText = "";
  String searchText = "";

  List<DataGardenTask> sortTasksByStatus(List<DataGardenTask> tasks) {
    tasks.sort((a, b) {
      // Xác định ưu tiên sắp xếp dựa trên trạng thái của nhiệm vụ
      Map<String, int> statusOrder = {
        'Pending': 0,
        'InProgress': 1,
        'Completed': 2,
        'Cancelled': 3,
      };

      int aStatus = statusOrder[a.status!]!;
      int bStatus = statusOrder[b.status!]!;

      // Sắp xếp theo thứ tự ưu tiên
      return aStatus.compareTo(bStatus);
    });
    return tasks;
  }

  Future<void> getTask(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    print('id: $id');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/garden-tasks?activeOnly=false&gardenId=0&plantId=$id';
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
          datagardentask = responseTrans
              .map((item) => DataGardenTask.fromJson(item))
              .toList();
        });
      }
    }
  }

  Future<int?> getCropvariety(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    print('id: $id');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/crop-varieties?activeOnly=true&plantId=$id';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code CropVariety: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          datavariety =
              responseTrans.map((item) => DataVariety.fromJson(item)).toList();
        });
        return datavariety.isNotEmpty
            ? datavariety.first.cropVarietyId ?? null
            : null;
      }
    }
    return null;
  }

  Future<void> getVarietyStage(int id) async {
    int? cropVarietyId = await getCropvariety(id);
    if (cropVarietyId != null) {
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('accessToken');
      final url =
          'https://fruitseasonms.azurewebsites.net/api/crop-variety-stages?activeOnly=true&CropVarietyId=$cropVarietyId';
      Map<String, String> headers = {
        'accept': '*/*',
        'Authorization': 'Bearer $accessToken',
      };
      final response = await http.get(Uri.parse(url), headers: headers);
      final responseTrans = json.decode(response.body)['data'];
      var statusCode = response.statusCode;
      print('Status code Variety: $statusCode');
      if (responseTrans != null) {
        if (responseTrans is List) {
          setState(() {
            datavarietystage = responseTrans
                .map((item) => DataVarietyStage.fromJson(item))
                .toList();
          });
        }
      }
    } else {
      // Handle the case where cropVarietyId is null
      print('CropVarietyId is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DataGardenTask> sortedTasks = sortTasksByStatus(datagardentask);

    List<DataGardenTask> filteredAndSortedTasks = sortedTasks.where((item) {
      return item.gardenTaskName!
          .toLowerCase()
          .contains(taskSearchText.toLowerCase());
    }).toList();

    List<DataVarietyStage> filteredStage = datavarietystage.where((item) {
      return item.stageName!.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    final double fem = 1.0; // Define your fem value here
    final double ffem = 1.0; // Define your ffem value here

    return Scaffold(
      appBar: AppBar(
        title: Text('Công việc', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Công việc'),
            Tab(text: 'Giai đoạn'),
          ],
          labelColor: Colors.black,
          indicatorColor: Colors.black,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Tasks
          Container(
            padding: EdgeInsets.all(15 * fem),
            child: Column(
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
                      hintText: 'Tìm kiếm công việc',
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredAndSortedTasks.length,
                    itemBuilder: (context, index) {
                      DataGardenTask task = filteredAndSortedTasks[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TaskDetail(datagardentask: task),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 8,
                          margin: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          task.gardenTaskName ?? '',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 5,
                                        ),
                                      ),
                                      Text(
                                        '${task.status == "Pending" ? "Chưa hoàn thành" : task.status == "InProgress" ? "Đang thực hiện" : task.status == "Completed" ? "Hoàn thành" : "Hủy bỏ"}',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18 * ffem,
                                          fontWeight: FontWeight.w600,
                                          color: task.status == 'Completed'
                                              ? Colors
                                                  .green // Green color for "Completed" status
                                              : task.status == 'InProgress'
                                                  ? Colors.orange
                                                  : task.status == 'Pending'
                                                      ? Colors.red
                                                      : Color.fromARGB(
                                                          255,
                                                          118,
                                                          123,
                                                          118), // Red color for other statuses
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                        color: Colors.black54,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Hạn hoàn thành:',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        task.gardenTaskDate != null
                                            ? DateFormat('yyyy-MM-dd')
                                                .format(task.gardenTaskDate!)
                                            : '',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Tab 2: Variety Stages
          Container(
            padding: EdgeInsets.all(15 * fem),
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
                      hintText: 'Tìm kiếm giai đoạn',
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredStage.length,
                    itemBuilder: (context, index) {
                      DataVarietyStage stage = filteredStage[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GrowthTask(id: stage.cropVarietyStageId!),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 8,
                          margin: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                    color: Color.fromARGB(255, 43, 167,
                                        101), // Choose your desired color
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  child: Text(
                                    'Giai đoạn: ${stage.stageName ?? ''}',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.nature,
                                            size: 18,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(width: 8),
                                          Flexible(
                                            child: Text(
                                              'Loại cây: ${stage.cropVarietyName ?? ''}',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.description,
                                            size: 18,
                                            color: Colors.black54,
                                          ),
                                          SizedBox(width: 8),
                                          Flexible(
                                            child: Text(
                                              'Description: ${stage.description ?? ''}',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black54,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
