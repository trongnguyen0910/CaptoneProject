import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Controller/ChatListUserController.dart';
import 'ChatScreen.dart';

class ChatListPage extends StatefulWidget {
  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
    List<ChatListUser> chatlistuser = [];
    Future<void> getChat() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final url =
        'https://fruitseasonms.azurewebsites.net/Chats/Users';
    Map<String, String> headers = {
      'accept': '*/*',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(Uri.parse(url), headers: headers);
    final responseTrans = json.decode(response.body);
    var statusCode = response.statusCode;
    print('Status list chat user: $statusCode');
    if (responseTrans != null) {
      if (responseTrans is List) {
        setState(() {
          chatlistuser =
              responseTrans.map((item) => ChatListUser.fromJson(item)).toList();
        });
      }
    }
  }

@override
void initState(){
super.initState();
getChat();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trò chuyện', style: TextStyle(color: Colors.black)),
         backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        itemCount: chatlistuser.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/mobile/images/avartarcomment.png'),
            ),
            title: Text(chatlistuser[index].email!),
            subtitle: Text(chatlistuser[index].fullName!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Chat_Page(chatlistuser: chatlistuser[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
