import 'package:zcart/data/models/cart/coupon_model.dart';

abstract class CouponState {
  const CouponState();
}

class CouponInitialState extends CouponState {
  const CouponInitialState();
}

class CouponLoadingState extends CouponState {
  const CouponLoadingState();
}

class CouponLoadedState extends CouponState {
  final List<Coupon>? coupon;

  const CouponLoadedState(this.coupon);
}

class CouponErrorState extends CouponState {
  final String message;

  const CouponErrorState(this.message);
}

abstract class ApplyCouponState {
  const ApplyCouponState();
}

class ApplyCouponInitialState extends ApplyCouponState {
  const ApplyCouponInitialState();
}

class ApplyCouponLoadingState extends ApplyCouponState {
  const ApplyCouponLoadingState();
}

class ApplyCouponLoadedState extends ApplyCouponState {
  const ApplyCouponLoadedState();
}

class ApplyCouponErrorState extends ApplyCouponState {
  final String message;

  const ApplyCouponErrorState(this.message);
}
