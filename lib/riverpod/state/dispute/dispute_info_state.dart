import 'package:zcart/data/models/dispute/dispute_info_model.dart';

abstract class DisputeInfoState {
  const DisputeInfoState();
}

class DisputeInfoInitialState extends DisputeInfoState {
  const DisputeInfoInitialState();
}

class DisputeInfoLoadingState extends DisputeInfoState {
  const DisputeInfoLoadingState();
}

class DisputeInfoLoadedState extends DisputeInfoState {
  final DisputeInfo? disputeInfo;

  const DisputeInfoLoadedState(this.disputeInfo);
}

class DisputeInfoErrorState extends DisputeInfoState {
  final String message;

  const DisputeInfoErrorState(this.message);
}
