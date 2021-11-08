import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/repository/product/random_item_repository.dart';
import 'package:zcart/riverpod/notifier/product/random_item_state_notifier.dart';
import 'package:zcart/riverpod/state/product/random_item_state.dart';

final randomItemRepositoryProvider =
    Provider<IRandomItemRepository>((ref) => RandomItemRepository());

final randomItemNotifierProvider =
    StateNotifierProvider<RandomItemNotifier, RandomItemState>(
        (ref) => RandomItemNotifier(ref.watch(randomItemRepositoryProvider)));
