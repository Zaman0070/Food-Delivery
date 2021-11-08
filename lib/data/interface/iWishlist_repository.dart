import 'package:flutter/cupertino.dart';
import 'package:zcart/data/models/wishlist/wish_list_model.dart';

abstract class IWishListRepository {
  Future<List<WIshListItem>> fetchWishList();

  Future<List<WIshListItem>> fetchMoreWishList();

  Future<void> addToWishList(String? slug, BuildContext context);

  Future<void> removeFromWishList(int? id);
}
