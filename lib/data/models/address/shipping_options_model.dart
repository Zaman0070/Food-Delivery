import 'dart:convert';
ShippingOptionsModel shippingOptionsModelFromJson(String str) => ShippingOptionsModel.fromJson(json.decode(str));

String shippingOptionsModelToJson(ShippingOptionsModel data) => json.encode(data.toJson());

class ShippingOptionsModel {
  ShippingOptionsModel({
    this.shippingOptions,
  });

  List<ShippingOption>? shippingOptions;

  factory ShippingOptionsModel.fromJson(Map<String, dynamic> json) =>
      ShippingOptionsModel(
        shippingOptions: List<ShippingOption>.from(json["shipping_options"].map((x) => ShippingOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "shipping_options": List<dynamic>.from(shippingOptions!.map((x) => x.toJson())),
      };
}

class ShippingOption {
  ShippingOption({
    this.id,
    this.name,
    this.shippingZoneId,
    this.carrierId,
    this.carrierName,
    this.cost,
    this.costRaw,
    this.deliveryTakes,
  });

  int? id;
  String? name;
  int? shippingZoneId;
  int? carrierId;
  String? carrierName;
  String? cost;
  dynamic costRaw;
  String? deliveryTakes;

  factory ShippingOption.fromJson(Map<String, dynamic> json) =>
      ShippingOption(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
        shippingZoneId: json["shipping_zone_id"],
        carrierId: json["carrier_id"] == null ? null : json["carrier_id"],
        carrierName: json["carrier_name"] == null ? null : json["carrier_name"],
        cost: json["cost"],
        costRaw: json["cost_raw"],
        deliveryTakes: json["delivery_takes"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id == null ? null : id,
        "name": name,
        "shipping_zone_id": shippingZoneId,
        "carrier_id": carrierId == null ? null : carrierId,
        "carrier_name": carrierName == null ? null : carrierName,
        "cost": cost,
        "cost_raw": costRaw,
        "delivery_takes": deliveryTakes,
      };
}
