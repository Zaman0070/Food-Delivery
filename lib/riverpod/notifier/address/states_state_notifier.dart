import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/interface/iAddress_repository.dart';
import 'package:zcart/riverpod/state/address/states_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class StatesNotifier extends StateNotifier<StatesState> {
  final IAddressRepository _iAddressRepository;

  StatesNotifier(this._iAddressRepository) : super(StatesInitialState());

  resetState() {
    state = StatesInitialState();
  }

  Future getState(int? countryId) async {
    try {
      state = StatesLoadingState();
      final states = await _iAddressRepository.fetchStates(countryId);
      state = StatesLoadedState(states);
    } on NetworkException {
      state = StatesErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
