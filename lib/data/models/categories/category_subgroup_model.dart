import 'dart:convert';

CategorySubGroupModel categorySubGroupModelFromJson(String str) => CategorySubGroupModel.fromJson(json.decode(str));

String categorySubGroupModelToJson(CategorySubGroupModel data) => json.encode(data.toJson());

class CategorySubGroupModel {
  CategorySubGroupModel({
    this.data,
  });

  List<CategorySubgroup>? data;

  factory CategorySubGroupModel.fromJson(Map<String, dynamic> json) => CategorySubGroupModel(
        data: List<CategorySubgroup>.from(json["data"].map((x) => CategorySubgroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategorySubgroup {
  CategorySubgroup({
    this.id,
    this.categoryGroupId,
    this.name,
    this.slug,
    this.description,
    this.coverImage,
  });

  int? id;
  int? categoryGroupId;
  String? name;
  String? slug;
  String? description;
  String? coverImage;

  factory CategorySubgroup.fromJson(Map<String, dynamic> json) => CategorySubgroup(
        id: json["id"],
        categoryGroupId: json["category_group_id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        coverImage: json["cover_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_group_id": categoryGroupId,
        "name": name,
        "slug": slug,
        "description": description,
        "cover_image": coverImage,
      };
}
