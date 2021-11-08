import 'dart:convert';

BrandProfile brandProfileFromMap(String str) =>
    BrandProfile.fromMap(json.decode(str));

String brandProfileToMap(BrandProfile data) => json.encode(data.toMap());

class BrandProfile {
  BrandProfile({
    this.data,
  });

  Data? data;

  factory BrandProfile.fromMap(Map<String, dynamic> json) => BrandProfile(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data!.toMap(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.slug,
    this.url,
    this.description,
    this.origin,
    this.listingCount,
    this.availableFrom,
    this.image,
    this.coverImage,
  });

  int? id;
  String? name;
  String? slug;
  String? url;
  String? description;
  String? origin;
  dynamic listingCount;
  String? availableFrom;
  String? image;
  String? coverImage;

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        url: json["url"],
        description: json["description"],
        origin: json["origin"],
        listingCount: json["listing_count"],
        availableFrom: json["available_from"],
        image: json["image"],
        coverImage: json["cover_image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
        "url": url,
        "description": description,
        "origin": origin,
        "listing_count": listingCount,
        "available_from": availableFrom,
        "image": image,
        "cover_image": coverImage,
      };
}
