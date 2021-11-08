import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/data/interface/iWishlist_repository.dart';
import 'package:zcart/data/models/wishlist/wish_list_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/auth/login_screen.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';

class WishListRepository implements IWishListRepository {
  late WishListModel wishListModel;
  List<WIshListItem> items = [];

  @override
  Future<List<WIshListItem>> fetchWishList() async {
    items.clear();

    var responseBody =
        await handleResponse(await getRequest(API.wishList, bearerToken: true));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    wishListModel = WishListModel.fromJson(responseBody);
    items.addAll(wishListModel.data!);
    return items;
  }

  @override
  Future<List<WIshListItem>> fetchMoreWishList() async {
    var responseBody;
    print("Fetch More Wishlist (before): ${items.length}");

    if (wishListModel.links!.next != null) {
      toast(LocaleKeys.loading.tr());
      responseBody = await handleResponse(await getRequest(
          wishListModel.links!.next.split('api/').last,
          bearerToken: true));

      wishListModel = WishListModel.fromJson(responseBody);
      items.addAll(wishListModel.data!);
      print("Fetch More Wishlist (after): ${items.length}");
      return items;
    } else {
      toast(LocaleKeys.reached_to_the_end.tr());
      return items;
    }
  }

  @override
  Future<void> addToWishList(String? slug, BuildContext context) async {
    var responseBody;
    try {
      responseBody = await handleResponse(
          await getRequest(API.addToWishList(slug), bearerToken: true));

      if (responseBody.runtimeType != int) {
        toast(
          responseBody['message'],
          bgColor: kPrimaryColor,
          textColor: kLightColor,
          gravity: ToastGravity.CENTER,
        );
      } else if (responseBody == 401) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen(
                      needBackButton: true,
                    )));
      }
    } catch (e) {
      throw NetworkException();
    }
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
  }

  @override
  Future<void> removeFromWishList(int? id) async {
    var responseBody;
    try {
      responseBody = await handleResponse(
          await deleteRequest(API.removeFromWishList(id), bearerToken: true));
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
}
