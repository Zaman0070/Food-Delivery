
class ShippingModel {
  ShippingModel({
    this.data,
  });

  List<ShippingOptions>? data;

  factory ShippingModel.fromJson(Map<String, dynamic> json) => ShippingModel(
    data: List<ShippingOptions>.from(json["data"].map((x) => ShippingOptions.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ShippingOptions {
  ShippingOptions({
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
  String? costRaw;
  String? deliveryTakes;

  factory ShippingOptions.fromJson(Map<String, dynamic> json) => ShippingOptions(
    id: json["id"],
    name: json["name"],
    shippingZoneId: json["shipping_zone_id"],
    carrierId: json["carrier_id"],
    carrierName: json["carrier_name"],
    cost: json["cost"],
    costRaw: json["cost_raw"],
    deliveryTakes: json["delivery_takes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "shipping_zone_id": shippingZoneId,
    "carrier_id": carrierId,
    "carrier_name": carrierName,
    "cost": cost,
    "cost_raw": costRaw,
    "delivery_takes": deliveryTakes,
  };
}
