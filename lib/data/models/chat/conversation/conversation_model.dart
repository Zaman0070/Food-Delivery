// To parse this JSON data, do
//
//     final conversationModel = conversationModelFromJson(jsonString);

import 'dart:convert';

ConversationModel conversationModelFromJson(String str) => ConversationModel.fromJson(json.decode(str));

String conversationModelToJson(ConversationModel data) => json.encode(data.toJson());

class ConversationModel {
  ConversationModel({
    this.data,
  });

  List<Datum>? data;

  factory ConversationModel.fromJson(Map<String, dynamic> json) => ConversationModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.shopId,
    this.customer,
    this.shop,
    this.subject,
    this.message,
    this.item,
    this.status,
    this.label,
    this.attachments,
  });

  int? id;
  int? shopId;
  Customer? customer;
  Shop? shop;
  dynamic subject;
  String? message;
  dynamic item;
  int? status;
  dynamic label;
  List<dynamic>? attachments;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    shopId: json["shop_id"],
    customer: Customer.fromJson(json["customer"]),
    shop: Shop.fromJson(json["shop"]),
    subject: json["subject"],
    message: json["message"],
    item: json["item"],
    status: json["status"],
    label: json["label"],
    attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_id": shopId,
    "customer": customer!.toJson(),
    "shop": shop!.toJson(),
    "subject": subject,
    "message": message,
    "item": item,
    "status": status,
    "label": label,
    "attachments": List<dynamic>.from(attachments!.map((x) => x)),
  };
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.email,
    this.active,
    this.avatar,
  });

  int? id;
  String? name;
  String? email;
  bool? active;
  String? avatar;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    active: json["active"],
    avatar: json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "active": active,
    "avatar": avatar,
  };
}

class Shop {
  Shop({
    this.id,
    this.name,
    this.slug,
    this.verified,
    this.verifiedText,
    this.image,
  });

  int? id;
  String? name;
  String? slug;
  bool? verified;
  String? verifiedText;
  String? image;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    verified: json["verified"],
    verifiedText: json["verified_text"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "verified": verified,
    "verified_text": verifiedText,
    "image": image,
  };
}
