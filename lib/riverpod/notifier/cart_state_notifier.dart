import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iCart_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/cart_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class CartNotifier extends StateNotifier<CartState> {
  final ICartRepository _iCartRepository;

  CartNotifier(this._iCartRepository) : super(CartInitialState());

  Future<void> getCartList() async {
    try {
      //state = CartLoadingState();
      final cartList = await _iCartRepository.fetchCarts();
      state = CartLoadedState(cartList);
    } on NetworkException {
      state = CartErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> addToCart(
    BuildContext context,
    String? slug,
    int? quantity,
    int? shipTo,
    int? shippingOptionId,
    int? shippingZoneId,
  ) async {
    try {
      await _iCartRepository.addToCart(
        context,
        slug: slug,
        quantity: quantity,
        shipTo: shipTo,
        shippingOptionId: shippingOptionId,
        shippingZoneId: shippingZoneId,
      );
    } on NetworkException {
      state = CartErrorState(LocaleKeys.something_went_wrong.tr());
    }

    getCartList();
  }

  Future<void> updateCart(
    int? item, {
    int? listingID,
    int? quantity,
    int? countryId,
    int? shippingZoneId,
    int? shippingOptionId,
    int? packagingId,
  }) async {
    try {
      await _iCartRepository.updateCart(
          item: item,
          listingID: listingID,
          quantity: quantity,
          countryId: countryId,
          shippingZoneId: shippingZoneId,
          shippingOptionId: shippingOptionId,
          packagingId: packagingId);
      getCartList();
    } on NetworkException {
      state = CartErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> removeFromCart(cart, item) async {
    try {
      await _iCartRepository.removeCart(cartID: cart, listingID: item);
      getCartList();
    } on NetworkException {
      state = CartErrorState(LocaleKeys.something_went_wrong.tr());
      getCartList();
    }
  }
}

class CartItemDetailsNotifier extends StateNotifier<CartItemDetailsState> {
  final ICartRepository _iCartRepository;

  CartItemDetailsNotifier(this._iCartRepository)
      : super(CartItemDetailsInitialState());

  Future<void> getCartItemDetails(cartId) async {
    try {
      //state = CartLoadingState();
      final cartItemDetails =
          await _iCartRepository.fetchCartItemDetails(cartId);
      state = CartItemDetailsLoadedState(cartItemDetails);
    } on NetworkException {
      state = CartItemDetailsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> updateCart(
    int? item, {
    int? listingID,
    int? quantity,
    int? countryId,
    int? shippingZoneId,
    int? shippingOptionId,
    int? packagingId,
  }) async {
    try {
      await _iCartRepository.updateCart(
          item: item,
          listingID: listingID,
          quantity: quantity,
          countryId: countryId,
          shippingZoneId: shippingZoneId,
          shippingOptionId: shippingOptionId,
          packagingId: packagingId);
      getCartItemDetails(item);
    } on NetworkException {
      state = CartItemDetailsErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
