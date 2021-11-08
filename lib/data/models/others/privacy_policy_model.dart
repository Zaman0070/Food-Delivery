
class PrivacyPolicyModel {
  PrivacyPolicyModel({
    this.data,
  });

  Data? data;

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) => PrivacyPolicyModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.title,
    this.slug,
    this.content,
    this.updatedAt,
    this.publishedAt,
  });

  int? id;
  String? title;
  String? slug;
  String? content;
  String? updatedAt;
  String? publishedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    content: json["content"],
    updatedAt: json["updated_at"],
    publishedAt: json["published_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "content": content,
    "updated_at": updatedAt,
    "published_at": publishedAt,
  };
}
