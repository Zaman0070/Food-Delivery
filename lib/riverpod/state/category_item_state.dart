import 'package:zcart/data/models/categories/category_item_model.dart';

abstract class CategoryItemState {
  const CategoryItemState();
}

class CategoryItemInitialState extends CategoryItemState {
  const CategoryItemInitialState();
}

class CategoryItemLoadingState extends CategoryItemState {
  const CategoryItemLoadingState();
}

class CategoryItemLoadedState extends CategoryItemState {
  final List<CategoryItem>? categoryItemList;

  const CategoryItemLoadedState(this.categoryItemList);
}

class CategoryItemErrorState extends CategoryItemState {
  final String message;

  const CategoryItemErrorState(this.message);
}
