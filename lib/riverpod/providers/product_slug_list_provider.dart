import 'package:flutter_riverpod/flutter_riverpod.dart';

final productSlugListProvider =
    StateNotifierProvider<ProductSlugListNotifier, List<String?>>(
        (ref) => ProductSlugListNotifier());

class ProductSlugListNotifier extends StateNotifier<List<String?>> {
  ProductSlugListNotifier() : super([]);

  addProductSlug(String? slug) {
    state.add(slug);
    print("Addition: $state");
  }

  removeProductSlug() {
    state.removeLast();
    print("Remove: $state");
  }
}
