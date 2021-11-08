
import 'dart:convert';

class VendorFeedbackModel {
  VendorFeedbackModel({
    this.data,
  });

  List<VendorFeedback>? data;

  factory VendorFeedbackModel.fromRawJson(String str) => VendorFeedbackModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorFeedbackModel.fromJson(Map<String, dynamic> json) => VendorFeedbackModel(
    data: List<VendorFeedback>.from(json["data"].map((x) => VendorFeedback.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class VendorFeedback {
  VendorFeedback({
    this.id,
    this.rating,
    this.comment,
    this.approved,
    this.spam,
    this.updatedAt,
  });

  int? id;
  int? rating;
  String? comment;
  bool? approved;
  bool? spam;
  String? updatedAt;

  factory VendorFeedback.fromRawJson(String str) => VendorFeedback.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorFeedback.fromJson(Map<String, dynamic> json) => VendorFeedback(
    id: json["id"],
    rating: json["rating"],
    comment: json["comment"],
    approved: json["approved"],
    spam: json["spam"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rating": rating,
    "comment": comment,
    "approved": approved,
    "spam": spam,
    "updated_at": updatedAt,
  };
}
