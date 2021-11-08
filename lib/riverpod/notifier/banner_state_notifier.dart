import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iBanner_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/banner_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class BannerNotifier extends StateNotifier<BannerState> {
  final IBannerRepository _iBannerRepository;

  BannerNotifier(this._iBannerRepository) : super(BannerInitialState());

  Future<void> getBanner() async {
    try {
      state = BannerLoadingState();
      final banner = await _iBannerRepository.fetchBanner();
      state = BannerLoadedState(banner);
    } on NetworkException {
      state = BannerErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
