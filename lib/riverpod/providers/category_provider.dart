import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iCategory_repository.dart';
import 'package:zcart/riverpod/notifier/category_state_notifier.dart';
import 'package:zcart/data/repository/category_repository.dart';
import 'package:zcart/riverpod/state/category_item_state.dart';
import 'package:zcart/riverpod/state/category_state.dart';

final categoryRepositoryProvider =
    Provider<ICategoryRepository>((ref) => CategoryRepository());

final categoryNotifierProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>(
        (ref) => CategoryNotifier(ref.watch(categoryRepositoryProvider)));

final categorySubgroupNotifierProvider =
    StateNotifierProvider<CategorySubgroupNotifier, CategorySubgroupState>(
        (ref) =>
            CategorySubgroupNotifier(ref.watch(categoryRepositoryProvider)));

final subgroupCategoryNotifierProvider =
    StateNotifierProvider<SubgroupCategoryNotifier, SubgroupCategoryState>(
        (ref) =>
            SubgroupCategoryNotifier(ref.watch(categoryRepositoryProvider)));

final categoryItemRepositoryProvider =
    Provider<ICategoryItemRepository>((ref) => CategoryItemRepository());

final categoryItemNotifierProvider =
    StateNotifierProvider<CategoryItemNotifier, CategoryItemState>((ref) =>
        CategoryItemNotifier(ref.watch(categoryItemRepositoryProvider)));
