import 'package:zcart/data/models/orders/order_details_model.dart';
import 'package:zcart/data/models/orders/orders_model.dart';

/*
* Orders List
*/
abstract class OrdersState {
  const OrdersState();
}

class OrdersInitialState extends OrdersState {
  const OrdersInitialState();
}

class OrdersLoadingState extends OrdersState {
  const OrdersLoadingState();
}

class OrdersLoadedState extends OrdersState {
  final List<Orders>? orders;

  const OrdersLoadedState(this.orders);
}

class OrdersErrorState extends OrdersState {
  final String message;

  const OrdersErrorState(this.message);
}

/* 
* Order details 
*/
abstract class OrderState {
  const OrderState();
}

class OrderInitialState extends OrderState {
  const OrderInitialState();
}

class OrderLoadingState extends OrderState {
  const OrderLoadingState();
}

class OrderLoadedState extends OrderState {
  final Order? orderDetails;

  const OrderLoadedState(this.orderDetails);
}

class OrderErrorState extends OrderState {
  final String message;

  const OrderErrorState(this.message);
}

/*
* Order Received
*/
abstract class OrderReceivedState {
  const OrderReceivedState();
}

class OrderReceivedInitialState extends OrderReceivedState {
  const OrderReceivedInitialState();
}

class OrderReceivedLoadingState extends OrderReceivedState {
  const OrderReceivedLoadingState();
}

class OrderReceivedLoadedState extends OrderReceivedState {
  const OrderReceivedLoadedState();
}

class OrderReceivedErrorState extends OrderReceivedState {
  final String message;

  const OrderReceivedErrorState(this.message);
}
