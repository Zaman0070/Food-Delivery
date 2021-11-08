import 'package:zcart/data/models/product/product_model.dart';

abstract class LatestItemState {
  const LatestItemState();
}

class LatestItemInitialState extends LatestItemState {
  const LatestItemInitialState();
}

class LatestItemLoadingState extends LatestItemState {
  const LatestItemLoadingState();
}

class LatestItemLoadedState extends LatestItemState {
  final List<ProductList>? latestItemList;

  const LatestItemLoadedState(this.latestItemList);
}

class LatestItemErrorState extends LatestItemState {
  final String message;

  const LatestItemErrorState(this.message);
}
