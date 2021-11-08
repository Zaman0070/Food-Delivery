class TermsAndConditionModel {
  TermsAndConditionModel({
    this.data,
  });

  Data? data;

  factory TermsAndConditionModel.fromJson(Map<String, dynamic> json) => TermsAndConditionModel(
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
