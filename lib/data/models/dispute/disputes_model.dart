// To parse this JSON data, do
//
//     final disputesModel = disputesModelFromJson(jsonString);

import 'dart:convert';

DisputesModel disputesModelFromJson(String str) => DisputesModel.fromJson(json.decode(str));

String disputesModelToJson(DisputesModel data) => json.encode(data.toJson());

class DisputesModel {
  DisputesModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Disputes>? data;
  Links? links;
  Meta? meta;

  factory DisputesModel.fromJson(Map<String, dynamic> json) => DisputesModel(
    data: List<Disputes>.from(json["data"].map((x) => Disputes.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links!.toJson(),
    "meta": meta!.toJson(),
  };
}

class Disputes {
  Disputes({
    this.id,
    this.reason,
    this.closed,
    this.goodsReceived,
    this.returnGoods,
    this.status,
    this.updatedAt,
    this.shop,
    this.orderDetails,
  });

  int? id;
  String? reason;
  bool? closed;
  bool? goodsReceived;
  bool? returnGoods;
  String? status;
  String? updatedAt;
  Shop? shop;
  OrderDetails? orderDetails;

  factory Disputes.fromJson(Map<String, dynamic> json) => Disputes(
    id: json["id"],
    reason: json["reason"],
    closed: json["closed"],
    goodsReceived: json["goods_received"],
    returnGoods: json["return_goods"],
    status: json["status"],
    updatedAt: json["updated_at"],
    shop: Shop.fromJson(json["shop"]),
    orderDetails: OrderDetails.fromJson(json["order_details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reason": reason,
    "closed": closed,
    "goods_received": goodsReceived,
    "return_goods": returnGoods,
    "status": status,
    "updated_at": updatedAt,
    "shop": shop!.toJson(),
    "order_details": orderDetails!.toJson(),
  };
}

class OrderDetails {
  OrderDetails({
    this.id,
    this.orderNumber,
    this.orderStatus,
    this.paymentStatus,
    this.grandTotal,
    this.grandTotalRaw,
    this.orderDate,
    this.items,
  });

  int? id;
  String? orderNumber;
  String? orderStatus;
  String? paymentStatus;
  String? grandTotal;
  String? grandTotalRaw;
  String? orderDate;
  List<Item>? items;

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    id: json["id"],
    orderNumber: json["order_number"],
    orderStatus: json["order_status"],
    paymentStatus: json["payment_status"],
    grandTotal: json["grand_total"],
    grandTotalRaw: json["grand_total_raw"],
    orderDate: json["order_date"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_number": orderNumber,
    "order_status": orderStatus,
    "payment_status": paymentStatus,
    "grand_total": grandTotal,
    "grand_total_raw": grandTotalRaw,
    "order_date": orderDate,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.slug,
    this.description,
    this.quantity,
    this.unitPrice,
    this.total,
    this.image,
  });

  dynamic id;
  String? slug;
  String? description;
  int? quantity;
  String? unitPrice;
  String? total;
  String? image;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    slug: json["slug"],
    description: json["description"],
    quantity: json["quantity"],
    unitPrice: json["unit_price"],
    total: json["total"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "description": description,
    "quantity": quantity,
    "unit_price": unitPrice,
    "total": total,
    "image": image,
  };
}

class Shop {
  Shop({
    this.id,
    this.name,
    this.slug,
    this.verified,
    this.verifiedText,
    this.rating,
    this.image,
  });

  int? id;
  String? name;
  String? slug;
  bool? verified;
  String? verifiedText;
  String? rating;
  String? image;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    verified: json["verified"],
    verifiedText: json["verified_text"],
    rating: json["rating"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "verified": verified,
    "verified_text": verifiedText,
    "rating": rating,
    "image": image,
  };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}
