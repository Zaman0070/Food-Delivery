import 'package:zcart/data/models/address/address_model.dart';
import 'package:zcart/data/models/address/packaging_model.dart';
import 'package:zcart/data/models/address/payment_options_model.dart';
import 'package:zcart/data/models/address/shipping_model.dart';
import 'package:zcart/data/models/address/shipping_options_model.dart';

abstract class AddressState {
  const AddressState();
}

class AddressInitialState extends AddressState {
  const AddressInitialState();
}

class AddressLoadingState extends AddressState {
  const AddressLoadingState();
}

class AddressLoadedState extends AddressState {
  final List<Addresses>? addresses;

  const AddressLoadedState(this.addresses);
}

class AddressErrorState extends AddressState {
  final String message;

  const AddressErrorState(this.message);
}

/*
* Packaging
*/
abstract class PackagingState {
  const PackagingState();
}

class PackagingInitialState extends PackagingState {
  const PackagingInitialState();
}

class PackagingLoadingState extends PackagingState {
  const PackagingLoadingState();
}

class PackagingLoadedState extends PackagingState {
  final List<PackagingModel> packagingList;

  const PackagingLoadedState(this.packagingList);
}

class PackagingErrorState extends PackagingState {
  final String message;

  const PackagingErrorState(this.message);
}

/*
* Shipping
*/
abstract class ShippingState {
  const ShippingState();
}

class ShippingInitialState extends ShippingState {
  const ShippingInitialState();
}

class ShippingLoadingState extends ShippingState {
  const ShippingLoadingState();
}

class ShippingLoadedState extends ShippingState {
  final List<ShippingOptions>? shippingOptions;

  const ShippingLoadedState(this.shippingOptions);
}

class ShippingOptionsLoadedState extends ShippingState {
  final List<ShippingOption>? shippingOptions;

  const ShippingOptionsLoadedState(this.shippingOptions);
}

class ShippingErrorState extends ShippingState {
  final String message;

  const ShippingErrorState(this.message);
}

/*
* Payment options
*/
abstract class PaymentOptionsState {
  const PaymentOptionsState();
}

class PaymentOptionsInitialState extends PaymentOptionsState {
  const PaymentOptionsInitialState();
}

class PaymentOptionsLoadingState extends PaymentOptionsState {
  const PaymentOptionsLoadingState();
}

class PaymentOptionsLoadedState extends PaymentOptionsState {
  final List<PaymentOptions>? paymentOptions;

  const PaymentOptionsLoadedState(this.paymentOptions);
}

class PaymentOptionsErrorState extends PaymentOptionsState {
  final String message;

  const PaymentOptionsErrorState(this.message);
}
