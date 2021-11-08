import 'package:zcart/data/models/deals/deals_under_the_price_model.dart';

/// Brand List State
abstract class DealsUnderThePriceState {
  const DealsUnderThePriceState();
}

class DealsUnderThePriceStateInitialState extends DealsUnderThePriceState {
  const DealsUnderThePriceStateInitialState();
}

class DealsUnderThePriceStateLoadingState extends DealsUnderThePriceState {
  const DealsUnderThePriceStateLoadingState();
}

class DealsUnderThePriceStateLoadedState extends DealsUnderThePriceState {
  final DealsUnderThePrice? dealsUnderThePrice;

  const DealsUnderThePriceStateLoadedState(this.dealsUnderThePrice);
}

class DealsUnderThePriceStateErrorState extends DealsUnderThePriceState {
  final String message;

  const DealsUnderThePriceStateErrorState(this.message);
}
