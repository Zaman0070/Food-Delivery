import 'package:zcart/data/models/dispute/disputes_model.dart';

abstract class DisputesState {
  const DisputesState();
}

class DisputesInitialState extends DisputesState {
  const DisputesInitialState();
}

class DisputesLoadingState extends DisputesState {
  const DisputesLoadingState();
}

class DisputesLoadedState extends DisputesState {
  final List<Disputes> disputes;

  const DisputesLoadedState(this.disputes);
}

class DisputesErrorState extends DisputesState {
  final String message;

  const DisputesErrorState(this.message);
}
