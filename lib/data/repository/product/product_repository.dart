import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/models/product/product_model.dart';
import 'package:zcart/data/models/product/product_details_model.dart';
import 'package:zcart/data/models/product/product_variant_details_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductRepository implements IProductRepository {
  @override
  Future<ProductDetailsModel> fetchProductDetails(String? slug) async {
    var responseBody;
    responseBody =
        await handleResponse(await getRequest(API.productDetails(slug)));
    // responseBody = await handleResponse(await getRequest('https://test.incevio.cloud/api/listing/new-product-for-sale-sku1', noBaseUrl: true));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    ProductDetailsModel productModel =
        ProductDetailsModel.fromJson(responseBody);

    return productModel;
  }

  @override
  Future<ProductVariantDetails?> fetchProductVariantDetails(
      String? slug, requestBody) async {
    var responseBody;
    responseBody = await handleResponse(
        await postRequest(API.productVariantDetails(slug), requestBody));
    /*responseBody =
        await handleResponse(await postRequest('https://test.incevio.cloud/api/variant/new-product-for-sale-sku1', requestBody, noBaseUrl: true));*/
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    ProductVariantDetailsModel productVariantDetailsModel =
        ProductVariantDetailsModel.fromJson(responseBody);
    return productVariantDetailsModel.data;
  }

  /// Product List
  late ProductModel productListModel;
  List<ProductList> productList = [];

  @override
  Future<List<ProductList>> fetchProductList(String slug) async {
    productList.clear();
    var responseBody;
    responseBody =
        await handleResponse(await getRequest(API.productList(slug)));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();
    productListModel = ProductModel.fromJson(responseBody);
    productList.addAll(productListModel.data!);
    return productList;
  }

  @override
  Future<List<ProductList>> fetchMoreProductList() async {
    var responseBody;
    if (productListModel.links!.next != null) {
      toast(LocaleKeys.loading.tr());
      responseBody = await handleResponse(
          await getRequest(productListModel.links!.next!.split('api/').last));
      productListModel = ProductModel.fromJson(responseBody);
      productList.addAll(productListModel.data!);
      return productList;
    } else {
      toast(LocaleKeys.reached_to_the_end.tr());
      return productList;
    }
  }
}
