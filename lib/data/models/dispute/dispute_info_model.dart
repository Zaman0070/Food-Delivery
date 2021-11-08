// To parse this JSON data, do
//
//     final disputeInfoModel = disputeInfoModelFromJson(jsonString);

import 'dart:convert';

DisputeInfoModel disputeInfoModelFromJson(String str) => DisputeInfoModel.fromJson(json.decode(str));

String disputeInfoModelToJson(DisputeInfoModel data) => json.encode(data.toJson());

class DisputeInfoModel {
  DisputeInfoModel({
    this.data,
  });

  DisputeInfo? data;

  factory DisputeInfoModel.fromJson(Map<String, dynamic> json) => DisputeInfoModel(
        data: DisputeInfo.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class DisputeInfo {
  DisputeInfo({
    this.id,
    this.orderNumber,
    this.orderStatus,
    this.total,
    this.grandTotal,
    this.totalRaw,
    this.grandTotalRaw,
    this.goodsReceived,
    this.items,
    this.disputeType,
  });

  int? id;
  String? orderNumber;
  String? orderStatus;
  String? total;
  String? grandTotal;
  String? totalRaw;
  String? grandTotalRaw;
  dynamic goodsReceived;
  Map<String, String>? items;
  Map<String, String>? disputeType;

  factory DisputeInfo.fromJson(Map<String, dynamic> json) => DisputeInfo(
        id: json["id"],
        orderNumber: json["order_number"],
        orderStatus: json["order_status"],
        total: json["total"],
        grandTotal: json["grand_total"],
        totalRaw: json["total_raw"],
        grandTotalRaw: json["grand_total_raw"],
        goodsReceived: json["goods_received"],
        items: Map.from(json["items"]).map((k, v) => MapEntry<String, String>(k, v)),
        disputeType: Map.from(json["dispute_type"]).map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "order_status": orderStatus,
        "total": total,
        "grand_total": grandTotal,
        "total_raw": totalRaw,
        "grand_total_raw": grandTotalRaw,
        "goods_received": goodsReceived,
        "items": Map.from(items!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "dispute_type": Map.from(disputeType!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
