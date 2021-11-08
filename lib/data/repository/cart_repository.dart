import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/data/interface/iCart_repository.dart';
import 'package:zcart/data/models/cart/cart_item_details_model.dart';
import 'package:zcart/data/models/cart/cart_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:zcart/views/shared_widgets/cart_bottom_sheet.dart';

class CartRepository implements ICartRepository {
  @override
  Future<List<CartItem>?> fetchCarts() async {
    var responseBody = await handleResponse(await getRequest(
      API.carts, /*bearerToken: true*/
    ));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    CartModel cartModel = CartModel.fromJson(responseBody);
    return cartModel.data;
  }

  @override
  Future addToCart(
    BuildContext context, {
    String? slug,
    int? quantity = 1,
    int? shipTo,
    int? shippingOptionId,
    int? shippingZoneId,
  }) async {
    var requestBody = {
      'quantity': quantity.toString(),
      if (shipTo != null) 'ship_to': shipTo.toString(),
      if (shippingOptionId != null)
        'shipping_option_id': shippingOptionId.toString(),
      if (shippingZoneId != null) 'shipping_zone_id': shippingZoneId.toString()
    };
    var responseBody;
    try {
      responseBody = await handleResponse(await postRequest(
          API.addToCart(slug), requestBody,
          bearerToken: false));

      if (responseBody.runtimeType != int)
        addToCartBottomSheet(context, responseBody);
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
  }

  @override
  Future updateCart({
    int? item,
    int? listingID,
    int? quantity = 1,
    int? countryId,
    int? shippingZoneId,
    int? shippingOptionId,
    int? packagingId,
  }) async {
    var requestBody = {
      if (listingID != null) 'item': listingID.toString(),
      if (quantity != null) 'quantity': quantity.toString(),
      if (countryId != null) 'ship_to': countryId.toString(),
      if (shippingZoneId != null) 'shipping_zone_id': shippingZoneId.toString(),
      if (shippingOptionId != null)
        'shipping_option_id': shippingOptionId.toString(),
      if (packagingId != null) 'packaging_id': packagingId.toString()
    };
    var responseBody;
    try {
      responseBody = await handleResponse(await putRequest(
          API.updateCart(item), requestBody,
          bearerToken: true));
      if (responseBody.runtimeType != int)
        toast(
          responseBody['message'],
          bgColor: kPrimaryColor,
          textColor: kLightColor,
          gravity: ToastGravity.CENTER,
        );
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
  }

  @override
  Future removeCart({int? cartID, int? listingID}) async {
    var responseBody;
    try {
      responseBody = await handleResponse(await deleteRequest(
          API.removeCart(cartID, listingID),
          bearerToken: true));
      if (responseBody.runtimeType != int)
        toast(
          responseBody['message'],
          bgColor: kPrimaryColor,
          textColor: kLightColor,
          gravity: ToastGravity.CENTER,
        );
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
  }

  @override
  Future<CartItemDetails?> fetchCartItemDetails(cartId) async {
    var responseBody = await handleResponse(
        await getRequest(API.cartItemDetails(cartId), bearerToken: true));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    CartItemDetailsModel cartItemDetailsModel =
        CartItemDetailsModel.fromJson(responseBody);
    return cartItemDetailsModel.data;
  }
}
