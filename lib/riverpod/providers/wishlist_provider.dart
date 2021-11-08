import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iWishlist_repository.dart';
import 'package:zcart/data/repository/wishlist_repository.dart';
import 'package:zcart/riverpod/notifier/wishlist_state.notifier.dart';
import 'package:zcart/riverpod/state/wishlist_state.dart';

final wishListRepositoryProvider =
    Provider<IWishListRepository>((ref) => WishListRepository());

final wishListNotifierProvider =
    StateNotifierProvider<WishListNotifier, WishListState>(
        (ref) => WishListNotifier(ref.watch(wishListRepositoryProvider)));
