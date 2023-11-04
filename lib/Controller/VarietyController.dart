// To parse this JSON data, do
//
//     final dataVariety = dataVarietyFromJson(jsonString);

import 'dart:convert';

DataVariety dataVarietyFromJson(String str) => DataVariety.fromJson(json.decode(str));

String dataVarietyToJson(DataVariety data) => json.encode(data.toJson());

class DataVariety {
    int? cropVarietyId;
    String? cropVarietyName;
    String? description;
    String? image;
    String? status;
    DateTime? createdDate;
    DateTime? updateDate;

    DataVariety({
        this.cropVarietyId,
        this.cropVarietyName,
        this.description,
        this.image,
        this.status,
        this.createdDate,
        this.updateDate,
    });

    factory DataVariety.fromJson(Map<String, dynamic> json) => DataVariety(
        cropVarietyId: json["cropVarietyId"],
        cropVarietyName: json["cropVarietyName"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
    );

    Map<String, dynamic> toJson() => {
        "cropVarietyId": cropVarietyId,
        "cropVarietyName": cropVarietyName,
        "description": description,
        "image": image,
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
    };
}
