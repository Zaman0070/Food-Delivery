import 'dart:convert';

class VendorModel {
  VendorModel({
    this.data,
  });

  List<VendorsList>? data;

  factory VendorModel.fromRawJson(String str) => VendorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
    data: List<VendorsList>.from(json["data"].map((x) => VendorsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class VendorsList {
  VendorsList({
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

  factory VendorsList.fromRawJson(String str) => VendorsList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorsList.fromJson(Map<String, dynamic> json) => VendorsList(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    verified: json["verified"],
    verifiedText: json["verified_text"],
    rating: json["rating"] == null ? null : json["rating"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "verified": verified,
    "verified_text": verifiedText,
    "rating": rating == null ? null : rating,
    "image": image,
  };
}
