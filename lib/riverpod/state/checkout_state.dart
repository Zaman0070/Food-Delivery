abstract class CheckoutState {
  const CheckoutState();
}

class CheckoutInitialState extends CheckoutState {
  const CheckoutInitialState();
}

class CheckoutLoadingState extends CheckoutState {
  const CheckoutLoadingState();
}

class CheckoutLoadedState extends CheckoutState {
  const CheckoutLoadedState();
}

class CheckoutErrorState extends CheckoutState {
  final String message;

  const CheckoutErrorState(this.message);
}
