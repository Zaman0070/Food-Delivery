import 'package:flutter/material.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';

Future<dynamic> addToCartBottomSheet(BuildContext context, responseBody) async {
  return await showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        height: 180,
        decoration: BoxDecoration(
            color: kDarkColor.withOpacity(0.8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              responseBody["message"],
              textAlign: TextAlign.center,
              style: context.textTheme.subtitle2!.copyWith(
                color: kPrimaryLightTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .nextAndRemoveUntilPage(BottomNavBar(selectedIndex: 3));
                },
                child: Text(LocaleKeys.view_cart.tr())),
            ElevatedButton(
                onPressed: () {
                  context.pop();
                  context.pop();
                },
                child: Text(LocaleKeys.continue_shopping.tr()))
          ],
        ),
      );
    },
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
  );
}
