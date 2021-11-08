import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/repository/product/latest_item_repository.dart';
import 'package:zcart/riverpod/notifier/product/latest_item_state_notifier.dart';
import 'package:zcart/riverpod/state/product/latest_item_state.dart';

final latestItemRepositoryProvider =
    Provider<ILatestItemRepository>((ref) => LatestItemRepository());

final latestItemNotifierProvider =
    StateNotifierProvider<LatestItemNotifier, LatestItemState>(
        (ref) => LatestItemNotifier(ref.watch(latestItemRepositoryProvider)));
