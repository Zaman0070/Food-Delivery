import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iOffers_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/offers_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OffersNotifier extends StateNotifier<OffersState> {
  final IOffersRepository _iOffersRepository;

  OffersNotifier(this._iOffersRepository) : super(OffersInitialState());

  Future<void> getOffersFromOtherSellers(String? slug) async {
    try {
      state = OffersLoadingState();
      final offers = await _iOffersRepository.fetchOffersFromOtherSellers(slug);
      state = OffersLoadedState(offers);
    } on NetworkException {
      state = OffersErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
