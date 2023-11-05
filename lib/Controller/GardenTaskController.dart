// To parse this JSON data, do
//
//     final dataGardenTask = dataGardenTaskFromJson(jsonString);

import 'dart:convert';

DataGardenTask dataGardenTaskFromJson(String str) => DataGardenTask.fromJson(json.decode(str));

String dataGardenTaskToJson(DataGardenTask data) => json.encode(data.toJson());

class DataGardenTask {
    int? gardenTaskId;
    String? gardenTaskName;
    String? description;
    DateTime? gardenTaskDate;
    String? status;
    String? gardenName;
    String? plantName;
    String? image;
    DateTime? createdDate;

    DataGardenTask({
        this.gardenTaskId,
        this.gardenTaskName,
        this.description,
        this.gardenTaskDate,
        this.status,
        this.gardenName,
        this.plantName,
        this.image,
        this.createdDate,
    });

    factory DataGardenTask.fromJson(Map<String, dynamic> json) => DataGardenTask(
        gardenTaskId: json["gardenTaskId"],
        gardenTaskName: json["gardenTaskName"],
        description: json["description"],
        gardenTaskDate: json["gardenTaskDate"] == null ? null : DateTime.parse(json["gardenTaskDate"]),
        status: json["status"],
        gardenName: json["gardenName"],
        plantName: json["plantName"],
        image: json["image"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    );

    Map<String, dynamic> toJson() => {
        "gardenTaskId": gardenTaskId,
        "gardenTaskName": gardenTaskName,
        "description": description,
        "gardenTaskDate": gardenTaskDate?.toIso8601String(),
        "status": status,
        "gardenName": gardenName,
        "plantName": plantName,
        "image": image,
        "createdDate": createdDate?.toIso8601String(),
    };
}
