// To parse this JSON data, do
//
//     final dataPlant = dataPlantFromJson(jsonString);

import 'dart:convert';

DataPlant dataPlantFromJson(String str) => DataPlant.fromJson(json.decode(str));

String dataPlantToJson(DataPlant data) => json.encode(data.toJson());

class DataPlant {
    int? plantId;
    String? plantName;
    String? description;
    DateTime? plantingDate;
    DateTime? harvestingDate;
    String? status;
    String? image;
    int? gardenId;
    String? gardenName;
    String? cropVarietyName;
    DateTime? createdDate;
    DateTime? updateDate;
    int? quantityPlanted;
    int? estimatedHarvestQuantity;
    String? md5Hash;

    DataPlant({
        this.plantId,
        this.plantName,
        this.description,
        this.plantingDate,
        this.harvestingDate,
        this.status,
        this.image,
        this.gardenId,
        this.gardenName,
        this.cropVarietyName,
        this.createdDate,
        this.updateDate,
        this.quantityPlanted,
        this.estimatedHarvestQuantity,
        this.md5Hash,
    });

    factory DataPlant.fromJson(Map<String, dynamic> json) => DataPlant(
        plantId: json["plantId"],
        plantName: json["plantName"],
        description: json["description"],
        plantingDate: json["plantingDate"] == null ? null : DateTime.parse(json["plantingDate"]),
        harvestingDate: json["harvestingDate"] == null ? null : DateTime.parse(json["harvestingDate"]),
        status: json["status"],
        image: json["image"],
        gardenId: json["gardenId"],
        gardenName: json["gardenName"],
        cropVarietyName: json["cropVarietyName"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
        quantityPlanted: json["quantityPlanted"],
        estimatedHarvestQuantity: json["estimatedHarvestQuantity"],
        md5Hash: json["md5Hash"],
    );

    Map<String, dynamic> toJson() => {
        "plantId": plantId,
        "plantName": plantName,
        "description": description,
        "plantingDate": plantingDate?.toIso8601String(),
        "harvestingDate": harvestingDate?.toIso8601String(),
        "status": status,
        "image": image,
        "gardenId": gardenId,
        "gardenName": gardenName,
        "cropVarietyName": cropVarietyName,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
        "quantityPlanted": quantityPlanted,
        "estimatedHarvestQuantity": estimatedHarvestQuantity,
        "md5Hash": md5Hash,
    };
}
