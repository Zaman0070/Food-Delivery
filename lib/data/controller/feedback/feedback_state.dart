/*
* Seller Feedback
*/
abstract class SellerFeedbackState {
  const SellerFeedbackState();
}

class SellerFeedbackInitialState extends SellerFeedbackState {
  const SellerFeedbackInitialState();
}

class SellerFeedbackLoadingState extends SellerFeedbackState {
  const SellerFeedbackLoadingState();
}

class SellerFeedbackLoadedState extends SellerFeedbackState {
  const SellerFeedbackLoadedState();
}

class SellerFeedbackErrorState extends SellerFeedbackState {
  final String message;

  const SellerFeedbackErrorState(this.message);
}

/*
* Product Feedback
*/
abstract class ProductFeedbackState {
  const ProductFeedbackState();
}

class ProductFeedbackInitialState extends ProductFeedbackState {
  const ProductFeedbackInitialState();
}

class ProductFeedbackLoadingState extends ProductFeedbackState {
  const ProductFeedbackLoadingState();
}

class ProductFeedbackLoadedState extends ProductFeedbackState {
  const ProductFeedbackLoadedState();
}

class ProductFeedbackErrorState extends ProductFeedbackState {
  final String message;

  const ProductFeedbackErrorState(this.message);
}
