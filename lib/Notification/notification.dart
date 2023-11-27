import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Controller/NotificationController.dart';

class NotificationClass extends StatefulWidget {
  @override
  State<NotificationClass> createState() => _NotificationClassState();
}

class _NotificationClassState extends State<NotificationClass> {
  @override
  void initState() {
    super.initState();
    getNoti();
  }

  List<DataNotification> notifications = [];
  Future<void> getNoti() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/api/notifications?activeOnly=true';
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
          notifications = responseTrans
              .map((item) => DataNotification.fromJson(item))
              .toList();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Thông báo', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: notifications.isNotEmpty
          ? ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationCard(notification: notification);
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final DataNotification notification;

  NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(15.0), // Adjust the radius as needed
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: _buildNotificationIcon(notification.status!),
        title: Text(
          notification.message!,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'From: ${notification.fullName}',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'Type: ${notification.notificationType}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        onTap: () {
          // Handle tapping on a notification
        },
      ),
    );
  }

  Widget _buildNotificationIcon(String notificationType) {
    IconData iconData;
    Color iconColor;
    switch (notificationType) {
      case 'InActive':
        iconData = Icons.notifications;
        iconColor = Colors.blue;
        break;
      case 'Active':
        iconData = Icons.event_note;
        iconColor = Colors.green;
        break;
      default:
        iconData = Icons.info;
        iconColor = Colors.grey;
    }

    return Icon(
      iconData,
      color: iconColor,
      size: 30,
    );
  }
}
