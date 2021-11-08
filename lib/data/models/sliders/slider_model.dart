import 'dart:convert';

class SliderModel {
  SliderModel({
    this.data,
  });

  List<SliderList>? data;

  factory SliderModel.fromRawJson(String str) => SliderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    data: List<SliderList>.from(json["data"].map((x) => SliderList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SliderList {
  SliderList({
    this.id,
    this.title,
    this.titleColor,
    this.subTitle,
    this.image,
    this.subTitleColor,
    this.link,
    this.order,
  });

  int? id;
  String? title;
  String? titleColor;
  String? subTitle;
  ImageObject? image;
  String? subTitleColor;
  String? link;
  int? order;

  factory SliderList.fromRawJson(String str) => SliderList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SliderList.fromJson(Map<String, dynamic> json) => SliderList(
    id: json["id"],
    title: json["title"],
    titleColor: json["title_color"],
    subTitle: json["sub_title"],
    image: ImageObject.fromJson(json["image"]),
    subTitleColor: json["sub_title_color"],
    link: json["link"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "title_color": titleColor,
    "sub_title": subTitle,
    "image": image!.toJson(),
    "sub_title_color": subTitleColor,
    "link": link,
    "order": order,
  };
}

class ImageObject {
  ImageObject({
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
  int? featured;

  factory ImageObject.fromRawJson(String str) => ImageObject.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageObject.fromJson(Map<String, dynamic> json) => ImageObject(
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
