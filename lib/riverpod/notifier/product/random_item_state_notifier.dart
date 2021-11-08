import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/product/random_item_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class RandomItemNotifier extends StateNotifier<RandomItemState> {
  final IRandomItemRepository _iRandomItemRepository;

  RandomItemNotifier(this._iRandomItemRepository)
      : super(RandomItemInitialState());

  Future<void> getRandomItems() async {
    try {
      state = RandomItemLoadingState();
      final randomItemList = await _iRandomItemRepository.fetchRandomItems();
      state = RandomItemLoadedState(randomItemList);
    } on NetworkException {
      state = RandomItemErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }

  Future<void> getMoreRandomItems() async {
    try {
      //state = RandomMoreItemLoadingState();
      final randomItemList =
          await _iRandomItemRepository.fetchMoreRandomItems();
      state = RandomItemLoadedState(randomItemList);
    } on NetworkException {
      state = RandomItemErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
