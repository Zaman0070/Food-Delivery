class PackagingModel {
  PackagingModel({
    this.id,
    this.name,
    this.cost,
    this.height,
    this.width,
    this.depth,
    this.packagingModelDefault,
  });

  int? id;
  String? name;
  String? cost;
  String? height;
  String? width;
  String? depth;
  dynamic packagingModelDefault;

  factory PackagingModel.fromJson(Map<String, dynamic> json) => PackagingModel(
        id: json["id"],
        name: json["name"],
        cost: json["cost"],
        height: json["height"] == null ? null : json["height"],
        width: json["width"] == null ? null : json["width"],
        depth: json["depth"] == null ? null : json["depth"],
        packagingModelDefault: json["default"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cost": cost,
        "height": height == null ? null : height,
        "width": width == null ? null : width,
        "depth": depth == null ? null : depth,
        "default": packagingModelDefault,
      };
}
