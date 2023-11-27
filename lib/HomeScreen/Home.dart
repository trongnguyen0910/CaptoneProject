import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../Chat/ChatList.dart';
import '../Chat/ChatScreen.dart';
import '../ComparePrice/CompareScreen.dart';
import '../ComparePrice/MainCompare.dart';
import '../Controller/GardenTaskController.dart';
import '../Expert/ViewPostExpert.dart';
import '../Fruit/ViewFruit.dart';
import '../Garden/News.dart';
import '../Garden/garden.dart';
import 'package:http/http.dart' as http;

import '../Task/TaskDetail.dart';
import '../Weather/Weather_page.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ScrollController _scrollController = ScrollController();
  bool _isFabVisible = true;

  List<DataGardenTask> datagardentask = [];
  Map<DateTime, List> _markedDateMap = {};

  DateTime parseAPIDate(String dateStr) {
    return DateTime.parse(dateStr);
  }

  // void _markDatesOnCalendar() {
  //   for (var task in datagardentask) {
  //     if (task.gardenTaskDate != null) {
  //       DateTime parsedDate = parseAPIDate(task.gardenTaskDate.toString());
  //       parsedDate =
  //           DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
  //       print('Parsed date: $parsedDate');

  //       if (_markedDateMap[parsedDate] == null) {
  //         _markedDateMap[parsedDate] = [task];
  //       } else {
  //         _markedDateMap[parsedDate]!.add(task);
  //       }
  //     }
  //   }

  //   print('Marked Dates: $_markedDateMap');
  // }
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    List<DataGardenTask> tasksForSelectedDay = datagardentask.where((task) {
      if (task.gardenTaskDate != null) {
        return task.gardenTaskDate?.year == selectedDay.year &&
            task.gardenTaskDate?.month == selectedDay.month &&
            task.gardenTaskDate?.day == selectedDay.day;
      }
      return false;
    }).toList();

    if (tasksForSelectedDay.isNotEmpty) {
      DataGardenTask selectedTask = tasksForSelectedDay.first;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskDetail(datagardentask: selectedTask),
        ),
      );
    }
  }

  bool hasTaskOnDay(DateTime day, List<DataGardenTask> tasks) {
    final formattedDay = DateTime(day.year, day.month, day.day);
    return tasks.any((task) {
      final taskDate = DateTime(task.gardenTaskDate!.year,
          task.gardenTaskDate!.month, task.gardenTaskDate!.day);
      // Kiểm tra nếu công việc không ở trạng thái "complete" thì mới đánh dấu
      if (formattedDay.isAtSameMomentAs(taskDate) &&
          task.status != "Completed") {
        return true;
      }
      return false;
    });
  }

  Future<void> getTask() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/garden-tasks?activeOnly=false&gardenId=0&plantId=0';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body)['data'];
    var statusCode = response.statusCode;
    print('Status code Plant: $statusCode');
    print('responseTrans Plant: $responseTrans');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          datagardentask = responseTrans
              .map((item) => DataGardenTask.fromJson(item))
              .toList();
          // _markDatesOnCalendar();
        });
      }
    }
  }
  _subNoti() async {
    final prefs = await SharedPreferences.getInstance();
    final accountID = prefs.getInt('accountID');
    final accessToken = prefs.getString('accessToken');
    final token = prefs.getString('token');
    print('acc: $accountID');
    var url =
        'https://fruitseasonms.azurewebsites.net/subscribe?registrationToken=$token&topic=$accountID';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
         body: '',
      );

      var statusCode = response.statusCode;
      print('Status code: $statusCode');

      if (response.statusCode == 200) {
        print('SubNoti ok');
      } else if (response.statusCode != 200) {
        var responseString = response.body;
        var responseBody = json.decode(responseString);
        var errorMessage = responseBody['errors'];
        print('Response body: $responseString');
        print('Error 400: $errorMessage');
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getTask();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // User is scrolling up, show FloatingActionButton
        setState(() {
          _isFabVisible = true;
        });
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // User is scrolling down, hide FloatingActionButton
        setState(() {
          _isFabVisible = false;
        });
      }
    });
    _subNoti();
  }

  final List<String> imageList = [
    "https://images.unsplash.com/photo-1464297162577-f5295c892194?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
    "https://images.unsplash.com/photo-1536657464919-892534f60d6e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80",
    "https://images.unsplash.com/photo-1438274754346-45322cac87e4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2048&q=80",
    "https://images.unsplash.com/photo-1519180392711-496e450edf6a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
    "https://images.unsplash.com/photo-1670768170262-f8606bbcbbac?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2069&q=80",
    "https://images.unsplash.com/photo-1678988764041-7989a86ee351?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2074&q=80",
  ];
  final List<String> imageNews = [
    "https://i.makeagif.com/media/12-03-2017/Bx_HKp.gif",
    "https://nongnghiephuucovn.vn/uploads/tin-tuc/xkns11.jpg",
    "https://congthuong-cdn.mastercms.vn/stores/news_dataimages/2022/122022/16/17/420221216174031.png?rt=20221216175008",
    "https://img.cand.com.vn/resize/800x800/NewFiles/Images/2021/09/22/1519360048news10736_MGNA-1632275748602.jpg",
    "https://vtv1.mediacdn.vn/thumb_w/640/2023/1/13/nong-san-xuat-trung-quoc-1-1673584638583165452091.jpg",
    "https://ngkt.mofa.gov.vn/wp-content/uploads/2020/03/4-1.jpg",
  ];
  final List<String> comparePrice = [
    "https://images.unsplash.com/photo-1695199481826-b7e467746bff?auto=format&fit=crop&q=80&w=1932&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1695892909756-f10b2ca3a093?auto=format&fit=crop&q=80&w=1932&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ];
  @override
  Widget build(BuildContext context) {
    CalendarFormat _calendarFormat = CalendarFormat.month;
    DateTime _focusedDay = DateTime.now();
    DateTime? _selectedDay;
    double baseWidth = 428;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          // homefm3 (2985:1182)
          width: double.infinity,
          height: 1242 * fem,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                // autogroupuk89BDb (MwWtE1NdpnWSDzNBeCUk89)
                left: 0 * fem,
                top: 350 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 30 * fem, 19 * fem, 177 * fem),
                  width: 428 * fem,
                  height: 1099 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Thông tin khu vườn",
                        style: TextStyle(
                          fontSize: 20, // Điều chỉnh kích thước tiêu đề tùy ý
                          fontWeight:
                              FontWeight.bold, // Điều chỉnh kiểu chữ tùy ý
                        ),
                      ),
                      Container(
                        // autogroupnoihr4q (MwWt8BD1xfSeh6CM27Noih)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 30 * fem),
                        padding: EdgeInsets.fromLTRB(
                            20.5 * fem, 20 * fem, 20.5 * fem, 20 * fem),
                        width: double.infinity,
                        height: 165 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffebebeb)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Thực hiện chuyển trang khi bấm vào Carousel
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Garden()),
                            );
                          },
                          child: CarouselSlider(
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                            ),
                            items: imageList
                                .map((e) => ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Image.network(
                                            e,
                                            width: 1050,
                                            height: 350,
                                            fit: BoxFit.cover,
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      Text(
                        "Thông tin chuyên gia",
                        style: TextStyle(
                          fontSize: 20, // Điều chỉnh kích thước tiêu đề tùy ý
                          fontWeight:
                              FontWeight.bold, // Điều chỉnh kiểu chữ tùy ý
                        ),
                      ),
                      Container(
                        // autogroupnoihr4q (MwWt8BD1xfSeh6CM27Noih)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 30 * fem),
                        padding: EdgeInsets.fromLTRB(
                            20.5 * fem, 20 * fem, 20.5 * fem, 20 * fem),
                        width: double.infinity,
                        height: 165 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffebebeb)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewPost()),
                            );
                          },
                          child: CarouselSlider(
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                            ),
                            items: imageList
                                .map((e) => ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Image.network(
                                            e,
                                            width: 1050,
                                            height: 350,
                                            fit: BoxFit.cover,
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      Text(
                        "Tin tức nông sản",
                        style: TextStyle(
                          fontSize: 20, // Điều chỉnh kích thước tiêu đề tùy ý
                          fontWeight:
                              FontWeight.bold, // Điều chỉnh kiểu chữ tùy ý
                        ),
                      ),
                      Container(
                        // autogroupnoihr4q (MwWt8BD1xfSeh6CM27Noih)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 30 * fem),
                        padding: EdgeInsets.fromLTRB(
                            20.5 * fem, 20 * fem, 20.5 * fem, 20 * fem),
                        width: double.infinity,
                        height: 165 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffebebeb)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Thực hiện chuyển trang khi bấm vào Carousel
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsWebView()),
                            );
                          },
                          child: CarouselSlider(
                            options: CarouselOptions(
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                autoPlay: true,
                                scrollDirection: Axis.horizontal,
                                autoPlayInterval: Duration(seconds: 5)),
                            items: imageNews
                                .map((e) => ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Image.network(
                                            e,
                                            width: 1050,
                                            height: 350,
                                            fit: BoxFit.cover,
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      Text(
                        "So sánh giá",
                        style: TextStyle(
                          fontSize: 20, // Điều chỉnh kích thước tiêu đề tùy ý
                          fontWeight:
                              FontWeight.bold, // Điều chỉnh kiểu chữ tùy ý
                        ),
                      ),
                      Container(
                        // autogroupnoihr4q (MwWt8BD1xfSeh6CM27Noih)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 30 * fem),
                        padding: EdgeInsets.fromLTRB(
                            20.5 * fem, 20 * fem, 20.5 * fem, 20 * fem),
                        width: double.infinity,
                        height: 165 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffebebeb)),
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10 * fem),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            // Thực hiện chuyển trang khi bấm vào Carousel
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CompareScreen()),
                            );
                          },
                          child: CarouselSlider(
                            options: CarouselOptions(
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                autoPlay: true,
                                scrollDirection: Axis.horizontal,
                                autoPlayInterval: Duration(seconds: 5)),
                            items: comparePrice
                                .map((e) => ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: <Widget>[
                                          Image.network(
                                            e,
                                            width: 1050,
                                            height: 350,
                                            fit: BoxFit.cover,
                                          )
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // group245ZdT (2993:2663)
                left: 0 * fem,
                top: 102 * fem,
                child: Container(
                  width: 428 * fem,
                  height: 255 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // rectangle51gTB (2970:1156)
                        left: 0 * fem,
                        top: 0 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 428 * fem,
                            height: 400 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xff6cc51d),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2,
                        top: 1,
                        child: Container(
                          width: 390,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0, 4),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: TableCalendar(
                            calendarBuilders: CalendarBuilders(
                              markerBuilder: (context, date, events) {
                                final hasTask =
                                    hasTaskOnDay(date, datagardentask);
                                if (hasTask) {
                                  return Positioned(
                                    bottom: 1,
                                    child: Container(
                                      width: 6, // Điều chỉnh kích thước marker
                                      height: 6,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red, // Màu của marker
                                      ),
                                    ),
                                  );
                                }
                                return null;
                              },
                            ),
                            locale: 'vi_VN',
                            availableCalendarFormats: {
                              CalendarFormat.month: 'Tháng',
                              CalendarFormat.week: 'Tuần',
                            },
                            calendarFormat: _calendarFormat,
                            headerStyle: HeaderStyle(
                              titleCentered: true,
                              formatButtonShowsNext: false,
                              formatButtonVisible: false,
                              titleTextStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black), // Text color
                            ),
                            daysOfWeekStyle: DaysOfWeekStyle(
                              weekdayStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black), // Weekday text color
                              weekendStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black), // Weekend text color
                            ),
                            rowHeight:
                                30, // Điều chỉnh chiều cao của hàng ngày trong lịch
                            focusedDay: _focusedDay,
                            firstDay: DateTime.utc(2023, 1, 1),
                            lastDay: DateTime.utc(2023, 12, 31),
                            selectedDayPredicate: (day) {
                              return isSameDay(_selectedDay, day);
                            },
                            onDaySelected: _onDaySelected,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                // topmGu (2985:1203)
                left: 0 * fem,
                top: 0 * fem,
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    18 * fem,
                    14.87 * fem,
                    17 * fem,
                    6.78 * fem,
                  ),
                  width: 558 * fem,
                  height: 102 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xff6cc51d),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // frame168Ztu (2993:2629)
                        margin: EdgeInsets.fromLTRB(
                          1.72 * fem,
                          25 * fem,
                          100.72 * fem,
                          0 * fem,
                        ),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // brocoliH4D (2993:2630)
                              margin: EdgeInsets.fromLTRB(
                                0 * fem,
                                0 * fem,
                                5 * fem,
                                0 * fem,
                              ),
                              width: 46.56 * fem,
                              height: 49.01 * fem,
                              child: Image.asset(
                                'assets/mobile/images/brocoli.png',
                                width: 46.56 * fem,
                                height: 49.01 * fem,
                              ),
                            ),
                            Container(
                              // skinclinicyhj (2993:2632)
                              margin: EdgeInsets.fromLTRB(
                                0 * fem,
                                0 * fem,
                                0 * fem,
                                0 * fem,
                              ),
                              child: Text(
                                'Fruit season',
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 32 * ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5 * ffem / fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WeatherPage()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                  60 * fem,
                                  0 * fem,
                                  0 * fem,
                                  0 * fem,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons
                                          .cloud, // You can replace this with your desired icon
                                      color: Colors
                                          .white, // Set the color you prefer
                                      size: 30.0, // Adjust the size as needed
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewFruit()),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(
                                  20 * fem,
                                  0 * fem,
                                  0 * fem,
                                  0 * fem,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons
                                          .list, // You can replace this with your desired icon
                                      color: Colors
                                          .white, // Set the color you prefer
                                      size: 35.0, // Adjust the size as needed
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _isFabVisible
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatListPage()));
              },
              tooltip: 'Add Post',
              child: Icon(Icons.chat),
              backgroundColor: Color(0xff6cc51d),
            )
          : null,
    );
  }
}
