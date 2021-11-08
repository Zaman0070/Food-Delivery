import 'package:zcart/data/models/banners/banner_model.dart';

abstract class BannerState {
  const BannerState();
}

class BannerInitialState extends BannerState {
  const BannerInitialState();
}

class BannerLoadingState extends BannerState {
  const BannerLoadingState();
}

class BannerLoadedState extends BannerState {
  final List<BannerList>? bannerList;

  const BannerLoadedState(this.bannerList);
}

class BannerErrorState extends BannerState {
  final String message;

  const BannerErrorState(this.message);
}
