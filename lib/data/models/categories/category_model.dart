import 'dart:convert';

class CategoryModel {
  CategoryModel({
    this.data,
  });

  List<CategoryList>? data;

  factory CategoryModel.fromRawJson(String str) => CategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        data: List<CategoryList>.from(json["data"].map((x) => CategoryList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategoryList {
  CategoryList({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.icon,
    this.order,
    this.coverImage,
  });

  int? id;
  String? name;
  String? slug;
  String? description;
  String? icon;
  int? order;
  String? coverImage;

  factory CategoryList.fromRawJson(String str) => CategoryList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        icon: json["icon"],
        order: json["order"],
        coverImage: json["cover_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "icon": icon,
        "order": order,
        "cover_image": coverImage,
      };
}
