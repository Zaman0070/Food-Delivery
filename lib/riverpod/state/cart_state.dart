import 'package:zcart/data/models/cart/cart_item_details_model.dart';
import 'package:zcart/data/models/cart/cart_model.dart';

abstract class CartState {
  const CartState();
}

class CartInitialState extends CartState {
  const CartInitialState();
}

class CartLoadingState extends CartState {
  const CartLoadingState();
}

class CartLoadedState extends CartState {
  final List<CartItem>? cartList;

  const CartLoadedState(this.cartList);
}

class CartErrorState extends CartState {
  final String message;

  const CartErrorState(this.message);
}

abstract class CartItemDetailsState {
  const CartItemDetailsState();
}

class CartItemDetailsInitialState extends CartItemDetailsState {
  const CartItemDetailsInitialState();
}

class CartItemDetailsLoadingState extends CartItemDetailsState {
  const CartItemDetailsLoadingState();
}

class CartItemDetailsLoadedState extends CartItemDetailsState {
  final CartItemDetails? cartItemDetails;

  const CartItemDetailsLoadedState(this.cartItemDetails);
}

class CartItemDetailsErrorState extends CartItemDetailsState {
  final String message;

  const CartItemDetailsErrorState(this.message);
}
