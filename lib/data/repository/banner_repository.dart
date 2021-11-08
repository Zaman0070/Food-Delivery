import 'package:zcart/data/interface/iBanner_repository.dart';
import 'package:zcart/data/models/banners/banner_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

class BannerRepository implements IBannerRepository {
  @override
  Future<List<BannerList>?> fetchBanner() async {
    var responseBody = await handleResponse(await getRequest(API.banner));
    if (responseBody.runtimeType == int) if (responseBody > 206) throw NetworkException();

    BannerModel bannerModel = BannerModel.fromJson(responseBody);
    return bannerModel.data;
  }
}
