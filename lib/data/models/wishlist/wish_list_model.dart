class WishListModel {
  WishListModel({
    this.data,
    this.links,
    this.meta,
  });

  List<WIshListItem>? data;
  Links? links;
  Meta? meta;

  factory WishListModel.fromJson(Map<String, dynamic> json) => WishListModel(
        data: List<WIshListItem>.from(
            json["data"].map((x) => WIshListItem.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "links": links!.toJson(),
        "meta": meta!.toJson(),
      };
}

class WIshListItem {
  WIshListItem({
    this.id,
    this.listingId,
    this.productId,
    this.slug,
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
    this.stuffPick,
    this.freeShipping,
    this.hotItem,
    this.rating,
    this.image,
    this.labels,
  });

  int? id;
  int? listingId;
  int? productId;
  String? slug;
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
  bool? stuffPick;
  bool? freeShipping;
  bool? hotItem;
  String? rating;
  String? image;
  List<String>? labels;

  factory WIshListItem.fromJson(Map<String, dynamic> json) => WIshListItem(
        id: json["id"],
        listingId: json["listing_id"],
        productId: json["product_id"],
        slug: json["slug"],
        title: json["title"],
        condition: json["condition"],
        hasOffer: json["has_offer"],
        rawPrice: json["raw_price"],
        currency: json["currency"],
        currencySymbol: json["currency_symbol"],
        price: json["price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
        offerStart: json["offer_start"] == "" || json["offer_start"] == null
            ? DateTime.now()
            : DateTime.parse(json["offer_start"]),
        offerEnd: json["offer_end"] == "" || json["offer_end"] == null
            ? DateTime.now()
            : DateTime.parse(json["offer_end"]),
        stuffPick: json["stuff_pick"],
        freeShipping: json["free_shipping"],
        hotItem: json["hot_item"],
        rating: json["rating"] == null ? null : json["rating"].toString(),
        image: json["image"],
        labels: List<String>.from(json["labels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "listing_id": listingId,
        "product_id": productId,
        "slug": slug,
        "title": title,
        "condition": condition,
        "has_offer": hasOffer,
        "raw_price": rawPrice,
        "currency": currency,
        "currency_symbol": currencySymbol,
        "price": price,
        "offer_price": offerPrice,
        "discount": discount,
        "offer_start": offerStart!.toIso8601String(),
        "offer_end": offerEnd!.toIso8601String(),
        "stuff_pick": stuffPick,
        "free_shipping": freeShipping,
        "hot_item": hotItem,
        "rating": rating == null ? null : rating,
        "image": image,
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
