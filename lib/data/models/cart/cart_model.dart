import 'dart:convert';

CartModel cartItemFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartItemToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.data,
  });

  List<CartItem>? data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        data: List<CartItem>.from(json["data"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CartItem {
  CartItem({
    this.id,
    this.customerId,
    this.ipAddress,
    this.shipTo,
    this.shippingZoneId,
    this.shippingOptionId,
    this.shippingAddress,
    this.billingAddress,
    this.shippingWeight,
    this.packagingId,
    this.coupon,
    this.total,
    this.shipping,
    this.packaging,
    this.handling,
    this.taxrate,
    this.taxes,
    this.discount,
    this.grandTotal,
    this.label,
    this.shop,
    this.items,
  });

  int? id;
  dynamic customerId;
  String? ipAddress;
  dynamic shipTo;
  dynamic shippingZoneId;
  dynamic shippingOptionId;
  String? shippingAddress;
  String? billingAddress;
  String? shippingWeight;
  int? packagingId;
  dynamic coupon;
  String? total;
  String? shipping;
  String? packaging;
  String? handling;
  String? taxrate;
  String? taxes;
  String? discount;
  String? grandTotal;
  String? label;
  Shop? shop;
  List<Item>? items;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        customerId: json["customer_id"],
        ipAddress: json["ip_address"],
        shipTo: json["ship_to"],
        shippingZoneId: json["shipping_zone_id"],
        shippingOptionId: json["shipping_option_id"],
        shippingAddress: json["shipping_address"],
        billingAddress: json["billing_address"],
        shippingWeight: json["shipping_weight"],
        packagingId: json["packaging_id"],
        coupon: json["coupon"],
        total: json["total"],
        shipping: json["shipping"],
        packaging: json["packaging"],
        handling: json["handling"],
        taxrate: json["taxrate"],
        taxes: json["taxes"],
        discount: json["discount"],
        grandTotal: json["grand_total"],
        label: json["label"],
        shop: Shop.fromJson(json["shop"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "ip_address": ipAddress,
        "ship_to": shipTo,
        "shipping_zone_id": shippingZoneId,
        "shipping_option_id": shippingOptionId,
        "shipping_address": shippingAddress,
        "billing_address": billingAddress,
        "shipping_weight": shippingWeight,
        "packaging_id": packagingId,
        "coupon": coupon,
        "total": total,
        "shipping": shipping,
        "packaging": packaging,
        "handling": handling,
        "taxrate": taxrate,
        "taxes": taxes,
        "discount": discount,
        "grand_total": grandTotal,
        "label": label,
        "shop": shop!.toJson(),
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

  int? id;
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
