import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/DataVarietyGrowth.dart';
import '../Controller/GardenTaskController.dart';
import 'package:http/http.dart' as http;

import 'TaskDetail.dart';

class GrowthTask extends StatefulWidget {
  final int id;
  GrowthTask({required this.id});
  @override
  State<GrowthTask> createState() => _GrowthTaskState();
}

class _GrowthTaskState extends State<GrowthTask> {
  @override
  void initState() {
    super.initState();
    getVarietyGrowth(widget.id);
  }

  List<DataVarietyGrowth> datagavarietygrowth = [];

  String taskSearchText = "";

  List<DataVarietyGrowth> sortTasksByStatus(List<DataVarietyGrowth> tasks) {
    tasks.sort((a, b) {
      // Xác định ưu tiên sắp xếp dựa trên trạng thái của nhiệm vụ
      Map<String, int> status = {
        'Pending': 0,
        'InProgress': 1,
        'Completed': 2,
        'Cancelled': 3,
      };

     int aStatus = status[a.status!]!;
     int bStatus = status[b.status!]!;

      // Sắp xếp theo thứ tự ưu tiên
      return aStatus.compareTo(bStatus);
    });
    return tasks;
  }


  Future<void> getVarietyGrowth(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    print('id: $id');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/crop-variety-growth-tasks?activeOnly=true&cropVarietyStageId=$id';
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
          datagavarietygrowth = responseTrans
              .map((item) => DataVarietyGrowth.fromJson(item))
              .toList();
        });
      }
    }
  }



 @override
  Widget build(BuildContext context) {
    List<DataVarietyGrowth> sortedTasks = sortTasksByStatus(datagavarietygrowth);
    List<DataVarietyGrowth> filteredAndSortedTasks = sortedTasks
        .where((item) =>
            item.taskName!.toLowerCase().contains(taskSearchText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Các công việc tăng trưởng',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
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
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredAndSortedTasks.length,
                itemBuilder: (context, index) {
                  DataVarietyGrowth stagegrowth = filteredAndSortedTasks[index];
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Handle onTap as needed
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
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
                            Text(
                              'Tên công việc: ${stagegrowth.taskName ?? ''}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
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
                                  'Ngày bắt đầu: ${DateFormat('yyyy-MM-dd').format(stagegrowth.startDate!)}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                  color: Colors.black54,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Ngày kết thúc: ${DateFormat('yyyy-MM-dd').format(stagegrowth.endDate!)}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54,
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
                                    'Mô tả: ${stagegrowth.description ?? ''}',
                                    style: TextStyle(
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