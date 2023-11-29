// To parse this JSON data, do
//
//     final dataVarietyGrowth = dataVarietyGrowthFromJson(jsonString);

import 'dart:convert';

DataVarietyGrowth dataVarietyGrowthFromJson(String str) => DataVarietyGrowth.fromJson(json.decode(str));

String dataVarietyGrowthToJson(DataVarietyGrowth data) => json.encode(data.toJson());

class DataVarietyGrowth {
    int? growthTaskId;
    String? stageName;
    String? taskName;
    String? description;
    DateTime? startDate;
    DateTime? endDate;
    String? status;
    DateTime? createdDate;
    DateTime? updateDate;

    DataVarietyGrowth({
        this.growthTaskId,
        this.stageName,
        this.taskName,
        this.description,
        this.startDate,
        this.endDate,
        this.status,
        this.createdDate,
        this.updateDate,
    });

    factory DataVarietyGrowth.fromJson(Map<String, dynamic> json) => DataVarietyGrowth(
        growthTaskId: json["growthTaskId"],
        stageName: json["stageName"],
        taskName: json["taskName"],
        description: json["description"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        status: json["status"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
    );

    Map<String, dynamic> toJson() => {
        "growthTaskId": growthTaskId,
        "stageName": stageName,
        "taskName": taskName,
        "description": description,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
    };
}
