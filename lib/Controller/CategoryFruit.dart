// To parse this JSON data, do
//
//     final categoryFruit = categoryFruitFromJson(jsonString);

import 'dart:convert';

CategoryFruit categoryFruitFromJson(String str) => CategoryFruit.fromJson(json.decode(str));

String categoryFruitToJson(CategoryFruit data) => json.encode(data.toJson());

class CategoryFruit {
    int? categoryFruitId;
    String? categoryFruitName;
    DateTime? createdDate;
    DateTime? updateDate;
    String? status;

    CategoryFruit({
        this.categoryFruitId,
        this.categoryFruitName,
        this.createdDate,
        this.updateDate,
        this.status,
    });

    factory CategoryFruit.fromJson(Map<String, dynamic> json) => CategoryFruit(
        categoryFruitId: json["categoryFruitId"],
        categoryFruitName: json["categoryFruitName"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "categoryFruitId": categoryFruitId,
        "categoryFruitName": categoryFruitName,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
        "status": status,
    };
}
