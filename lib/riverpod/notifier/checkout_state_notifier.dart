import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iCheckout_repository.dart';
import 'package:zcart/riverpod/state/checkout_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class CheckoutNotifier extends StateNotifier<CheckoutState> {
  final ICheckoutRepository _iCheckoutRepository;

  CheckoutNotifier(this._iCheckoutRepository) : super(CheckoutInitialState());

  int? cartId;
  int? addressId;
  var shippingAddress;
  var paymentMethodId;
  var shippingOptionId;
  var packagingId;
  var buyerNote;

  Future checkout() async {
    var requestBody = {
      "address_id": addressId.toString(),
      "shipping_address": shippingAddress.toString(),
      "payment_method_id": paymentMethodId.toString(),
      "shipping_option_id": shippingOptionId.toString(),
      "packaging_id": packagingId.toString(),
      if (buyerNote != null) "buyer_note": buyerNote
    };
    try {
      state = CheckoutLoadingState();
      await _iCheckoutRepository.checkout(cartId, requestBody);
      state = CheckoutLoadedState();
    } catch (e) {
      state = CheckoutErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future guestCheckout() async {
    var requestBody = {
      "address_id": addressId.toString(),
      "shipping_address": shippingAddress.toString(),
      "payment_method_id": paymentMethodId.toString(),
      "shipping_option_id": shippingOptionId.toString(),
      "packaging_id": packagingId.toString(),
      if (buyerNote != null) "buyer_note": buyerNote
    };
    try {
      state = CheckoutLoadingState();
      await _iCheckoutRepository.guestCheckout(cartId, requestBody);
      state = CheckoutLoadedState();
    } catch (e) {
      state = CheckoutErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
