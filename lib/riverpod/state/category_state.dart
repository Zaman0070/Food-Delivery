import 'package:zcart/data/models/categories/category_model.dart';
import 'package:zcart/data/models/categories/category_subgroup_model.dart';
import 'package:zcart/data/models/categories/subgroup_category_model.dart';

abstract class CategoryState {
  const CategoryState();
}

abstract class CategorySubgroupState {
  const CategorySubgroupState();
}

abstract class SubgroupCategoryState {
  const SubgroupCategoryState();
}

/* 
Category
*/

class CategoryInitialState extends CategoryState {
  const CategoryInitialState();
}

class CategoryLoadingState extends CategoryState {
  const CategoryLoadingState();
}

class CategoryLoadedState extends CategoryState {
  final List<CategoryList> categoryList;

  const CategoryLoadedState(this.categoryList);
}

class CategoryErrorState extends CategoryState {
  final String message;

  const CategoryErrorState(this.message);
}

/* 
Category subgroup
*/

class CategorySubgroupInitialState extends CategorySubgroupState {
  const CategorySubgroupInitialState();
}

class CategorySubgroupLoadingState extends CategorySubgroupState {
  const CategorySubgroupLoadingState();
}

class CategorySubgroupLoadedState extends CategorySubgroupState {
  final List<CategorySubgroup>? categorysSubgroupList;

  const CategorySubgroupLoadedState(this.categorysSubgroupList);
}

class CategorySubgroupErrorState extends CategorySubgroupState {
  final String message;

  const CategorySubgroupErrorState(this.message);
}

/* 
Subgroup category 
*/

class SubgroupCategoryInitialState extends SubgroupCategoryState {
  const SubgroupCategoryInitialState();
}

class SubgroupCategoryLoadingState extends SubgroupCategoryState {
  const SubgroupCategoryLoadingState();
}

class SubgroupCategoryLoadedState extends SubgroupCategoryState {
  final List<SubgroupCategory>? subgroupCategoryList;

  const SubgroupCategoryLoadedState(this.subgroupCategoryList);
}

class SubgroupCategoryErrorState extends SubgroupCategoryState {
  final String message;

  const SubgroupCategoryErrorState(this.message);
}
