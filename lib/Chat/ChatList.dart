import 'package:flutter/material.dart';

import 'ChatScreen.dart';


class Chat {
  String name;
  String message;
  String avatar;
  List<String> messages;

  Chat({required this.name, required this.message, required this.avatar}) : messages = [message];
}
class ChatListPage extends StatelessWidget {
  final List<Chat> chatList = [
    Chat(
      avatar: 'assets/mobile/images/avartarcomment.png',
      name: 'Duy',
      message: 'Alo',
    ),
    Chat(
      avatar: 'assets/mobile/images/avartarcomment.png',
      name: 'Minh',
      message: 'Ok',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List', style: TextStyle(color: Colors.black)),
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
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chatList[index].avatar),
            ),
            title: Text(chatList[index].name),
            subtitle: Text(chatList[index].message),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(chat: chatList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
