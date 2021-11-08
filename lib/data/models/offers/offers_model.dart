
import 'dart:convert';

class OffersModel {
  OffersModel({
    this.data,
  });

  Data? data;

  factory OffersModel.fromRawJson(String str) => OffersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.name,
    this.slug,
    this.gtinType,
    this.gtin,
    this.description,
    this.brand,
    this.brandSlug,
    this.image,
    this.listings,
  });

  int? id;
  String? name;
  String? slug;
  String? gtinType;
  String? gtin;
  String? description;
  String? brand;
  String? brandSlug;
  String? image;
  List<Listing>? listings;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    gtinType: json["gtin_type"],
    gtin: json["gtin"],
    description: json["description"],
    brand: json["brand"],
    brandSlug: json["brand_slug"],
    image: json["image"],
    listings: List<Listing>.from(json["listings"].map((x) => Listing.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "gtin_type": gtinType,
    "gtin": gtin,
    "description": description,
    "brand": brand,
    "brand_slug": brandSlug,
    "image": image,
    "listings": List<dynamic>.from(listings!.map((x) => x.toJson())),
  };
}

class Listing {
  Listing({
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
    this.image,
    this.rating,
    this.stuffPick,
    this.freeShipping,
    this.hotItem,
    this.labels,
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
  String? image;
  int? rating;
  bool? stuffPick;
  bool? freeShipping;
  bool? hotItem;
  List<String>? labels;

  factory Listing.fromRawJson(String str) => Listing.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Listing.fromJson(Map<String, dynamic> json) => Listing(
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
    image: json["image"],
    rating: json["rating"] == null ? null : json["rating"],
    stuffPick: json["stuff_pick"],
    freeShipping: json["free_shipping"],
    hotItem: json["hot_item"],
    labels: List<String>.from(json["labels"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
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
    "image": image,
    "rating": rating == null ? null : rating,
    "stuff_pick": stuffPick,
    "free_shipping": freeShipping,
    "hot_item": hotItem,
    "labels": List<dynamic>.from(labels!.map((x) => x)),
  };
}
