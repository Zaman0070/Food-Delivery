import 'dart:convert';

OrderModel orderDetailsModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.data,
  });

  Order? data;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        data: Order.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Order {
  Order({
    this.id,
    this.orderNumber,
    this.customerId,
    this.ipAddress,
    this.email,
    this.disputeId,
    this.orderStatus,
    this.paymentStatus,
    this.paymentMethod,
    this.messageToCustomer,
    this.buyerNote,
    this.shipTo,
    this.shippingZoneId,
    this.shippingRateId,
    this.shippingAddress,
    this.billingAddress,
    this.shippingWeight,
    this.packagingId,
    this.couponId,
    this.total,
    this.shipping,
    this.packaging,
    this.handling,
    this.taxes,
    this.discount,
    this.grandTotal,
    this.taxrate,
    this.orderDate,
    this.shippingDate,
    this.deliveryDate,
    this.goodsReceived,
    this.canEvaluate,
    this.trackingId,
    this.trackingUrl,
    this.shop,
    this.items,
    this.conversation,
  });

  int? id;
  String? orderNumber;
  int? customerId;
  dynamic ipAddress;
  dynamic email;
  dynamic disputeId;
  String? orderStatus;
  String? paymentStatus;
  PaymentMethod? paymentMethod;
  dynamic messageToCustomer;
  String? buyerNote;
  int? shipTo;
  int? shippingZoneId;
  dynamic shippingRateId;
  String? shippingAddress;
  String? billingAddress;
  String? shippingWeight;
  int? packagingId;
  dynamic couponId;
  String? total;
  String? shipping;
  String? packaging;
  String? handling;
  String? taxes;
  dynamic discount;
  String? grandTotal;
  String? taxrate;
  String? orderDate;
  dynamic shippingDate;
  dynamic deliveryDate;
  dynamic goodsReceived;
  bool? canEvaluate;
  dynamic trackingId;
  dynamic trackingUrl;
  Shop? shop;
  List<Item>? items;
  dynamic conversation;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderNumber: json["order_number"],
        customerId: json["customer_id"],
        ipAddress: json["ip_address"],
        email: json["email"],
        disputeId: json["dispute_id"],
        orderStatus: json["order_status"],
        paymentStatus: json["payment_status"],
        paymentMethod: PaymentMethod.fromJson(json["payment_method"]),
        messageToCustomer: json["message_to_customer"],
        buyerNote: json["buyer_note"],
        shipTo: json["ship_to"],
        shippingZoneId: json["shipping_zone_id"],
        shippingRateId: json["shipping_rate_id"],
        shippingAddress: json["shipping_address"],
        billingAddress: json["billing_address"],
        shippingWeight: json["shipping_weight"],
        packagingId: json["packaging_id"],
        couponId: json["coupon_id"],
        total: json["total"],
        shipping: json["shipping"],
        packaging: json["packaging"],
        handling: json["handling"],
        taxes: json["taxes"],
        discount: json["discount"],
        grandTotal: json["grand_total"],
        taxrate: json["taxrate"],
        orderDate: json["order_date"],
        shippingDate: json["shipping_date"],
        deliveryDate: json["delivery_date"],
        goodsReceived: json["goods_received"],
        canEvaluate: json["can_evaluate"],
        trackingId: json["tracking_id"],
        trackingUrl: json["tracking_url"],
        shop: Shop.fromJson(json["shop"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        conversation: json["conversation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "customer_id": customerId,
        "ip_address": ipAddress,
        "email": email,
        "dispute_id": disputeId,
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "payment_method": paymentMethod!.toJson(),
        "message_to_customer": messageToCustomer,
        "buyer_note": buyerNote,
        "ship_to": shipTo,
        "shipping_zone_id": shippingZoneId,
        "shipping_rate_id": shippingRateId,
        "shipping_address": shippingAddress,
        "billing_address": billingAddress,
        "shipping_weight": shippingWeight,
        "packaging_id": packagingId,
        "coupon_id": couponId,
        "total": total,
        "shipping": shipping,
        "packaging": packaging,
        "handling": handling,
        "taxes": taxes,
        "discount": discount,
        "grand_total": grandTotal,
        "taxrate": taxrate,
        "order_date": orderDate,
        "shipping_date": shippingDate,
        "delivery_date": deliveryDate,
        "goods_received": goodsReceived,
        "can_evaluate": canEvaluate,
        "tracking_id": trackingId,
        "tracking_url": trackingUrl,
        "shop": shop!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "conversation": conversation,
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
    this.feedback,
  });

  int? id;
  String? slug;
  String? description;
  int? quantity;
  String? unitPrice;
  String? total;
  String? image;
  dynamic feedback;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        slug: json["slug"],
        description: json["description"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        total: json["total"],
        image: json["image"],
        feedback: json["feedback"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "description": description,
        "quantity": quantity,
        "unit_price": unitPrice,
        "total": total,
        "image": image,
        "feedback": feedback,
      };
}

class PaymentMethod {
  PaymentMethod({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
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
    this.feedback,
  });

  int? id;
  String? name;
  String? slug;
  bool? verified;
  String? verifiedText;
  dynamic rating;
  String? image;
  dynamic feedback;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        verified: json["verified"],
        verifiedText: json["verified_text"],
        rating: json["rating"],
        image: json["image"],
        feedback: json["feedback"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "verified": verified,
        "verified_text": verifiedText,
        "rating": rating,
        "image": image,
        "feedback": feedback,
      };
}
