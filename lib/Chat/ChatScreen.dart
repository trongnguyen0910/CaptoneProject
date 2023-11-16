import 'package:flutter/material.dart';

import 'ChatList.dart';

class ChatDetailPage extends StatefulWidget {
  final Chat chat;

  ChatDetailPage({required this.chat});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.name, style: TextStyle(color: Colors.black)),
         backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () async {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: ListView(
                reverse: true,
                children: _buildChatMessages(),
              ),
            ),
          ),
          _buildChatInput(),
        ],
      ),
    );
  }

  List<Widget> _buildChatMessages() {
    List<Widget> messages = [];
    for (int i = widget.chat.messages.length - 1; i >= 0; i--) {
      messages.add(_buildMessage(widget.chat.messages[i], widget.chat.avatar, i % 2 == 0));
    }
    return messages;
  }

  Widget _buildMessage(String message, String avatar, bool isReceived) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isReceived)
          CircleAvatar(
            backgroundImage: AssetImage(avatar),
            radius: 20,
          ),
        Expanded(
          child: Align(
            alignment: isReceived ? Alignment.topLeft : Alignment.topRight,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: isReceived ? 8 : 0,
              ),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isReceived ? Colors.grey[300] : Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment:
                    isReceived ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.chat.name,
                    style: TextStyle(
                      color: isReceived ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    message,
                    style: TextStyle(color: isReceived ? Colors.black : Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!isReceived)
          CircleAvatar(
            backgroundImage: AssetImage(avatar),
            radius: 20,
          ),
      ],
    );
  }

  Widget _buildChatInput() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              String message = _messageController.text;
              if (message.isNotEmpty) {
                setState(() {
                  widget.chat.messages.add(message);
                });
                _messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}