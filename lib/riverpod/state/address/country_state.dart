import 'package:zcart/data/models/address/country_model.dart';

abstract class CountryState {
  const CountryState();
}

class CountryInitialState extends CountryState {
  const CountryInitialState();
}

class CountryLoadingState extends CountryState {
  const CountryLoadingState();
}

class CountryLoadedState extends CountryState {
  final List<Countries>? countryList;

  const CountryLoadedState(this.countryList);
}

class CountryErrorState extends CountryState {
  final String message;

  const CountryErrorState(this.message);
}