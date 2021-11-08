import 'package:zcart/data/models/banners/banner_model.dart';

abstract class IBannerRepository {
  Future<List<BannerList>?> fetchBanner();
}
