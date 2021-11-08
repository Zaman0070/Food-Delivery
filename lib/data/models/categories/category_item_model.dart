import 'dart:convert';

CategoryItemModel categoryItemListModelFromJson(String str) => CategoryItemModel.fromJson(json.decode(str));

String categoryItemListModelToJson(CategoryItemModel data) => json.encode(data.toJson());

class CategoryItemModel {
  CategoryItemModel({
    this.data,
    this.links,
    this.meta,
  });

  List<CategoryItem>? data;
  Links? links;
  Meta? meta;

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) => CategoryItemModel(
        data: List<CategoryItem>.from(json["data"].map((x) => CategoryItem.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
      };
}

class CategoryItem {
  CategoryItem({
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
  String? offerPrice;
  String? discount;
  DateTime? offerStart;
  DateTime? offerEnd;
  String? image;
  String? rating;
  bool? stuffPick;
  bool? freeShipping;
  bool? hotItem;
  List<String>? labels;

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
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
        offerPrice: json["offer_price"] == null ? null : json["offer_price"],
        discount: json["discount"] == null ? null : json["discount"],
        offerStart: json["offer_start"] == null ? null : DateTime.parse(json["offer_start"]),
        offerEnd: json["offer_end"] == null ? null : DateTime.parse(json["offer_end"]),
        image: json["image"],
        rating: json["rating"] == null ? null : json["rating"].toString(),
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
        "offer_price": offerPrice == null ? null : offerPrice,
        "discount": discount == null ? null : discount,
        "offer_start": offerStart == null ? null : offerStart!.toIso8601String(),
        "offer_end": offerEnd == null ? null : offerEnd!.toIso8601String(),
        "image": image,
        "rating": rating == null ? null : rating,
        "stuff_pick": stuffPick,
        "free_shipping": freeShipping,
        "hot_item": hotItem,
        "labels": List<dynamic>.from(labels!.map((x) => x)),
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
