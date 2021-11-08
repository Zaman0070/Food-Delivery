import 'dart:convert';

OrdersModel orderModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String orderModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    this.data,
    this.links,
    this.meta,
  });

  List<Orders>? data;
  Links? links;
  Meta? meta;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
        data: List<Orders>.from(json["data"].map((x) => Orders.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
      };
}

class Orders {
  Orders({
    this.id,
    this.orderNumber,
    this.customerId,
    this.disputeId,
    this.orderStatus,
    this.paymentStatus,
    this.messageToCustomer,
    this.grandTotal,
    this.grandTotalRaw,
    this.orderDate,
    this.shippingDate,
    this.deliveryDate,
    this.goodsReceived,
    this.canEvaluate,
    this.trackingId,
    this.trackingUrl,
    this.shop,
    this.items,
  });

  int? id;
  String? orderNumber;
  int? customerId;
  dynamic disputeId;
  String? orderStatus;
  String? paymentStatus;
  dynamic messageToCustomer;
  String? grandTotal;
  String? grandTotalRaw;
  String? orderDate;
  dynamic shippingDate;
  dynamic deliveryDate;
  dynamic goodsReceived;
  bool? canEvaluate;
  dynamic trackingId;
  dynamic trackingUrl;
  Shop? shop;
  List<Item>? items;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["id"],
        orderNumber: json["order_number"],
        customerId: json["customer_id"],
        disputeId: json["dispute_id"],
        orderStatus: json["order_status"],
        paymentStatus: json["payment_status"],
        messageToCustomer: json["message_to_customer"],
        grandTotal: json["grand_total"],
        grandTotalRaw: json["grand_total_raw"],
        orderDate: json["order_date"],
        shippingDate: json["shipping_date"],
        deliveryDate: json["delivery_date"],
        goodsReceived: json["goods_received"],
        canEvaluate: json["can_evaluate"],
        trackingId: json["tracking_id"],
        trackingUrl: json["tracking_url"],
        shop: Shop.fromJson(json["shop"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "customer_id": customerId,
        "dispute_id": disputeId,
        "order_status": orderStatus,
        "payment_status": paymentStatus,
        "message_to_customer": messageToCustomer,
        "grand_total": grandTotal,
        "grand_total_raw": grandTotalRaw,
        "order_date": orderDate,
        "shipping_date": shippingDate,
        "delivery_date": deliveryDate,
        "goods_received": goodsReceived,
        "can_evaluate": canEvaluate,
        "tracking_id": trackingId,
        "tracking_url": trackingUrl,
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
  dynamic rating;
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
  dynamic next;

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
