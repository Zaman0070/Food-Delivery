import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/helper/images.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/tabs/home_tab/search/search_screen.dart';

class CustomSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(4),
          child: Image.asset(
            'assets/images/splash.png',
            height: 80,
            width: 120,
            fit: BoxFit.cover,
          ),
        ).pOnly(left: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: 180,
          height: 35,
          child: GestureDetector(
            onTap: () => context.nextPage(SearchScreen()),
            child: Container(
              decoration: customBoxDecoration.copyWith(
                color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                    ? kDarkCardBgColor
                    : kDarkCardBgColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        CupertinoIcons.search,
                        size: 14,
                        color: kFadeColor,
                      ),
                      Text(
                        LocaleKeys.search_keyword.tr(),
                        style: context.textTheme.caption!
                            .copyWith(color: kPrimaryFadeTextColor),
                      ).px(5),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

var customBoxDecoration = BoxDecoration(
  color: kLightColor,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
        blurRadius: 20,
        color: kDarkColor.withOpacity(0.1),
        spreadRadius: 3,
        offset: Offset(1, 1)),
  ],
);
