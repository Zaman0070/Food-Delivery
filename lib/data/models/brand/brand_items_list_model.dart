// To parse this JSON data, do
//
//     final brandItemsList = brandItemsListFromMap(jsonString);

import 'dart:convert';

BrandItemsList brandItemsListFromMap(String str) =>
    BrandItemsList.fromMap(json.decode(str));

String brandItemsListToMap(BrandItemsList data) => json.encode(data.toMap());

class BrandItemsList {
  BrandItemsList({
    this.data,
    this.links,
    this.meta,
  });

  List<Datum>? data;
  Links? links;
  Meta? meta;

  factory BrandItemsList.fromMap(Map<String, dynamic> json) => BrandItemsList(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        links: Links.fromMap(json["links"]),
        meta: Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "links": links!.toMap(),
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
  String? rating;
  bool? stuffPick;
  bool? freeShipping;
  bool? hotItem;
  List<String>? labels;
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
        rating: json["rating"] == null ? null : json["rating"],
        stuffPick: json["stuff_pick"],
        freeShipping: json["free_shipping"],
        hotItem: json["hot_item"],
        labels: List<String>.from(json["labels"].map((x) => x)),
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
        "rating": rating == null ? null : rating,
        "stuff_pick": stuffPick,
        "free_shipping": freeShipping,
        "hot_item": hotItem,
        "labels": List<dynamic>.from(labels!.map((x) => x)),
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

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toMap() => {
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

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
