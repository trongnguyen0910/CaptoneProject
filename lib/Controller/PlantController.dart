 // To parse this JSON data, do
//
//     final dataPlant = dataPlantFromJson(jsonString);

import 'dart:convert';

DataPlant dataPlantFromJson(String str) => DataPlant.fromJson(json.decode(str));

String dataPlantToJson(DataPlant data) => json.encode(data.toJson());

class DataPlant {
    int? cropId;
    String? cropName;
    String? description;
    DateTime? plantingDate;
    DateTime? harvestingDate;
    String? status;
    String? image;
    int? gardenId;
    String? gardenName;
    String? varietyName;
    DateTime? createdDate;
    DateTime? updateDate;
    int? quantityPlanted;
    int? estimatedHarvestQuantity;
    String? md5Hash;

    DataPlant({
        this.cropId,
        this.cropName,
        this.description,
        this.plantingDate,
        this.harvestingDate,
        this.status,
        this.image,
        this.gardenId,
        this.gardenName,
        this.varietyName,
        this.createdDate,
        this.updateDate,
        this.quantityPlanted,
        this.estimatedHarvestQuantity,
        this.md5Hash,
    });

    factory DataPlant.fromJson(Map<String, dynamic> json) => DataPlant(
        cropId: json["cropId"],
        cropName: json["cropName"],
        description: json["description"],
        plantingDate: json["plantingDate"] == null ? null : DateTime.parse(json["plantingDate"]),
        harvestingDate: json["harvestingDate"] == null ? null : DateTime.parse(json["harvestingDate"]),
        status: json["status"],
        image: json["image"],
        gardenId: json["gardenId"],
        gardenName: json["gardenName"],
        varietyName: json["varietyName"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
        quantityPlanted: json["quantityPlanted"],
        estimatedHarvestQuantity: json["estimatedHarvestQuantity"],
        md5Hash: json["md5Hash"],
    );

    Map<String, dynamic> toJson() => {
        "cropId": cropId,
        "cropName": cropName,
        "description": description,
        "plantingDate": plantingDate?.toIso8601String(),
        "harvestingDate": harvestingDate?.toIso8601String(),
        "status": status,
        "image": image,
        "gardenId": gardenId,
        "gardenName": gardenName,
        "varietyName": varietyName,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
        "quantityPlanted": quantityPlanted,
        "estimatedHarvestQuantity": estimatedHarvestQuantity,
        "md5Hash": md5Hash,
    };
}
