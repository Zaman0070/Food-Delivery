import 'package:zcart/data/models/product/product_model.dart';

abstract class RandomItemState {
  const RandomItemState();
}

class RandomItemInitialState extends RandomItemState {
  const RandomItemInitialState();
}

class RandomItemLoadingState extends RandomItemState {
  const RandomItemLoadingState();
}

class RandomMoreItemLoadingState extends RandomItemState {
  const RandomMoreItemLoadingState();
}

class RandomItemLoadedState extends RandomItemState {
  final List<ProductList> randomItemList;

  const RandomItemLoadedState(this.randomItemList);
}

class RandomItemErrorState extends RandomItemState {
  final String message;

  const RandomItemErrorState(this.message);
}
