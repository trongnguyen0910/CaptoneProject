// To parse this JSON data, do
//
//     final dataDiscount = dataDiscountFromJson(jsonString);

import 'dart:convert';

DataDiscount dataDiscountFromJson(String str) => DataDiscount.fromJson(json.decode(str));

String dataDiscountToJson(DataDiscount data) => json.encode(data.toJson());

class DataDiscount {
    int? fruitDiscountId;
    String? fruitName;
    int? fruitId;
    String? discountName;
    int? discountThreshold;
    double? discountPercentage;
    DateTime? discountExpiryDate;
    double? depositAmount;
    String? status;
    DateTime? createdDate;
    DateTime? updateDate;

    DataDiscount({
        this.fruitDiscountId,
        this.fruitName,
        this.fruitId,
        this.discountName,
        this.discountThreshold,
        this.discountPercentage,
        this.discountExpiryDate,
        this.depositAmount,
        this.status,
        this.createdDate,
        this.updateDate,
    });

    factory DataDiscount.fromJson(Map<String, dynamic> json) => DataDiscount(
        fruitDiscountId: json["fruitDiscountId"],
        fruitName: json["fruitName"],
        fruitId: json["fruitId"],
        discountName: json["discountName"],
        discountThreshold: json["discountThreshold"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountExpiryDate: json["discountExpiryDate"] == null ? null : DateTime.parse(json["discountExpiryDate"]),
        depositAmount: json["depositAmount"]?.toDouble(),
        status: json["status"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
    );

    Map<String, dynamic> toJson() => {
        "fruitDiscountId": fruitDiscountId,
        "fruitName": fruitName,
        "fruitId": fruitId,
        "discountName": discountName,
        "discountThreshold": discountThreshold,
        "discountPercentage": discountPercentage,
        "discountExpiryDate": discountExpiryDate?.toIso8601String(),
        "depositAmount": depositAmount,
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
    };
}
