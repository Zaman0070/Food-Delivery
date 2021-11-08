import 'package:zcart/data/models/categories/subgroup_category_model.dart';
import 'package:zcart/data/models/categories/category_model.dart';
import 'package:zcart/data/models/categories/category_subgroup_model.dart';
import 'package:zcart/data/models/categories/category_item_model.dart';

abstract class ICategoryRepository {
  Future<List<CategoryList>?> fetchCategory();
  Future<List<CategorySubgroup>?> fetchCategorySubgroupList(String categoryID);
  Future<List<SubgroupCategory>?> fetchSubgroupCategoryList(String subgroupID);
}

abstract class ICategoryItemRepository {
  Future<List<CategoryItem>?> fetchCategoryItemList(String? slug);
}
