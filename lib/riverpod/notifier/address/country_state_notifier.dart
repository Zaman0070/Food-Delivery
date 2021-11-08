import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iAddress_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/address/country_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class CountryNotifier extends StateNotifier<CountryState> {
  final IAddressRepository _iAddressRepository;

  CountryNotifier(this._iAddressRepository) : super(CountryInitialState());

  Future getCountries() async {
    try {
      state = CountryLoadingState();
      final countries = await _iAddressRepository.fetchCountries();
      state = CountryLoadedState(countries);
    } on NetworkException {
      state = CountryErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
