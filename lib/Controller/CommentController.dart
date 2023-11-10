// To parse this JSON data, do
//
//     final dataComment = dataCommentFromJson(jsonString);

import 'dart:convert';

DataComment dataCommentFromJson(String str) => DataComment.fromJson(json.decode(str));

String dataCommentToJson(DataComment data) => json.encode(data.toJson());

class DataComment {
    int? commentId;
    String? postContent;
    String? fullName;
    String? commentContent;
    int? parentId;
    DateTime? createdDate;
    DateTime? updateDate;
    String? status;

    DataComment({
        this.commentId,
        this.postContent,
        this.fullName,
        this.commentContent,
        this.parentId,
        this.createdDate,
        this.updateDate,
        this.status,
    });

    factory DataComment.fromJson(Map<String, dynamic> json) => DataComment(
        commentId: json["commentId"],
        postContent: json["postContent"],
        fullName: json["fullName"],
        commentContent: json["commentContent"],
        parentId: json["parentId"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "commentId": commentId,
        "postContent": postContent,
        "fullName": fullName,
        "commentContent": commentContent,
        "parentId": parentId,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
        "status": status,
    };
}
