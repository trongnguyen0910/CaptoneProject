// To parse this JSON data, do
//
//     final chatListUser = chatListUserFromJson(jsonString);

import 'dart:convert';

ChatListUser chatListUserFromJson(String str) => ChatListUser.fromJson(json.decode(str));

String chatListUserToJson(ChatListUser data) => json.encode(data.toJson());

class ChatListUser {
    int? userId;
    int? roleId;
    String? email;
    String? fullName;

    ChatListUser({
        this.userId,
        this.roleId,
        this.email,
        this.fullName,
    });

    factory ChatListUser.fromJson(Map<String, dynamic> json) => ChatListUser(
        userId: json["userId"],
        roleId: json["roleId"],
        email: json["email"],
        fullName: json["fullName"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "roleId": roleId,
        "email": email,
        "fullName": fullName,
    };
}
