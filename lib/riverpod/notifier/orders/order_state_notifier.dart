import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/data/interface/iOrder_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/order_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class OrdersNotifier extends StateNotifier<OrdersState> {
  final IOrderRepository _iOrderRepository;

  OrdersNotifier(this._iOrderRepository) : super(OrdersInitialState());

  Future orders({bool ignoreLoadingState = false}) async {
    try {
      if (!ignoreLoadingState)
        state = OrdersLoadingState();
      else
        toast(LocaleKeys.please_wait.tr());
      final orderList = await _iOrderRepository.orders();
      state = OrdersLoadedState(orderList);
    } on NetworkException {
      state = OrdersErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class OrderReceivedNotifier extends StateNotifier<OrderReceivedState> {
  final IOrderRepository _iOrderRepository;

  OrderReceivedNotifier(this._iOrderRepository)
      : super(OrderReceivedInitialState());

  Future orderReceived(orderId, {bool ignoreLoadingState = false}) async {
    try {
      if (!ignoreLoadingState) state = OrderReceivedLoadingState();
      await _iOrderRepository.orderReceived(orderId);
      state = OrderReceivedLoadedState();
    } on NetworkException {
      state = OrderReceivedErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
