import 'package:zcart/data/interface/iCategory_repository.dart';
import 'package:zcart/data/models/categories/subgroup_category_model.dart';
import 'package:zcart/data/models/categories/category_model.dart';
import 'package:zcart/data/models/categories/category_subgroup_model.dart';
import 'package:zcart/data/models/categories/category_item_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class CategoryRepository implements ICategoryRepository {
  @override
  Future<List<CategoryList>?> fetchCategory() async {
    var responseBody = await handleResponse(await getRequest(API.category));
    if (responseBody.runtimeType == int) {
      if (responseBody > 206) {
        throw NetworkException();
      }
    }
    CategoryModel categoryModel = CategoryModel.fromJson(responseBody);
    return categoryModel.data;
  }

  @override
  Future<List<CategorySubgroup>?> fetchCategorySubgroupList(
      String categoryID) async {
    var responseBody = await handleResponse(
        await getRequest(API.categorySubgroup(categoryID)));
    if (responseBody.runtimeType == int) {
      if (responseBody > 206) {
        throw NetworkException();
      }
    }

    CategorySubGroupModel categorySubGroupModel =
        CategorySubGroupModel.fromJson(responseBody);
    return categorySubGroupModel.data;
  }

  @override
  Future<List<SubgroupCategory>?> fetchSubgroupCategoryList(
      String subgroupID) async {
    var responseBody = await handleResponse(
        await getRequest(API.subgroupCategory(subgroupID)));
    if (responseBody.runtimeType == int) {
      if (responseBody > 206) {
        throw NetworkException();
      }
    }
    SubgroupCategoryModel subgroupCategoryModel =
        SubgroupCategoryModel.fromJson(responseBody);
    return subgroupCategoryModel.data;
  }
}

class CategoryItemRepository implements ICategoryItemRepository {
  @override
  Future<List<CategoryItem>?> fetchCategoryItemList(String? slug) async {
    var responseBody =
        await handleResponse(await getRequest(API.categoryItem(slug)));
    if (responseBody.runtimeType == int) {
      if (responseBody > 206) {
        throw NetworkException();
      }
    }
    CategoryItemModel categoryItemModel =
        CategoryItemModel.fromJson(responseBody);
    return categoryItemModel.data;
  }
}
