import 'dart:convert';

ProductVariantDetailsModel productVariantDetailsModelFromJson(String str) => ProductVariantDetailsModel.fromJson(json.decode(str));

String productVariantDetailsModelToJson(ProductVariantDetailsModel data) => json.encode(data.toJson());

class ProductVariantDetailsModel {
  ProductVariantDetailsModel({
    this.data,
  });

  ProductVariantDetails? data;

  factory ProductVariantDetailsModel.fromJson(Map<String, dynamic> json) => ProductVariantDetailsModel(
        data: ProductVariantDetails.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class ProductVariantDetails {
  ProductVariantDetails({
    this.id,
    this.slug,
    this.title,
    this.condition,
    this.keyFeatures,
    this.stockQuantity,
    this.hasOffer,
    this.rawPrice,
    this.currency,
    this.currencySymbol,
    this.price,
    this.offerPrice,
    this.discount,
    this.freeShipping,
    this.minOrderQuantity,
    this.rating,
    this.imageId,
    this.attributes,
  });

  int? id;
  String? slug;
  String? title;
  String? condition;
  List<String>? keyFeatures;
  int? stockQuantity;
  bool? hasOffer;
  String? rawPrice;
  String? currency;
  String? currencySymbol;
  String? price;
  String? offerPrice;
  String? discount;
  bool? freeShipping;
  int? minOrderQuantity;
  dynamic rating;
  int? imageId;
  List<Attribute>? attributes;

  factory ProductVariantDetails.fromJson(Map<String, dynamic> json) => ProductVariantDetails(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        condition: json["condition"],
        keyFeatures: List<String>.from(json["key_features"].map((x) => x)),
        stockQuantity: json["stock_quantity"],
        hasOffer: json["has_offer"],
        rawPrice: json["raw_price"],
        currency: json["currency"],
        currencySymbol: json["currency_symbol"],
        price: json["price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
        freeShipping: json["free_shipping"],
        minOrderQuantity: json["min_order_quantity"],
        rating: json["rating"],
        imageId: json["image_id"],
        attributes: List<Attribute>.from(json["attributes"].map((x) => Attribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "condition": condition,
        "key_features": List<dynamic>.from(keyFeatures!.map((x) => x)),
        "stock_quantity": stockQuantity,
        "has_offer": hasOffer,
        "raw_price": rawPrice,
        "currency": currency,
        "currency_symbol": currencySymbol,
        "price": price,
        "offer_price": offerPrice,
        "discount": discount,
        "free_shipping": freeShipping,
        "min_order_quantity": minOrderQuantity,
        "rating": rating,
        "image_id": imageId,
        "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
      };
}

class Attribute {
  Attribute({
    this.id,
    this.value,
  });

  int? id;
  int? value;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
