import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iDeals_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/deals_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class DealsUnderThePriceNotifier
    extends StateNotifier<DealsUnderThePriceState> {
  final IDealsRepository _iDealsRepository;

  DealsUnderThePriceNotifier(this._iDealsRepository)
      : super(DealsUnderThePriceStateInitialState());

  Future<void> getAllDealsUnderThePrice() async {
    try {
      state = DealsUnderThePriceStateLoadingState();
      final deals = await _iDealsRepository.fetchDealsUnderThePrice();
      state = DealsUnderThePriceStateLoadedState(deals);
    } on NetworkException {
      state = DealsUnderThePriceStateErrorState(
          LocaleKeys.something_went_wrong.tr());
    }
  }
}
