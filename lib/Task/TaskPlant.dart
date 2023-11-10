import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/GardenTaskController.dart';
import '../model/GardenModel.dart';
import '../model/TaskModel.dart';
import 'package:http/http.dart' as http;

import 'TaskDetail.dart';

class TaskPlant extends StatefulWidget {
  final int id;
  TaskPlant({required this.id});
  @override
  State<TaskPlant> createState() => _TaskPlantState();
}

class _TaskPlantState extends State<TaskPlant> {
  @override
  void initState() {
    super.initState();
    getTask(widget.id);
  }

  List<DataGardenTask> datagardentask = [];
  String taskSearchText = "";

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
        'https://fruitseasonapims-001-site1.btempurl.com/api/garden-tasks?activeOnly=false&gardenId=0&plantId=$id';
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

  @override
  Widget build(BuildContext context) {
    List<DataGardenTask> sortedTasks = sortTasksByStatus(datagardentask);

    List<DataGardenTask> filteredAndSortedTasks = sortedTasks.where((item) {
      return item.gardenTaskName!
          .toLowerCase()
          .contains(taskSearchText.toLowerCase());
    }).toList();

    final double fem = 1.0; // Define your fem value here
    final double ffem = 1.0; // Define your ffem value here

    return Scaffold(
      appBar: AppBar(
        title: Text('Task', style: TextStyle(color: Colors.black)),
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
                  hintText: 'Search Tasks...',
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
                          builder: (context) => TaskDetail(datagardentask: task),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 18 * fem),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10 * fem),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    task.gardenTaskName ?? '',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5 * ffem,
                                      color: Color(0xff000000),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Text(
                                  task.status ?? '',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem,
                                    color: task.status == "Completed"
                                        ? Color.fromARGB(255, 1, 124, 5)
                                        : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              task.gardenTaskDate != null
                                  ? DateFormat('yyyy-MM-dd').format(task.gardenTaskDate!)
                                  : '',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.5 * ffem,
                                color: Color(0xff000000),
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
    );
  }
}