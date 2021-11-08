import 'package:zcart/data/models/address/states_model.dart';

abstract class StatesState {
  const StatesState();
}

class StatesInitialState extends StatesState {
  const StatesInitialState();
}

class StatesLoadingState extends StatesState {
  const StatesLoadingState();
}

class StatesLoadedState extends StatesState {
  final List<States>? statesList;

  const StatesLoadedState(this.statesList);
}

class StatesErrorState extends StatesState {
  final String message;

  const StatesErrorState(this.message);
}
