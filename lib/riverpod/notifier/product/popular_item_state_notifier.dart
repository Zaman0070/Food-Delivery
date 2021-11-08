import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/product/popular_item_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class PopularItemNotifier extends StateNotifier<PopularItemState> {
  final IPopularItemRepository _iPopularItemRepository;

  PopularItemNotifier(this._iPopularItemRepository)
      : super(PopularItemInitialState());

  Future<void> getLatestItem() async {
    try {
      state = PopularItemLoadingState();
      final popularItems = await _iPopularItemRepository.fetchPopularItems();
      state = PopularItemLoadedState(popularItems);
    } on NetworkException {
      state = PopularItemErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
