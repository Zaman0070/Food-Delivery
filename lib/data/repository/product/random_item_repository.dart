import 'package:zcart/data/interface/iProduct_repository.dart';
import 'package:zcart/data/models/product/product_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class RandomItemRepository implements IRandomItemRepository {
  late ProductModel randomItemModel;
  List<ProductList> randomItemList = [];

  @override
  Future<List<ProductList>> fetchRandomItems() async {
    randomItemList.clear();

    var responseBody = await handleResponse(await getRequest(API.random));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    randomItemModel = ProductModel.fromJson(responseBody);
    randomItemList.addAll(randomItemModel.data!);
    return randomItemList;
  }

  @override
  Future<List<ProductList>> fetchMoreRandomItems() async {
    var responseBody;
    print("fetchMoreRandomItems (before): ${randomItemList.length}");

    if (randomItemModel.links!.next != null) {
      toast(LocaleKeys.loading.tr());
      responseBody = await handleResponse(
          await getRequest(randomItemModel.links!.next!.split('api/').last));

      randomItemModel = ProductModel.fromJson(responseBody);
      randomItemList.addAll(randomItemModel.data!);
      print("fetchMoreRandomItems (after): ${randomItemList.length}");
      return randomItemList;
    } else {
      toast(LocaleKeys.reached_to_the_end.tr());
      return randomItemList;
    }
  }
}
