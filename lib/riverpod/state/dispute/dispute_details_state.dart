import 'package:zcart/data/models/dispute/dispute_details_model.dart';

abstract class DisputeDetailsState {
  const DisputeDetailsState();
}

class DisputeDetailsInitialState extends DisputeDetailsState {
  const DisputeDetailsInitialState();
}

class DisputeDetailsLoadingState extends DisputeDetailsState {
  const DisputeDetailsLoadingState();
}

class DisputeDetailsLoadedState extends DisputeDetailsState {
  final DisputeDetails? disputeDetails;

  const DisputeDetailsLoadedState(this.disputeDetails);
}

class DisputeDetailsErrorState extends DisputeDetailsState {
  final String message;

  const DisputeDetailsErrorState(this.message);
}
