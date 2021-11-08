import 'package:zcart/data/models/offers/offers_model.dart';

abstract class OffersState {
  const OffersState();
}

class OffersInitialState extends OffersState {
  const OffersInitialState();
}

class OffersLoadingState extends OffersState {
  const OffersLoadingState();
}

class OffersLoadedState extends OffersState {
  final OffersModel offersModel;

  const OffersLoadedState(this.offersModel);
}

class OffersErrorState extends OffersState {
  final String message;

  const OffersErrorState(this.message);
}
