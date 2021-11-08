import 'package:zcart/data/models/product/product_model.dart';

abstract class PopularItemState {
  const PopularItemState();
}

class PopularItemInitialState extends PopularItemState {
  const PopularItemInitialState();
}

class PopularItemLoadingState extends PopularItemState {
  const PopularItemLoadingState();
}

class PopularItemLoadedState extends PopularItemState {
  final List<ProductList>? popularItemList;

  const PopularItemLoadedState(this.popularItemList);
}

class PopularItemErrorState extends PopularItemState {
  final String message;

  const PopularItemErrorState(this.message);
}
