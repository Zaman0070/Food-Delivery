import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/translations/locale_keys.g.dart';

class VendorsActivityCard extends StatelessWidget {
  final int activeListCount;
  final String rating;
  final int itemsSold;

  VendorsActivityCard(
      {required this.activeListCount,
      required this.rating,
      required this.itemsSold});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
          ? kDarkCardBgColor
          : kLightColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$activeListCount",
                          style: context.textTheme.headline4!),
                      Text(LocaleKeys.activity_listing.tr(),
                          textAlign: TextAlign.center,
                          style: context.textTheme.subtitle2!)
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(rating, style: context.textTheme.headline4!),
                      Text(LocaleKeys.rating.tr(),
                          textAlign: TextAlign.center,
                          style: context.textTheme.subtitle2!)
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$itemsSold", style: context.textTheme.headline4!),
                      Text(LocaleKeys.item_sold.tr(),
                          textAlign: TextAlign.center,
                          style: context.textTheme.subtitle2!)
                    ],
                  )),
            ],
          ).py(10).px(10),
        ],
      ),
    ).cornerRadius(10).p(10);
  }
}
