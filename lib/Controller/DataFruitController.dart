// To parse this JSON data, do
//
//     final dataFruit = dataFruitFromJson(jsonString);

import 'dart:convert';

DataFruit dataFruitFromJson(String str) => DataFruit.fromJson(json.decode(str));

String dataFruitToJson(DataFruit data) => json.encode(data.toJson());

class DataFruit {
    int? fruitId;
    String? fruitName;
    String? fruitDescription;
    double? price;
    int? quantityAvailable;
    int? quantityInTransit;
    String? originCity;
    String? orderType;
    String? categoryFruitName;
    String? fullName;
    String? plantName;
    String? status;
    DateTime? createdDate;
    DateTime? updateDate;
    List<FruitImage>? fruitImages;

    DataFruit({
        this.fruitId,
        this.fruitName,
        this.fruitDescription,
        this.price,
        this.quantityAvailable,
        this.quantityInTransit,
        this.originCity,
        this.orderType,
        this.categoryFruitName,
        this.fullName,
        this.plantName,
        this.status,
        this.createdDate,
        this.updateDate,
        this.fruitImages,
    });

    factory DataFruit.fromJson(Map<String, dynamic> json) => DataFruit(
        fruitId: json["fruitId"],
        fruitName: json["fruitName"],
        fruitDescription: json["fruitDescription"],
        price: json["price"]?.toDouble(),
        quantityAvailable: json["quantityAvailable"],
        quantityInTransit: json["quantityInTransit"],
        originCity: json["originCity"],
        orderType: json["orderType"],
        categoryFruitName: json["categoryFruitName"],
        fullName: json["fullName"],
        plantName: json["plantName"],
        status: json["status"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
        fruitImages: json["fruitImages"] == null ? [] : List<FruitImage>.from(json["fruitImages"]!.map((x) => FruitImage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "fruitId": fruitId,
        "fruitName": fruitName,
        "fruitDescription": fruitDescription,
        "price": price,
        "quantityAvailable": quantityAvailable,
        "quantityInTransit": quantityInTransit,
        "originCity": originCity,
        "orderType": orderType,
        "categoryFruitName": categoryFruitName,
        "fullName": fullName,
        "plantName": plantName,
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
        "fruitImages": fruitImages == null ? [] : List<dynamic>.from(fruitImages!.map((x) => x.toJson())),
    };
}

class FruitImage {
    int? fruitImageId;
    String? fruitName;
    String? imageUrl;
    DateTime? createdDate;
    DateTime? updateDate;
    String? status;

    FruitImage({
        this.fruitImageId,
        this.fruitName,
        this.imageUrl,
        this.createdDate,
        this.updateDate,
        this.status,
    });

    factory FruitImage.fromJson(Map<String, dynamic> json) => FruitImage(
        fruitImageId: json["fruitImageId"],
        fruitName: json["fruitName"],
        imageUrl: json["imageUrl"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "fruitImageId": fruitImageId,
        "fruitName": fruitName,
        "imageUrl": imageUrl,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
        "status": status,
    };
}
