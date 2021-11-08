import 'package:zcart/data/interface/iOffers_repository.dart';
import 'package:zcart/data/models/offers/offers_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class OffersRepository implements IOffersRepository {
  @override
  Future<OffersModel> fetchOffersFromOtherSellers(String? slug) async {
    var responseBody;
    responseBody = await handleResponse(await getRequest(API.offersFromOtherSeller(slug)));
    if (responseBody.runtimeType == int) if (responseBody > 206) throw NetworkException();
    OffersModel offersModel = OffersModel.fromJson(responseBody);
    return offersModel;
  }
}
