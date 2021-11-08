import 'dart:convert';

StatesModel statesModelFromJson(String str) => StatesModel.fromJson(json.decode(str));

String statesModelToJson(StatesModel data) => json.encode(data.toJson());

class StatesModel {
  StatesModel({
    this.data,
  });

  List<States>? data;

  factory StatesModel.fromJson(Map<String, dynamic> json) => StatesModel(
    data: List<States>.from(json["data"].map((x) => States.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class States {
  States({
    this.id,
    this.name,
    this.isoCode,
  });

  int? id;
  String? name;
  String? isoCode;

  factory States.fromJson(Map<String, dynamic> json) => States(
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