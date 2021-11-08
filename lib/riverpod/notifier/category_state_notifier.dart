import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iCategory_repository.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/riverpod/state/category_item_state.dart';
import 'package:zcart/riverpod/state/category_state.dart';
import 'package:zcart/data/models/categories/category_model.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  final ICategoryRepository _iCategoryRepository;

  CategoryNotifier(this._iCategoryRepository) : super(CategoryInitialState());

  Future<void> getCategory() async {
    try {
      state = CategoryLoadingState();
      final category = await (_iCategoryRepository.fetchCategory());

      category!.insert(
          0, CategoryList.fromJson({"name": LocaleKeys.all_categories.tr()}));
      state = CategoryLoadedState(category);
    } on NetworkException {
      state = CategoryErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class CategorySubgroupNotifier extends StateNotifier<CategorySubgroupState> {
  final ICategoryRepository _iCategoryRepository;

  CategorySubgroupNotifier(this._iCategoryRepository)
      : super(CategorySubgroupInitialState());

  int? _selectedSubgroup;

  get getSelectedSubgroup => _selectedSubgroup;

  set setSelectedSubgroup(value) {
    _selectedSubgroup = value;
  }

  resetState() {
    state = CategorySubgroupInitialState();
    _selectedSubgroup = null;
  }

  Future<void> getCategorySubgroup(String categoryID) async {
    resetState();
    try {
      state = CategorySubgroupLoadingState();
      final categorySubgroupList =
          await _iCategoryRepository.fetchCategorySubgroupList(categoryID);
      state = CategorySubgroupLoadedState(categorySubgroupList);
    } on NetworkException {
      state = CategorySubgroupErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class SubgroupCategoryNotifier extends StateNotifier<SubgroupCategoryState> {
  final ICategoryRepository _iCategoryRepository;

  SubgroupCategoryNotifier(this._iCategoryRepository)
      : super(SubgroupCategoryInitialState());

  int? _selectedSubgroupCategory;

  get getSelectedSubgroupCategory => _selectedSubgroupCategory;

  set setSelectedSubgroupCategory(value) {
    _selectedSubgroupCategory = value;
  }

  resetState() {
    state = SubgroupCategoryInitialState();
    _selectedSubgroupCategory = null;
  }

  Future<void> getSubgroupCategory(String subgroupID) async {
    resetState();
    try {
      state = SubgroupCategoryLoadingState();
      final subgroupCategoryList =
          await _iCategoryRepository.fetchSubgroupCategoryList(subgroupID);
      state = SubgroupCategoryLoadedState(subgroupCategoryList);
    } on NetworkException {
      state = SubgroupCategoryErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}

class CategoryItemNotifier extends StateNotifier<CategoryItemState> {
  final ICategoryItemRepository _iCategoryItemRepository;

  CategoryItemNotifier(this._iCategoryItemRepository)
      : super(CategoryItemInitialState());

  Future<void> getCategoryItem(String? slug) async {
    try {
      state = CategoryItemLoadingState();
      final categoryItemList =
          await _iCategoryItemRepository.fetchCategoryItemList(slug);
      state = CategoryItemLoadedState(categoryItemList);
    } on NetworkException {
      state = CategoryItemErrorState(LocaleKeys.something_went_wrong.tr());
    }
  }
}
