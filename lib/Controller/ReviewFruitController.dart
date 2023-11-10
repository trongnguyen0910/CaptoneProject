// To parse this JSON data, do
//
//     final dataReviewFruit = dataReviewFruitFromJson(jsonString);

import 'dart:convert';

DataReviewFruit dataReviewFruitFromJson(String str) => DataReviewFruit.fromJson(json.decode(str));

String dataReviewFruitToJson(DataReviewFruit data) => json.encode(data.toJson());

class DataReviewFruit {
    int? reviewId;
    String? fullName;
    String? fruitName;
    double? rating;
    String? reviewComment;
    String? reviewImageUrl;
    int? parentId;
    String? status;
    DateTime? createdDate;
    DateTime? updateDate;

    DataReviewFruit({
        this.reviewId,
        this.fullName,
        this.fruitName,
        this.rating,
        this.reviewComment,
        this.reviewImageUrl,
        this.parentId,
        this.status,
        this.createdDate,
        this.updateDate,
    });

    factory DataReviewFruit.fromJson(Map<String, dynamic> json) => DataReviewFruit(
        reviewId: json["reviewId"],
        fullName: json["fullName"],
        fruitName: json["fruitName"],
        rating: json["rating"]?.toDouble(),
        reviewComment: json["reviewComment"],
        reviewImageUrl: json["reviewImageUrl"],
        parentId: json["parentId"],
        status: json["status"],
        createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
    );

    Map<String, dynamic> toJson() => {
        "reviewId": reviewId,
        "fullName": fullName,
        "fruitName": fruitName,
        "rating": rating,
        "reviewComment": reviewComment,
        "reviewImageUrl": reviewImageUrl,
        "parentId": parentId,
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
    };
}
