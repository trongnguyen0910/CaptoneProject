// To parse this JSON data, do
//
//     final dataPost = dataPostFromJson(jsonString);

import 'dart:convert';

DataPost dataPostFromJson(String str) => DataPost.fromJson(json.decode(str));

String dataPostToJson(DataPost data) => json.encode(data.toJson());

class DataPost {
    int? postId;
    String? fullName;
    String? postTitle;
    String? postContent;
    String? postImage;
    String? status;
    String? type;
    DateTime? createdDate;
    DateTime? updateDate;

    DataPost({
        this.postId,
        this.fullName,
        this.postTitle,
        this.postContent,
        this.postImage,
        this.status,
        this.type,
        this.createdDate,
        this.updateDate,
    });

    factory DataPost.fromJson(Map<String, dynamic> json) => DataPost(
        postId: json["postId"],
        fullName: json["fullName"],
        postTitle: json["postTitle"],
        postContent: json["postContent"],
        postImage: json["postImage"],
        status: json["status"],
        type: json["type"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
    );

    Map<String, dynamic> toJson() => {
        "postId": postId,
        "fullName": fullName,
        "postTitle": postTitle,
        "postContent": postContent,
        "postImage": postImage,
        "status": status,
        "type": type,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
    };
}
