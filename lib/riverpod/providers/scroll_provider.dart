import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/riverpod/notifier/scroll_state_notifier.dart';
import 'package:zcart/riverpod/state/scroll_state.dart';

final randomItemScrollNotifierProvider =
    StateNotifierProvider<RandomItemScrollNotifier, ScrollState>(
        (ref) => RandomItemScrollNotifier());
final vendorItemScrollNotifierProvider =
    StateNotifierProvider<VendorItemScrollNotifier, ScrollState>(
        (ref) => VendorItemScrollNotifier());
final categoryDetailsScrollNotifierProvider =
    StateNotifierProvider<CategoryDetailsScrollNotifier, ScrollState>(
        (ref) => CategoryDetailsScrollNotifier());
final disputesScrollNotifierProvider =
    StateNotifierProvider<DisputesScrollNotifier, ScrollState>(
        (ref) => DisputesScrollNotifier());
final wishlistScrollNotifierProvider =
    StateNotifierProvider<WishListScrollNotifier, ScrollState>(
        (ref) => WishListScrollNotifier());
