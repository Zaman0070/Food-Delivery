import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/models/product/product_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class PopularItemRepository implements IPopularItemRepository {
  @override
  Future<List<ProductList>?> fetchPopularItems() async {
    var responseBody = await handleResponse(await getRequest(API.popular));
    if (responseBody.runtimeType == int) if (responseBody > 206) throw NetworkException();
    ProductModel popularItemModel = ProductModel.fromJson(responseBody);
    return popularItemModel.data;
  }
}
