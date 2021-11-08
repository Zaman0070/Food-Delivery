import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/models/product/product_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class TrendingNowRepository implements ITrendingNowRepository {
  @override
  Future<List<ProductList>?> fetchTrendingNowItems() async {
    var responseBody = await handleResponse(await getRequest(API.trending));
    if (responseBody.runtimeType == int) if (responseBody > 206) throw NetworkException();

    ProductModel productModel = ProductModel.fromJson(responseBody);
    return productModel.data;
  }
}
