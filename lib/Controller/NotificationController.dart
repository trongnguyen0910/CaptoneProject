// To parse this JSON data, do
//
//     final dataNotification = dataNotificationFromJson(jsonString);

import 'dart:convert';

DataNotification dataNotificationFromJson(String str) => DataNotification.fromJson(json.decode(str));

String dataNotificationToJson(DataNotification data) => json.encode(data.toJson());

class DataNotification {
    int? notificationId;
    String? message;
    bool? isRead;
    String? fullName;
    String? status;
    DateTime? createdDate;
    dynamic updateDate;
    String? notificationType;

    DataNotification({
        this.notificationId,
        this.message,
        this.isRead,
        this.fullName,
        this.status,
        this.createdDate,
        this.updateDate,
        this.notificationType,
    });

    factory DataNotification.fromJson(Map<String, dynamic> json) => DataNotification(
        notificationId: json["notificationId"],
        message: json["message"],
        isRead: json["isRead"],
        fullName: json["fullName"],
        status: json["status"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"],
        notificationType: json["notificationType"],
    );

    Map<String, dynamic> toJson() => {
        "notificationId": notificationId,
        "message": message,
        "isRead": isRead,
        "fullName": fullName,
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate,
        "notificationType": notificationType,
    };
}
