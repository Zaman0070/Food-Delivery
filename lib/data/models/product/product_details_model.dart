import 'dart:convert';

class ProductDetailsModel {
  ProductDetailsModel({
    this.data,
    this.variants,
    this.shippingCountryId,
    this.shippingOptions,
    this.countries,
  });

  Data? data;
  Variants? variants;
  int? shippingCountryId;
  List<ShippingOption>? shippingOptions;
  Map<String, String>? countries;

  factory ProductDetailsModel.fromRawJson(String str) =>
      ProductDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        data: Data.fromJson(json["data"]),
        variants: Variants.fromJson(json["variants"]),
        shippingCountryId: json["shipping_country_id"],
        shippingOptions: List<ShippingOption>.from(
            json["shipping_options"].map((x) => ShippingOption.fromJson(x))),
        countries: Map.from(json["countries"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "variants": variants!.toJson(),
        "shipping_country_id": shippingCountryId,
        "shipping_options":
            List<dynamic>.from(shippingOptions!.map((x) => x.toJson())),
        "countries":
            Map.from(countries!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Data {
  Data({
    this.id,
    this.slug,
    this.title,
    this.brand,
    this.sku,
    this.condition,
    this.conditionNote,
    this.description,
    this.keyFeatures,
    this.stockQuantity,
    this.hasOffer,
    this.rawPrice,
    this.currency,
    this.currencySymbol,
    this.price,
    this.offerPrice,
    this.discount,
    this.offerStart,
    this.offerEnd,
    this.shippingWeight,
    this.minOrderQuantity,
    this.attributes,
    this.imageId,
    this.feedbacksCount,
    this.rating,
    this.feedbacks,
    this.shop,
    this.product,
    this.freeShipping,
    this.stuffPick,
    this.labels,
    this.linkedItems,
  });

  int? id;
  String? slug;
  String? title;
  String? brand;
  String? sku;
  String? condition;
  String? conditionNote;
  String? description;
  List<String>? keyFeatures;
  int? stockQuantity;
  bool? hasOffer;
  String? rawPrice;
  String? currency;
  String? currencySymbol;
  String? price;
  String? offerPrice;
  String? discount;
  DateTime? offerStart;
  DateTime? offerEnd;
  String? shippingWeight;
  int? minOrderQuantity;
  List<Attribute>? attributes;
  int? imageId;
  int? feedbacksCount;
  dynamic rating;
  List<dynamic>? feedbacks;
  Shop? shop;
  Product? product;
  bool? freeShipping;
  bool? stuffPick;
  List<String>? labels;
  List<LinkedItem>? linkedItems;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        brand: json["brand"],
        sku: json["sku"],
        condition: json["condition"],
        conditionNote: json["condition_note"],
        description: json["description"],
        keyFeatures: List<String>.from(json["key_features"].map((x) => x)),
        stockQuantity: json["stock_quantity"],
        hasOffer: json["has_offer"],
        rawPrice: json["raw_price"],
        currency: json["currency"],
        currencySymbol: json["currency_symbol"],
        price: json["price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
        offerStart: json["offer_start"] == null
            ? null
            : DateTime.parse(json["offer_start"]),
        offerEnd: json["offer_end"] == null
            ? null
            : DateTime.parse(json["offer_end"]),
        shippingWeight: json["shipping_weight"],
        minOrderQuantity: json["min_order_quantity"],
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        imageId: json["image_id"],
        feedbacksCount: json["feedbacks_count"],
        rating: json["rating"],
        feedbacks: List<dynamic>.from(json["feedbacks"].map((x) => x)),
        shop: Shop.fromJson(json["shop"]),
        product: Product.fromJson(json["product"]),
        freeShipping: json["free_shipping"],
        stuffPick: json["stuff_pick"],
        labels: List<String>.from(json["labels"].map((x) => x)),
        linkedItems: List<LinkedItem>.from(
            json["linked_items"].map((x) => LinkedItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "brand": brand,
        "sku": sku,
        "condition": condition,
        "condition_note": conditionNote,
        "description": description,
        "key_features": List<dynamic>.from(keyFeatures!.map((x) => x)),
        "stock_quantity": stockQuantity,
        "has_offer": hasOffer,
        "raw_price": rawPrice,
        "currency": currency,
        "currency_symbol": currencySymbol,
        "price": price,
        "offer_price": offerPrice,
        "discount": discount,
        "offer_start": offerStart!.toIso8601String(),
        "offer_end": offerEnd!.toIso8601String(),
        "shipping_weight": shippingWeight,
        "min_order_quantity": minOrderQuantity,
        "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "image_id": imageId,
        "feedbacks_count": feedbacksCount,
        "rating": rating,
        "feedbacks": List<dynamic>.from(feedbacks!.map((x) => x)),
        "shop": shop!.toJson(),
        "product": product!.toJson(),
        "free_shipping": freeShipping,
        "stuff_pick": stuffPick,
        "labels": List<dynamic>.from(labels!.map((x) => x)),
        "linked_items": List<dynamic>.from(linkedItems!.map((x) => x.toJson())),
      };
}

class Attribute {
  Attribute({
    this.id,
    this.value,
  });

  int? id;
  int? value;

  factory Attribute.fromRawJson(String str) =>
      Attribute.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}

class LinkedItem {
  LinkedItem({
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
    this.image,
  });

  int? id;
  String? slug;
  String? title;
  String? condition;
  List<dynamic>? keyFeatures;
  int? stockQuantity;
  bool? hasOffer;
  String? rawPrice;
  String? currency;
  String? currencySymbol;
  String? price;
  dynamic offerPrice;
  dynamic discount;
  bool? freeShipping;
  int? minOrderQuantity;
  dynamic rating;
  String? image;

  factory LinkedItem.fromRawJson(String str) =>
      LinkedItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LinkedItem.fromJson(Map<String, dynamic> json) => LinkedItem(
        id: json["id"],
        slug: json["slug"],
        title: json["title"],
        condition: json["condition"],
        keyFeatures: json["key_features"],
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
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title,
        "condition": condition,
        "key_features": keyFeatures,
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
        "image": image,
      };
}

class Product {
  Product({
    this.id,
    this.slug,
    this.name,
    this.modelNumber,
    this.gtin,
    this.gtinType,
    this.mpn,
    this.brand,
    this.manufacturer,
    this.origin,
    this.listingCount,
    this.description,
    this.availableFrom,
    this.image,
  });

  int? id;
  String? slug;
  String? name;
  String? modelNumber;
  String? gtin;
  String? gtinType;
  String? mpn;
  String? brand;
  Manufacturer? manufacturer;
  String? origin;
  int? listingCount;
  String? description;
  String? availableFrom;
  String? image;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        modelNumber: json["model_number"],
        gtin: json["gtin"],
        gtinType: json["gtin_type"],
        mpn: json["mpn"],
        brand: json["brand"],
        manufacturer: Manufacturer.fromJson(json["manufacturer"]),
        origin: json["origin"],
        listingCount: json["listing_count"],
        description: json["description"],
        availableFrom: json["available_from"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "model_number": modelNumber,
        "gtin": gtin,
        "gtin_type": gtinType,
        "mpn": mpn,
        "brand": brand,
        "manufacturer": manufacturer!.toJson(),
        "origin": origin,
        "listing_count": listingCount,
        "description": description,
        "available_from": availableFrom,
        "image": image,
      };
}

class Manufacturer {
  Manufacturer({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory Manufacturer.fromRawJson(String str) =>
      Manufacturer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Manufacturer.fromJson(Map<String, dynamic> json) => Manufacturer(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
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

  factory Shop.fromRawJson(String str) => Shop.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

class ShippingOption {
  ShippingOption({
    this.id,
    this.name,
    this.shippingZoneId,
    this.carrierId,
    this.carrierName,
    this.cost,
    this.costRaw,
    this.deliveryTakes,
  });

  int? id;
  String? name;
  int? shippingZoneId;
  int? carrierId;
  String? carrierName;
  String? cost;
  String? costRaw;
  String? deliveryTakes;

  factory ShippingOption.fromRawJson(String str) =>
      ShippingOption.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShippingOption.fromJson(Map<String, dynamic> json) => ShippingOption(
        id: json["id"],
        name: json["name"],
        shippingZoneId: json["shipping_zone_id"],
        carrierId: json["carrier_id"],
        carrierName: json["carrier_name"],
        cost: json["cost"],
        costRaw: json["cost_raw"].toString(),
        deliveryTakes: json["delivery_takes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shipping_zone_id": shippingZoneId,
        "carrier_id": carrierId,
        "carrier_name": carrierName,
        "cost": cost,
        "cost_raw": costRaw,
        "delivery_takes": deliveryTakes,
      };
}

class Variants {
  Variants({
    this.images,
    this.attributes,
  });

  List<ProductImage>? images;
  Map<String, AttributeValue>? attributes;

  factory Variants.fromRawJson(String str) =>
      Variants.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variants.fromJson(Map<String, dynamic> json) {
    return Variants(
      images: List<ProductImage>.from(
          json["images"].map((x) => ProductImage.fromJson(x))),
      attributes: (json["attributes"] is List<dynamic>)
          ? null
          : Map.from(json["attributes"]).map((k, v) =>
              MapEntry<String, AttributeValue>(k, AttributeValue.fromJson(v))),
    );
  }

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
        "attributes": Map.from(attributes!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class AttributeValue {
  AttributeValue({
    this.name,
    this.value,
  });

  String? name;
  Map<String, String>? value;

  factory AttributeValue.fromRawJson(String str) =>
      AttributeValue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
        name: json["name"],
        value: Map.from(json["value"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": Map.from(value!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class ProductImage {
  ProductImage({
    this.id,
    this.path,
    this.name,
    this.extension,
    this.order,
    this.featured,
  });

  int? id;
  String? path;
  String? name;
  String? extension;
  int? order;
  dynamic featured;

  factory ProductImage.fromRawJson(String str) =>
      ProductImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        path: json["path"],
        name: json["name"],
        extension: json["extension"],
        order: json["order"],
        featured: json["featured"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "name": name,
        "extension": extension,
        "order": order,
        "featured": featured,
      };
}
