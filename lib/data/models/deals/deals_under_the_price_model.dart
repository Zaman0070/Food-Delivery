// To parse this JSON data, do
//
//     final allBrands = allBrandsFromMap(jsonString);

import 'dart:convert';

DealsUnderThePrice dealsUnderThePriceFromMap(String str) =>
    DealsUnderThePrice.fromMap(json.decode(str));

String dealsUnderThePriceToMap(DealsUnderThePrice data) =>
    json.encode(data.toMap());

class DealsUnderThePrice {
  DealsUnderThePrice({
    this.data,
    this.meta,
  });

  List<Datum>? data;
  Meta? meta;

  factory DealsUnderThePrice.fromMap(Map<String, dynamic> json) =>
      DealsUnderThePrice(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta!.toMap(),
      };
}

class Datum {
  Datum({
    this.id,
    this.slug,
    this.productId,
    this.title,
    this.condition,
    this.hasOffer,
    this.rawPrice,
    this.currency,
    this.currencySymbol,
    this.price,
    this.offerPrice,
    this.discount,
    this.offerStart,
    this.offerEnd,
    this.rating,
    this.stuffPick,
    this.freeShipping,
    this.hotItem,
    this.labels,
    this.image,
  });

  int? id;
  String? slug;
  int? productId;
  String? title;
  String? condition;
  bool? hasOffer;
  String? rawPrice;
  String? currency;
  String? currencySymbol;
  String? price;
  dynamic offerPrice;
  dynamic discount;
  dynamic offerStart;
  dynamic offerEnd;
  dynamic rating;
  dynamic stuffPick;
  bool? freeShipping;
  bool? hotItem;
  List<dynamic>? labels;
  String? image;

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        slug: json["slug"],
        productId: json["product_id"],
        title: json["title"],
        condition: json["condition"],
        hasOffer: json["has_offer"],
        rawPrice: json["raw_price"],
        currency: json["currency"],
        currencySymbol: json["currency_symbol"],
        price: json["price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
        offerStart: json["offer_start"],
        offerEnd: json["offer_end"],
        rating: json["rating"],
        stuffPick: json["stuff_pick"],
        freeShipping: json["free_shipping"],
        hotItem: json["hot_item"],
        labels: json["labels"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "slug": slug,
        "product_id": productId,
        "title": title,
        "condition": condition,
        "has_offer": hasOffer,
        "raw_price": rawPrice,
        "currency": currency,
        "currency_symbol": currencySymbol,
        "price": price,
        "offer_price": offerPrice,
        "discount": discount,
        "offer_start": offerStart,
        "offer_end": offerEnd,
        "rating": rating,
        "stuff_pick": stuffPick,
        "free_shipping": freeShipping,
        "hot_item": hotItem,
        "labels": labels,
        "image": image,
      };
}

class Meta {
  Meta({
    this.dealTitle,
    this.dealsUnderPrice,
  });

  String? dealTitle;
  String? dealsUnderPrice;

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        dealTitle: json["deal_title"],
        dealsUnderPrice: json["deals_under_price"],
      );

  Map<String, dynamic> toMap() => {
        "deal_title": dealTitle,
        "deals_under_price": dealsUnderPrice,
      };
}
