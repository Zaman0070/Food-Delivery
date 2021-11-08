import 'dart:convert';

OrderChatModel orderChatModelFromJson(String str) =>
    OrderChatModel.fromJson(json.decode(str));

String orderChatModelToJson(OrderChatModel data) => json.encode(data.toJson());

class OrderChatModel {
  OrderChatModel({
    this.data,
  });

  Data? data;

  factory OrderChatModel.fromJson(Map<String, dynamic> json) => OrderChatModel(
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
    this.orderId,
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
  String? subject;
  String? message;
  int? orderId;
  dynamic item;
  int? status;
  int? label;
  List<dynamic>? attachments;
  List<Reply>? replies;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        shopId: json["shop_id"],
        customer: Customer.fromJson(json["customer"]),
        shop: Shop.fromJson(json["shop"]),
        subject: json["subject"],
        message: json["message"],
        orderId: json["order_id"],
        item: json["item"],
        status: json["status"],
        label: json["label"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        replies:
            List<Reply>.from(json["replies"].map((x) => Reply.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shop_id": shopId,
        "customer": customer!.toJson(),
        "shop": shop!.toJson(),
        "subject": subject,
        "message": message,
        "order_id": orderId,
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
    this.customer,
    this.read,
    this.updatedAt,
    this.attachments,
    this.user,
  });

  int? id;
  String? reply;
  Customer? customer;
  dynamic read;
  String? updatedAt;
  List<dynamic>? attachments;
  Customer? user;

  factory Reply.fromJson(Map<String, dynamic> json) => Reply(
        id: json["id"],
        reply: json["reply"],
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        read: json["read"],
        updatedAt: json["updated_at"],
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        user: json["user"] == null ? null : Customer.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reply": reply,
        "customer": customer == null ? null : customer!.toJson(),
        "read": read,
        "updated_at": updatedAt,
        "attachments": List<dynamic>.from(attachments!.map((x) => x)),
        "user": user == null ? null : user!.toJson(),
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
class OrderChatInitialModel {
  OrderChatInitialModel({
    this.message,
  });

  String? message;

  factory OrderChatInitialModel.fromJson(Map<String, dynamic> json) =>
      OrderChatInitialModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
