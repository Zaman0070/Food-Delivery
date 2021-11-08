abstract class OpenDisputeState {
  const OpenDisputeState();
}

class OpenDisputeInitialState extends OpenDisputeState {
  const OpenDisputeInitialState();
}

class OpenDisputeLoadingState extends OpenDisputeState {
  const OpenDisputeLoadingState();
}

class OpenDisputeLoadedState extends OpenDisputeState {
  const OpenDisputeLoadedState();
}

class OpenDisputeErrorState extends OpenDisputeState {
  final String message;

  const OpenDisputeErrorState(this.message);
}
