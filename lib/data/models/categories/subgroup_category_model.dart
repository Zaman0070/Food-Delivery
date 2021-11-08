// To parse this JSON data, do
//
//     final subgroupCategoriesModel = subgroupCategoriesModelFromJson(jsonString);

import 'dart:convert';

SubgroupCategoryModel subgroupCategoriesModelFromJson(String str) => SubgroupCategoryModel.fromJson(json.decode(str));

String subgroupCategoryModelToJson(SubgroupCategoryModel data) => json.encode(data.toJson());

class SubgroupCategoryModel {
  SubgroupCategoryModel({
    this.data,
  });

  List<SubgroupCategory>? data;

  factory SubgroupCategoryModel.fromJson(Map<String, dynamic> json) => SubgroupCategoryModel(
        data: List<SubgroupCategory>.from(json["data"].map((x) => SubgroupCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class SubgroupCategory {
  SubgroupCategory({
    this.id,
    this.categorySubGroupId,
    this.name,
    this.slug,
    this.description,
    this.featured,
    this.featureImage,
    this.coverImage,
  });

  int? id;
  int? categorySubGroupId;
  String? name;
  String? slug;
  String? description;
  dynamic featured;
  String? featureImage;
  String? coverImage;

  factory SubgroupCategory.fromJson(Map<String, dynamic> json) => SubgroupCategory(
        id: json["id"],
        categorySubGroupId: json["category_sub_group_id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        featured: json["featured"],
        featureImage: json["feature_image"],
        coverImage: json["cover_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_sub_group_id": categorySubGroupId,
        "name": name,
        "slug": slug,
        "description": description,
        "featured": featured,
        "feature_image": featureImage,
        "cover_image": coverImage,
      };
}
