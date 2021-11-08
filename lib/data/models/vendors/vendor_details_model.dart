import 'dart:convert';

class VendorDetailsModel {
  VendorDetailsModel({
    this.data,
  });

  VendorDetails? data;

  factory VendorDetailsModel.fromRawJson(String str) => VendorDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorDetailsModel.fromJson(Map<String, dynamic> json) => VendorDetailsModel(
    data: VendorDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class VendorDetails {
  VendorDetails({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.memberSince,
    this.verified,
    this.verifiedText,
    this.bannerImage,
    this.soldItemCount,
    this.activeListingsCount,
    this.rating,
    this.feedbacks,
    this.image,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  String? memberSince;
  bool? verified;
  String? verifiedText;
  String? bannerImage;
  int? soldItemCount;
  int? activeListingsCount;
  String? rating;
  List<VendorDetailsFeedback>? feedbacks;
  String? image;

  factory VendorDetails.fromRawJson(String str) => VendorDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorDetails.fromJson(Map<String, dynamic> json) => VendorDetails(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    description: json["description"],
    memberSince: json["member_since"],
    verified: json["verified"],
    verifiedText: json["verified_text"],
    bannerImage: json["banner_image"],
    soldItemCount: json["sold_item_count"],
    activeListingsCount: json["active_listings_count"],
    rating: json["rating"],
    feedbacks: List<VendorDetailsFeedback>.from(json["feedbacks"].map((x) => VendorDetailsFeedback.fromJson(x))),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "description": description,
    "member_since": memberSince,
    "verified": verified,
    "verified_text": verifiedText,
    "banner_image": bannerImage,
    "sold_item_count": soldItemCount,
    "active_listings_count": activeListingsCount,
    "rating": rating,
    "feedbacks": List<dynamic>.from(feedbacks!.map((x) => x.toJson())),
    "image": image,
  };
}

class VendorDetailsFeedback {
  VendorDetailsFeedback({
    this.id,
    this.rating,
    this.comment,
    this.approved,
    this.spam,
    this.updatedAt,
  });

  int? id;
  int? rating;
  String? comment;
  bool? approved;
  bool? spam;
  String? updatedAt;

  factory VendorDetailsFeedback.fromRawJson(String str) => VendorDetailsFeedback.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorDetailsFeedback.fromJson(Map<String, dynamic> json) => VendorDetailsFeedback(
    id: json["id"],
    rating: json["rating"],
    comment: json["comment"],
    approved: json["approved"],
    spam: json["spam"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rating": rating,
    "comment": comment,
    "approved": approved,
    "spam": spam,
    "updated_at": updatedAt,
  };
}
