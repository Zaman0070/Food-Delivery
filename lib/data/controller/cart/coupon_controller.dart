import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/controller/cart/coupon_state.dart';
import 'package:zcart/data/models/cart/coupon_model.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/data/network/network_exception.dart';
import 'package:zcart/data/network/network_utils.dart';

/*Provider*/
final couponsProvider = StateNotifierProvider<CouponRepository, CouponState>(
    (ref) => CouponRepository());
final applyCouponProvider =
    StateNotifierProvider<ApplyCouponRepository, ApplyCouponState>(
        (ref) => ApplyCouponRepository());

/*Repository & Notifier class Combined*/
class CouponRepository extends StateNotifier<CouponState> {
  CouponRepository() : super(CouponInitialState());

  Future coupons() async {
    state = CouponLoadingState();
    print(state);
    var responseBody;
    try {
      responseBody = await handleResponse(
          await getRequest(API.coupons, bearerToken: true));
      if (responseBody is int) if (responseBody > 206) throw NetworkException();
      CouponModel couponModel = CouponModel.fromJson(responseBody);

      state = CouponLoadedState(couponModel.data);
    } on NetworkException {
      state = CouponErrorState("Failed to fetch coupon data!");
    }
  }
}

class ApplyCouponRepository extends StateNotifier<ApplyCouponState> {
  ApplyCouponRepository() : super(ApplyCouponInitialState());

  Future applyCoupon(cartId, coupon) async {
    state = ApplyCouponLoadingState();
    var responseBody;
    try {
      responseBody = await handleResponse(await postRequest(
          API.applyCoupon(cartId, coupon), {},
          bearerToken: true));
      if (responseBody is int) if (responseBody > 206) throw NetworkException();
      state = ApplyCouponLoadedState();
    } on NetworkException {
      state = ApplyCouponErrorState("Failed to apply coupon!");
    }
  }
}
