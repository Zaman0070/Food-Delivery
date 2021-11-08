import 'dart:convert';

ProductChatModel productChatModelFromJson(String str) => ProductChatModel.fromJson(json.decode(str));

String productChatModelToJson(ProductChatModel data) => json.encode(data.toJson());

class ProductChatModel {
  ProductChatModel({
    this.data,
  });

  Data? data;

  factory ProductChatModel.fromJson(Map<String, dynamic> json) => ProductChatModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
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
    this.replies,
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
  List<Reply>? replies;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
        replies: List<Reply>.from(json["replies"].map((x) => Reply.fromJson(x))),
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
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
      };
}

class Customer {
  Customer({
    this.id,
    this.name,
    this.email,
    this.active,
    this.avatar,
    this.memberSince,
  });

  int? id;
  String? name;
  String? email;
  bool? active;
  String? avatar;
  String? memberSince;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        active: json["active"],
        avatar: json["avatar"],
        memberSince: json["member_since"] == null ? null : json["member_since"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "active": active,
        "avatar": avatar,
        "member_since": memberSince == null ? null : memberSince,
      };
}

class Reply {
  Reply({
    this.id,
    this.reply,
    this.user,
    this.read,
    this.updatedAt,
    this.attachments,
    this.customer,
  });

  int? id;
  String? reply;
  Customer? user;
  dynamic read;
  String? updatedAt;
  List<dynamic>? attachments;
  Customer? customer;

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        id: json["id"],
        reply: json["reply"],
        user: json["user"] == null ? null : Customer.fromJson(json["user"]),
        read: json["read"],
        updatedAt: json["updated_at"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reply": reply,
        "user": user == null ? null : user!.toJson(),
        "read": read,
        "updated_at": updatedAt,
        "attachments": List<dynamic>.from(attachments!.map((x) => x)),
        "customer": customer == null ? null : customer!.toJson(),
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

/*Initial*/
class ProductChatInitialModel {
  ProductChatInitialModel({
    this.message,
  });

  String? message;

  factory ProductChatInitialModel.fromJson(Map<String, dynamic> json) => ProductChatInitialModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
