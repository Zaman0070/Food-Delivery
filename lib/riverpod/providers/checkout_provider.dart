import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iCheckout_repository.dart';
import 'package:zcart/data/repository/checkout_repository.dart';
import 'package:zcart/riverpod/notifier/checkout_state_notifier.dart';
import 'package:zcart/riverpod/state/checkout_state.dart';

final checkoutRepositoryProvider =
    Provider<ICheckoutRepository>((ref) => CheckoutRepository());

final checkoutNotifierProvider =
    StateNotifierProvider<CheckoutNotifier, CheckoutState>(
        (ref) => CheckoutNotifier(ref.watch(checkoutRepositoryProvider)));
