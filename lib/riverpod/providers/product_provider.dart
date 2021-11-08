import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/repository/product/product_repository.dart';
import 'package:zcart/riverpod/notifier/product/product_state_notifier.dart';
import 'package:zcart/riverpod/state/product/product_state.dart';

final productRepositoryProvider =
    Provider<IProductRepository>((ref) => ProductRepository());

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>(
        (ref) => ProductNotifier(ref.watch(productRepositoryProvider)));
final productVariantNotifierProvider =
    StateNotifierProvider<ProductVariantNotifier, ProductVariantState>(
        (ref) => ProductVariantNotifier(ref.watch(productRepositoryProvider)));
final productListNotifierProvider =
    StateNotifierProvider<ProductListNotifier, ProductListState>(
        (ref) => ProductListNotifier(ref.watch(productRepositoryProvider)));
