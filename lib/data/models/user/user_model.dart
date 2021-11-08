import 'dart:convert';

class UserModel {
  UserModel({
    this.data,
  });

  User? data;

  factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        data: User.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class User {
  User({
    this.id,
    this.name,
    this.niceName,
    this.dob,
    this.sex,
    this.description,
    this.active,
    this.email,
    this.acceptsMarketing,
    this.memberSince,
    this.avatar,
    this.apiToken,
  });

  int? id;
  String? name;
  dynamic niceName;
  dynamic dob;
  dynamic sex;
  dynamic description;
  bool? active;
  String? email;
  dynamic acceptsMarketing;
  String? memberSince;
  String? avatar;
  String? apiToken;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        niceName: json["nice_name"],
        dob: json["dob"],
        sex: json["sex"],
        description: json["description"],
        active: json["active"],
        email: json["email"],
        acceptsMarketing: json["accepts_marketing"],
        memberSince: json["member_since"],
        avatar: json["avatar"],
        apiToken: json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nice_name": niceName,
        "dob": dob,
        "sex": sex,
        "description": description,
        "active": active,
        "email": email,
        "accepts_marketing": acceptsMarketing,
        "member_since": memberSince,
        "avatar": avatar,
        "api_token": apiToken,
      };
}
