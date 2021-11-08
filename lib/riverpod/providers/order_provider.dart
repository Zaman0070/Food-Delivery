import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iOrder_repository.dart';
import 'package:zcart/data/repository/order_repository.dart';
import 'package:zcart/riverpod/notifier/orders/order_details_state_notifier.dart';
import 'package:zcart/riverpod/notifier/orders/order_state_notifier.dart';
import 'package:zcart/riverpod/state/order_state.dart';

final orderRepositoryProvider =
    Provider<IOrderRepository>((ref) => OrderRepository());

final ordersProvider = StateNotifierProvider<OrdersNotifier, OrdersState>(
    (ref) => OrdersNotifier(ref.watch(orderRepositoryProvider)));
final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>(
    (ref) => OrderNotifier(ref.watch(orderRepositoryProvider)));
final orderReceivedProvider =
    StateNotifierProvider<OrderReceivedNotifier, OrderReceivedState>(
        (ref) => OrderReceivedNotifier(ref.watch(orderRepositoryProvider)));
