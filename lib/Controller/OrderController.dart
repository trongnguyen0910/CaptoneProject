// To parse this JSON data, do
//
//     final dataOrder = dataOrderFromJson(jsonString);

import 'dart:convert';

DataOrder dataOrderFromJson(String str) => DataOrder.fromJson(json.decode(str));

String dataOrderToJson(DataOrder data) => json.encode(data.toJson());

class DataOrder {
  int? orderId;
  String? fullName;
  DateTime? orderDate;
  String? deliveryAddress;
  String? paymentMethod;
  double? totalAmount;
  String? phoneNumber;
  String? type;
  String? status;
  DateTime? createdDate;
  dynamic updateDate;
  List<OrderDetail>? orderDetails;

  DataOrder({
    this.orderId,
    this.fullName,
    this.orderDate,
    this.deliveryAddress,
    this.paymentMethod,
    this.totalAmount,
    this.phoneNumber,
    this.type,
    this.status,
    this.createdDate,
    this.updateDate,
    this.orderDetails,
  });

  factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
        orderId: json["orderId"],
        fullName: json["fullName"],
        orderDate: json["orderDate"] == null
            ? null
            : DateTime.parse(json["orderDate"]),
        deliveryAddress: json["deliveryAddress"],
        paymentMethod: json["paymentMethod"],
        totalAmount: json["totalAmount"]?.toDouble(),
        phoneNumber: json["phoneNumber"],
        type: json["type"],
        status: json["status"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"],
        orderDetails: json["orderDetails"] == null
            ? []
            : List<OrderDetail>.from(
                json["orderDetails"]!.map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "fullName": fullName,
        "orderDate": orderDate?.toIso8601String(),
        "deliveryAddress": deliveryAddress,
        "paymentMethod": paymentMethod,
        "totalAmount": totalAmount,
        "phoneNumber": phoneNumber,
        "type": type,
        "status": status,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate,
        "orderDetails": orderDetails == null
            ? []
            : List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
      };
}

class OrderDetail {
  int? fruitId;
  int? fruitDiscountId;
  double? quantity;
  double? unitPrice;
  double? totalAmount;
  DateTime? createdDate;
  DateTime? updateDate;
  String? fruitName;
  String? oderDetailType;
  String? discountName;
  String? status;

  OrderDetail({
    this.fruitId,
    this.fruitDiscountId,
    this.quantity,
    this.unitPrice,
    this.totalAmount,
    this.createdDate,
    this.updateDate,
    this.fruitName,
    this.oderDetailType,
    this.discountName,
    this.status,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        fruitId: json["fruitId"],
        fruitDiscountId: json["fruitDiscountId"],
        quantity: json["quantity"]?.toDouble(),
        unitPrice: json["unitPrice"]?.toDouble(),
        totalAmount: json["totalAmount"]?.toDouble(),
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updateDate: json["updateDate"] == null
            ? null
            : DateTime.parse(json["updateDate"]),
        fruitName: json["fruitName"],
        oderDetailType: json["oderDetailType"],
        discountName: json["discountName"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "fruitId": fruitId,
        "fruitDiscountId": fruitDiscountId,
        "quantity": quantity,
        "unitPrice": unitPrice,
        "totalAmount": totalAmount,
        "createdDate": createdDate?.toIso8601String(),
        "updateDate": updateDate?.toIso8601String(),
        "fruitName": fruitName,
        "oderDetailType": oderDetailType,
        "discountName": discountName,
        "status": status,
      };
}
