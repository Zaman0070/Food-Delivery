import 'package:zcart/data/models/product/product_model.dart';

abstract class TrendingNowState {
  const TrendingNowState();
}

class TrendingNowInitialState extends TrendingNowState {
  const TrendingNowInitialState();
}

class TrendingNowLoadingState extends TrendingNowState {
  const TrendingNowLoadingState();
}

class TrendingNowLoadedState extends TrendingNowState {
  final List<ProductList>? trendingNowList;

  const TrendingNowLoadedState(this.trendingNowList);
}

class TrendingNowErrorState extends TrendingNowState {
  final String message;

  const TrendingNowErrorState(this.message);
}
