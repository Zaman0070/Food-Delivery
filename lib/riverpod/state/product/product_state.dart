import 'package:zcart/data/models/product/product_model.dart';
import 'package:zcart/data/models/product/product_details_model.dart';
import 'package:zcart/data/models/product/product_variant_details_model.dart';

/* 
 
*/

abstract class ProductState {
  const ProductState();
}

class ProductInitialState extends ProductState {
  const ProductInitialState();
}

class ProductLoadingState extends ProductState {
  const ProductLoadingState();
}

class ProductLoadedState extends ProductState {
  final ProductDetailsModel productModel;

  const ProductLoadedState(this.productModel);
}

class ProductErrorState extends ProductState {
  final String message;

  const ProductErrorState(this.message);
}

/*
 
*/

abstract class ProductVariantState {
  const ProductVariantState();
}

class ProductVariantInitialState extends ProductVariantState {
  const ProductVariantInitialState();
}

class ProductVariantLoadingState extends ProductVariantState {
  const ProductVariantLoadingState();
}

class ProductVariantLoadedState extends ProductVariantState {
  final ProductVariantDetails? productVariantDetails;

  const ProductVariantLoadedState(this.productVariantDetails);
}

class ProductVariantErrorState extends ProductVariantState {
  final String message;

  const ProductVariantErrorState(this.message);
}
/*

*/

abstract class ProductListState {
  const ProductListState();
}

class ProducListtInitialState extends ProductListState {
  const ProducListtInitialState();
}

class ProductListLoadingState extends ProductListState {
  const ProductListLoadingState();
}

class ProductListLoadedState extends ProductListState {
  final List<ProductList> productList;

  const ProductListLoadedState(this.productList);
}

class ProductListErrorState extends ProductListState {
  final String message;

  const ProductListErrorState(this.message);
}
