import 'dart:convert';

class BannerModel {
  BannerModel({
    this.data,
  });

  List<BannerList>? data;

  factory BannerModel.fromRawJson(String str) => BannerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        data: List<BannerList>.from(json["data"].map((x) => BannerList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class BannerList {
  BannerList({
    this.id,
    this.title,
    this.description,
    this.image,
    this.link,
    this.linkLabel,
    this.bgColor,
    this.groupId,
  });

  int? id;
  String? title;
  String? description;
  String? image;
  String? link;
  String? linkLabel;
  String? bgColor;
  String? groupId;

  factory BannerList.fromRawJson(String str) => BannerList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerList.fromJson(Map<String, dynamic> json) => BannerList(
        id: json["id"],
        title: json["title"] ?? '',
        description: json["description"] ?? '',
        image: json["image"],
        link: json["link"].toString(),
        //TODO: Notify developer id 11 -> link param -> value '{}' instead of null
        linkLabel: json["link_label"] ?? "",
        bgColor: json["bg_color"] ?? '',
        groupId: json["group_id"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "link": link,
        "link_label": linkLabel,
        "bg_color": bgColor,
        "group_id": groupId,
      };
}


