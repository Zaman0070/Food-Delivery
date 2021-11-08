import 'package:zcart/data/interface/iDeals_repository.dart';
import 'package:zcart/data/models/deals/deals_under_the_price_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class DealsRepository extends IDealsRepository {
  @override
  Future<DealsUnderThePrice> fetchDealsUnderThePrice() async {
    var responseBody =
        await handleResponse(await getRequest(API.dealsUnderThePrice));
    if (responseBody.runtimeType == int) if (responseBody > 206)
      throw NetworkException();

    DealsUnderThePrice dealsUnderThePrice =
        DealsUnderThePrice.fromMap(responseBody);
    return dealsUnderThePrice;
  }
}
