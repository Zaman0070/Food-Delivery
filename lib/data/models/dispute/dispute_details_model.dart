class DisputeDetailsModel {
  DisputeDetailsModel({
    this.data,
  });

  DisputeDetails? data;

  factory DisputeDetailsModel.fromJson(Map<String, dynamic> json) =>
      DisputeDetailsModel(
        data: DisputeDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class DisputeDetails {
  DisputeDetails({
    this.id,
    this.reason,
    this.progress,
    this.closed,
    this.description,
    this.goodsReceived,
    this.returnGoods,
    this.status,
    this.refundAmount,
    this.refundAmountRaw,
    this.updatedAt,
    this.shop,
    this.orderDetails,
    this.attachments,
    this.replies,
  });

  int? id;
  String? reason;
  double? progress;
  bool? closed;
  String? description;
  bool? goodsReceived;
  bool? returnGoods;
  String? status;
  String? refundAmount;
  String? refundAmountRaw;
  String? updatedAt;
  Shop? shop;
  OrderDetails? orderDetails;
  List<dynamic>? attachments;
  List<dynamic>? replies;

  factory DisputeDetails.fromJson(Map<String, dynamic> json) => DisputeDetails(
        id: json["id"],
        reason: json["reason"],
        progress: double.parse(json["progress"].toString()),
        closed: json["closed"],
        description: json["description"],
        goodsReceived: json["goods_received"],
        returnGoods: json["return_goods"],
        status: json["status"],
        refundAmount: json["refund_amount"],
        refundAmountRaw: json["refund_amount_raw"],
        updatedAt: json["updated_at"],
        shop: Shop.fromJson(json["shop"]),
        orderDetails: OrderDetails.fromJson(json["order_details"]),
        attachments: List<dynamic>.from(json["attachments"].map((x) => x)),
        replies: List<dynamic>.from(json["replies"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reason": reason,
        "progress": progress,
        "closed": closed,
        "description": description,
        "goods_received": goodsReceived,
        "return_goods": returnGoods,
        "status": status,
        "refund_amount": refundAmount,
        "refund_amount_raw": refundAmountRaw,
        "updated_at": updatedAt,
        "shop": shop!.toJson(),
        "order_details": orderDetails!.toJson(),
        "attachments": List<dynamic>.from(attachments!.map((x) => x)),
        "replies": List<dynamic>.from(replies!.map((x) => x)),
      };
}

class OrderDetails {
  OrderDetails({
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
  int? disputeId;
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

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
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
