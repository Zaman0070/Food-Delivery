import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/models/product/product_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class LatestItemRepository implements ILatestItemRepository {
  @override
  Future<List<ProductList>?> fetchLatestItems() async {
    var responseBody = await handleResponse(await getRequest(API.latest));
    if (responseBody.runtimeType == int) if (responseBody > 206) throw NetworkException();

    ProductModel latestItemModel = ProductModel.fromJson(responseBody);
    return latestItemModel.data;
  }
}
