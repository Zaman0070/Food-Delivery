import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class TrendingNowNotifier extends StateNotifier<TrendingNowState> {
  final ITrendingNowRepository _iTrendingNowRepository;

  TrendingNowNotifier(this._iTrendingNowRepository)
      : super(TrendingNowInitialState());

  Future<void> getTrendingNowItems() async {
    try {
      state = TrendingNowLoadingState();
      final trendingNow = await _iTrendingNowRepository.fetchTrendingNowItems();
      state = TrendingNowLoadedState(trendingNow);
    } on NetworkException {
      state = TrendingNowErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
