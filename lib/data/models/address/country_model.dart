class CountryModel {
  CountryModel({
    this.data,
  });

  List<Countries>? data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        data: List<Countries>.from(json["data"].map((x) => Countries.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Countries {
  Countries({
    this.id,
    this.name,
    this.isoCode,
  });

  int? id;
  String? name;
  String? isoCode;

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        id: json["id"],
        name: json["name"],
        isoCode: json["iso_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iso_code": isoCode,
      };
}
