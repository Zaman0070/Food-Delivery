
class AddressModel {
  AddressModel({
    this.data,
  });

  List<Addresses>? data;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        data: List<Addresses>.from(json["data"].map((x) => Addresses.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Addresses {
  Addresses({
    this.id,
    this.addressType,
    this.addressTitle,
    this.addressLine1,
    this.addressLine2,
    this.city,
    this.zipCode,
    this.country,
    this.state,
    this.phone,
  });

  int? id;
  String? addressType;
  String? addressTitle;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? zipCode;
  Country? country;
  CountryState? state;
  String? phone;

  factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
        id: json["id"],
        addressType: json["address_type"],
        addressTitle: json["address_title"],
        addressLine1: json["address_line_1"],
        addressLine2: json["address_line_2"],
        city: json["city"],
        zipCode: json["zip_code"],
        country: json["country"] != null ? Country.fromJson(json["country"]) : null,
        state: json["state"] != null ? CountryState.fromJson(json["state"]) : null,
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address_type": addressType,
        "address_title": addressTitle,
        "address_line_1": addressLine1,
        "address_line_2": addressLine2,
        "city": city,
        "zip_code": zipCode,
        "country": country!.toJson(),
        "state": state!.toJson(),
        "phone": phone,
      };
}

class Country {
  Country({
    this.id,
    this.name,
    this.isoCode,
    this.countryId,
  });

  int? id;
  String? name;
  String? isoCode;
  int? countryId;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        isoCode: json["iso_code"],
        countryId: json["country_id"] == null ? null : json["country_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iso_code": isoCode,
        "country_id": countryId == null ? null : countryId,
      };
}

class CountryState {
  CountryState({
    this.id,
    this.name,
    this.countryId,
    this.isoCode,
  });

  int? id;
  String? name;
  int? countryId;
  String? isoCode;

  factory CountryState.fromJson(Map<String, dynamic> json) => CountryState(
        id: json["id"],
        name: json["name"],
        countryId: json["country_id"],
        isoCode: json["iso_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country_id": countryId,
        "iso_code": isoCode,
      };
}
