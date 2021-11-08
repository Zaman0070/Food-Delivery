import 'package:zcart/data/models/product/product_model.dart';
import 'package:zcart/data/models/product/product_details_model.dart';
import 'package:zcart/data/models/product/product_variant_details_model.dart';

abstract class IProductRepository {
  Future<ProductDetailsModel> fetchProductDetails(String? slug);
  Future<ProductVariantDetails?> fetchProductVariantDetails(String? slug, requestBody);

  Future<List<ProductList>> fetchProductList(String slug);
  Future<List<ProductList>> fetchMoreProductList();
}

abstract class ILatestItemRepository {
  Future<List<ProductList>?> fetchLatestItems();
}

abstract class IPopularItemRepository {
  Future<List<ProductList>?> fetchPopularItems();
}

abstract class IRandomItemRepository {
  Future<List<ProductList>> fetchRandomItems();

  Future<List<ProductList>> fetchMoreRandomItems();
}

abstract class ITrendingNowRepository {
  Future<List<ProductList>?> fetchTrendingNowItems();
}
