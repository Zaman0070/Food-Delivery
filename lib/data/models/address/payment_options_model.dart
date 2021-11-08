
class PaymentOptionsModel {
  PaymentOptionsModel({
    this.data,
  });

  List<PaymentOptions>? data;

  factory PaymentOptionsModel.fromJson(Map<String, dynamic> json) => PaymentOptionsModel(
    data: List<PaymentOptions>.from(json["data"].map((x) => PaymentOptions.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PaymentOptions {
  PaymentOptions({
    this.id,
    this.order,
    this.type,
    this.code,
    this.name,
  });

  int? id;
  int? order;
  String? type;
  String? code;
  String? name;

  factory PaymentOptions.fromJson(Map<String, dynamic> json) => PaymentOptions(
    id: json["id"],
    order: json["order"],
    type: json["type"],
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order": order,
    "type": type,
    "code": code,
    "name": name,
  };
}
