// To parse this JSON data, do
//
//     final dataVarietyStage = dataVarietyStageFromJson(jsonString);

import 'dart:convert';

DataVarietyStage dataVarietyStageFromJson(String str) => DataVarietyStage.fromJson(json.decode(str));

String dataVarietyStageToJson(DataVarietyStage data) => json.encode(data.toJson());

class DataVarietyStage {
    int? cropVarietyStageId;
    String? cropVarietyName;
    String? stageName;
    String? description;
    DateTime? startDate;
    DateTime? endDate;
    String? status;
    DateTime? createdDate;
    DateTime? updateDate;

    DataVarietyStage({
        this.cropVarietyStageId,
        this.cropVarietyName,
        this.stageName,
        this.description,
        this.startDate,
        this.endDate,
        this.status,
        this.createdDate,
        this.updateDate,
    });

    factory DataVarietyStage.fromJson(Map<String, dynamic> json) => DataVarietyStage(
        cropVarietyStageId: json["cropVarietyStageId"],
        cropVarietyName: json["cropVarietyName"],
        stageName: json["stageName"],
        description: json["description"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        status: json["status"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
    );

    Map<String, dynamic> toJson() => {
        "cropVarietyStageId": cropVarietyStageId,
        "cropVarietyName": cropVarietyName,
        "stageName": stageName,
        "description": description,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
    };
}
