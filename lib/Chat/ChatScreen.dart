import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signalr_netcore/signalr_client.dart';

import '../Controller/ChatListUserController.dart';
import '../Controller/ListChatController.dart';

class Chat_Page extends StatefulWidget {
  final ChatListUser chatlistuser;
  Chat_Page({Key? key, required this.chatlistuser}) : super(key: key);

  @override
  State<Chat_Page> createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  late Future<ListChats> futureChat;
  late HubConnection hubConnection;
  late String idCurrentUser;
  @override
  void initState() {
    super.initState();
    initHubConnection();
    futureChat = fetchMessages(widget.chatlistuser.userId!);
  }

  Future<void> initHubConnection() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idCurrentUser = await prefs.getInt('accountID').toString();
    final serverUrl =
        "https://fruitseasonapims-001-site1.btempurl.com/chat?userid=${idCurrentUser}";
    print(serverUrl);
    hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();
    hubConnection.onclose(({error}) => print('On close'));
    hubConnection.on("ReceiveMessage", _handleIncomingChatMessage);
    await hubConnection.start();
  }

  void _handleIncomingChatMessage(List<Object?>? args) {
    messages.clear();
    setState(() {
      futureChat = fetchMessages(widget.chatlistuser.userId!);
    });
  }

  Future<void> sendChatMessage(String chatMessage) async {
    if (chatMessage.isEmpty || chatMessage.length == 0) {
      return;
    }
    hubConnection.invoke("SendMessage",
        args: ['$idCurrentUser', '${widget.chatlistuser.userId}', chatMessage]);
  }

  ChatUser userCurrent = ChatUser(
    id: '7',
    firstName: 'Farmer User 1',
    lastName: 'User 1',
  );

  List<ChatMessage> messages = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '${widget.chatlistuser.fullName}',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ListChats>(
              future: futureChat,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Data> datas = snapshot.data!.data ?? [];
                  for (var element in datas) {
                    var message = ChatMessage(
                      text: element.message ?? '',
                      user: ChatUser(
                        id: '${element.sender}',
                        firstName: '${widget.chatlistuser.fullName}',
                      ),
                      createdAt:
                      DateTime.tryParse(element.sendTimeOnUtc ?? '') ??
                          DateTime.now(),
                    );
                    messages.add(message);
                  }
                  return DashChat(
                    currentUser: userCurrent,
                    onSend: (ChatMessage m) {
                      sendChatMessage(m.text);
                    },
                    messages: messages.reversed.toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<ListChats> fetchMessages(int idHoiThoai) async {
  final prefs = await SharedPreferences.getInstance();
  final accessToken = prefs.getString('accessToken');
  final response = await http.get(
      Uri.parse(
          'https://fruitseasonapims-001-site1.btempurl.com/Chats/History/$idHoiThoai'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken',
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ListChats.fromJson({"data": jsonDecode(response.body)});
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
