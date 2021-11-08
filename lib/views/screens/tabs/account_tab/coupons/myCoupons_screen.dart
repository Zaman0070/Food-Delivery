import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/data/controller/cart/coupon_controller.dart';
import 'package:zcart/data/controller/cart/coupon_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/loading_widget.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/services.dart';

class MyCouponsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final couponState = watch(couponsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.coupons.tr()),
      ),
      body: RefreshIndicator(
          onRefresh: () => context.read(couponsProvider.notifier).coupons(),
          child: couponState is CouponLoadedState
              ? couponState.coupon!.length != 0
                  ? ListView.builder(
                      itemCount: couponState.coupon!.length,
                      itemBuilder: (context, index) {
                        return CouponsCard(
                          amount: couponState.coupon![index].amount,
                          shopTitle: couponState.coupon![index].shop!.name,
                          shopImage: couponState.coupon![index].shop!.image,
                          code: couponState.coupon![index].code,
                          notice: couponState.coupon![index].validity,
                        );
                      })
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.info_outline).pOnly(bottom: 10),
                          Text(LocaleKeys.coupons_not_available.tr()),
                        ],
                      ),
                    )
              : couponState is CouponLoadingState
                  ? LoadingWidget()
                  : Container()),
    );
  }
}

class CouponsCard extends StatelessWidget {
  final String? amount;
  final String? shopTitle;
  final String? shopImage;
  final String? code;
  final String? notice;

  CouponsCard(
      {this.amount, this.shopTitle, this.shopImage, this.code, this.notice});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [kGradientColor1, kGradientColor2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.only(top: 24, bottom: 16, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Redeem Code",
                    style: context.textTheme.subtitle2!.copyWith(
                      color: kPrimaryLightTextColor,
                    ),
                  ).py(5),
                  Text(
                    code!,
                    style: context.textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: kPrimaryLightTextColor,
                    ),
                  ).onInkTap(() {
                    Clipboard.setData(new ClipboardData(text: code))
                        .then((value) => toast('Code is copied to clipboard'));
                  }),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: kLightColor,
                          width: 2,
                        )),
                    child: Text(
                      amount!,
                      style: context.textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: kPrimaryLightTextColor,
                      ),
                    ),
                  ),
                  Text(
                    shopTitle!,
                    style: context.textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryLightTextColor,
                    ),
                  ).py(5)
                ],
              ),
            ],
          ),
          Text(
            notice!,
            style: context.textTheme.caption!.copyWith(
              color: kPrimaryLightTextColor,
            ),
          ).pOnly(left: 16, top: 8),
        ],
      ),
    );
  }
}
