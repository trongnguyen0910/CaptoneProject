import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Controller/GardenTaskController.dart';
import 'package:myapp/Garden/garden-detail-task.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../HomeScreen/Home.dart';
import 'UpdateTask.dart';

class TaskDetail extends StatefulWidget {
  final DataGardenTask datagardentask;
  TaskDetail({Key? key, required this.datagardentask}) : super(key: key);

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  String updateDate = ''; 
  Future<void> finishTask(int taskID) async {
    print('fruitId: $taskID');
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/garden-tasks/$taskID';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.delete(Uri.parse(url), headers: headers);
    var statusCode = response.statusCode;
    print('Delete success: $statusCode');
  }

  _createNoti() async {
    final prefs = await SharedPreferences.getInstance();
    final accountID = prefs.getInt('accountID');
    final accessToken = prefs.getString('accessToken');
    print('acc: $accountID');
    var message = widget.datagardentask.gardenTaskName;
    var notificationType = widget.datagardentask.plantName;
    var updateDate = this.updateDate;
    var userId = accountID;
    print('date: $updateDate');
    var url =
        'https://fruitseasonms.azurewebsites.net/api/notifications';

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    print('update: $updateDate');
    var data = {
      'message': message,
      'userId': userId,
      'updateDate': updateDate,
      'notificationType': notificationType,
    };

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );

      var statusCode = response.statusCode;
      print('Status code: $statusCode');

      if (response.statusCode == 200) {
        print('ok');
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: AwesomeSnackbarContent(
            title: 'Thành công',
            message: 'Đã đặt lịch nhắc nhở',
            contentType: ContentType.success,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        Future.delayed(Duration(seconds: 2), () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => ViewFruit()),
          // );
        });
      } else if (response.statusCode != 200) {
        var responseString = response.body;
        var responseBody = json.decode(responseString);
        var errorMessage = responseBody['message'];
        String errorContent = errorMessage.toString();
        final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'Error',
            message: errorContent,
            contentType: ContentType.failure,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snackBar);
        print('Response body: $responseString');
        print('Error 400: $errorMessage');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      // Combine selected time with the existing date
      DateTime selectedDateTime = DateTime(
        widget.datagardentask.gardenTaskDate!.year,
        widget.datagardentask.gardenTaskDate!.month,
        widget.datagardentask.gardenTaskDate!.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      setState(() {
        updateDate = selectedDateTime.toIso8601String();
        _createNoti();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      backgroundColor: Color(0xfff5f5f5), // Background color
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300 * fem,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '${widget.datagardentask.image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${widget.datagardentask.gardenTaskName}',
                                style: GoogleFonts.poppins(
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.18 * fem,
                                  color: Color(0xff000000),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.notifications,
                                    color: Colors.green),
                                onPressed: () {
                                  _selectTime(context);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            'Bắt đầu: ${widget.datagardentask.createdDate}\nKết thúc: ${widget.datagardentask.gardenTaskDate} ',
                            style: GoogleFonts.poppins(
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff868889),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            '${widget.datagardentask.description}',
                            style: GoogleFonts.poppins(
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () async {
              // Show a confirmation dialog
              bool confirm = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Xác nhận kết thúc'),
                    content: Text('Bạn có chắc chắn kết thúc công việc này không?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('Hủy'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text('Kết Thúc'),
                      ),
                    ],
                  );
                },
              );
              if (confirm == true) {
                finishTask(widget.datagardentask.gardenTaskId!);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              }
            },
            label: Text('Kết thúc'),
            icon: Icon(Icons.check),
            backgroundColor: Color(0xff6cc51d),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      UpdateTaskScreen(datagardentask: widget.datagardentask),
                ),
              );
            },
            label: Text('Cập nhật'),
            icon: Icon(Icons.edit),
            backgroundColor: Color(0xff6cc51d),
          ),
        ],
      ),
    );
  }
}
