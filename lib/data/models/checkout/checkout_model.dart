import 'dart:convert';

Checkout checkoutFromJson(String str) => Checkout.fromJson(json.decode(str));

String checkoutToJson(Checkout data) => json.encode(data.toJson());

class Checkout {
  Checkout({
    this.addressId,
    this.shippingAddress,
    this.paymentMethodId,
    this.shippingOptionId,
    this.packagingId,
    this.buyerNote,
  });

  int? addressId;
  String? shippingAddress;
  int? paymentMethodId;
  int? shippingOptionId;
  int? packagingId;
  String? buyerNote;

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
        addressId: json["address_id"],
        shippingAddress: json["shipping_address"],
        paymentMethodId: json["payment_method_id"],
        shippingOptionId: json["shipping_option_id"],
        packagingId: json["packaging_id"],
        buyerNote: json["buyer_note"],
      );

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "shipping_address": shippingAddress,
        "payment_method_id": paymentMethodId,
        "shipping_option_id": shippingOptionId,
        "packaging_id": packagingId,
        "buyer_note": buyerNote,
      };
}
