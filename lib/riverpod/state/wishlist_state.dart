import 'package:zcart/data/models/wishlist/wish_list_model.dart';

abstract class WishListState {
  const WishListState();
}

class WishListInitialState extends WishListState {
  const WishListInitialState();
}

class WishListLoadingState extends WishListState {
  const WishListLoadingState();
}

class WishListLoadedState extends WishListState {
  final List<WIshListItem> wishList;

  const WishListLoadedState(this.wishList);
}

class WishListErrorState extends WishListState {
  final String message;

  const WishListErrorState(this.message);
}
