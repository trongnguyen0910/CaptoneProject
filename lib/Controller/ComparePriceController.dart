// To parse this JSON data, do
//
//     final dataCompare = dataCompareFromJson(jsonString);

import 'dart:convert';

DataCompare dataCompareFromJson(String str) => DataCompare.fromJson(json.decode(str));

String dataCompareToJson(DataCompare data) => json.encode(data.toJson());

class DataCompare {
    int? historyId;
    String? fruitName;
    double? price;
    String? fullName;
    String? location;
    String? status;
    DateTime? createdDate;

    DataCompare({
        this.historyId,
        this.fruitName,
        this.price,
        this.fullName,
        this.location,
        this.status,
        this.createdDate,
    });

    factory DataCompare.fromJson(Map<String, dynamic> json) => DataCompare(
        historyId: json["historyId"],
        fruitName: json["fruitName"],
        price: json["price"],
        fullName: json["fullName"],
        location: json["location"],
        status: json["status"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    );

    Map<String, dynamic> toJson() => {
        "historyId": historyId,
        "fruitName": fruitName,
        "price": price,
        "fullName": fullName,
        "location": location,
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
    };
}
