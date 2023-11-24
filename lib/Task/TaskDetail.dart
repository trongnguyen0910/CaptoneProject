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

    Future<void> finishTask(int taskID) async {
    print('fruitId: $taskID');
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonapims-001-site1.btempurl.com/api/garden-tasks/$taskID';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.delete(Uri.parse(url), headers: headers);
    var statusCode = response.statusCode;
    print('Delete success: $statusCode');
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
                          Text(
                            '${widget.datagardentask.gardenTaskName}',
                            style: GoogleFonts.poppins(
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.18 * fem,
                              color: Color(0xff000000),
                            ),
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
                      title: Text('Confirm Finish'),
                      content: Text('Are you sure you want to finish this task?'),
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
                          child: Text('Finish'),
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
            label: Text('Finish Task'),
            icon: Icon(Icons.check),
            backgroundColor: Color(0xff6cc51d),
          ),
          SizedBox(height: 16.0),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateTaskScreen(datagardentask: widget.datagardentask),
                ),
              );
            },
            label: Text('Update Task'),
            icon: Icon(Icons.edit),
            backgroundColor: Color(0xff6cc51d),
          ),
        ],
      ),
    );
  }
}
