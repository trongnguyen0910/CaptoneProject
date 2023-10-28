// To parse this JSON data, do
//
//     final dataGarden = dataGardenFromJson(jsonString);

import 'dart:convert';

DataGarden dataGardenFromJson(String str) => DataGarden.fromJson(json.decode(str));

String dataGardenToJson(DataGarden data) => json.encode(data.toJson());

class DataGarden {
    int? gardenId;
    String? gardenName;
    String? description;
    String? image;
    String? fullName;
    String? region;
    String? status;
    DateTime? createdDate;

    DataGarden({
        this.gardenId,
        this.gardenName,
        this.description,
        this.image,
        this.fullName,
        this.region,
        this.status,
        this.createdDate,
    });

    factory DataGarden.fromJson(Map<String, dynamic> json) => DataGarden(
        gardenId: json["gardenId"],
        gardenName: json["gardenName"],
        description: json["description"],
        image: json["image"],
        fullName: json["fullName"],
        region: json["region"],
        status: json["status"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    );

    Map<String, dynamic> toJson() => {
        "gardenId": gardenId,
        "gardenName": gardenName,
        "description": description,
        "image": image,
        "fullName": fullName,
        "region": region,
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
    };
}
