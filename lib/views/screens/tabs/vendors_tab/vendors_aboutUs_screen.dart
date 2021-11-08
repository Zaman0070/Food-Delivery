import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/data/models/vendors/vendor_details_model.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'components/vendors_activity_card.dart';
import 'components/vendors_card.dart';

class VendorsAboutUsScreen extends StatelessWidget {
  final VendorDetails? vendorDetails;
  final VoidCallback onPressedContact;

  VendorsAboutUsScreen(
      {required this.vendorDetails, required this.onPressedContact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.about_vendor.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: context.screenHeight * .30,
              width: context.screenWidth,
              child: Image.network(vendorDetails!.bannerImage!, errorBuilder:
                  (BuildContext _, Object error, StackTrace? stack) {
                return Container();
              }, fit: BoxFit.cover),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                VendorCard(
                  logo: vendorDetails!.image,
                  name: vendorDetails!.name,
                  verifiedText: vendorDetails!.verifiedText,
                  isVerified: vendorDetails!.verified,
                  rating: vendorDetails!.rating,
                  trailingEnabled: false,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      tooltip: "Contact Shop",
                      onPressed: onPressedContact,
                      icon: Icon(CupertinoIcons.bubble_left),
                    ),
                  ),
                )
              ],
            ),
            VendorsActivityCard(
              activeListCount: vendorDetails!.activeListingsCount ?? 0,
              rating: vendorDetails!.rating ?? '0',
              itemsSold: vendorDetails!.soldItemCount ?? 0,
            ),
            Container(
              color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                  ? kDarkCardBgColor
                  : kLightColor,
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(LocaleKeys.description.tr(),
                          style: context.textTheme.bodyText2)
                      .py(5),
                  ResponsiveTextWidget(
                      title: vendorDetails!.description,
                      textStyle: context.textTheme.caption!)
                ],
              ),
            ).cornerRadius(10).p(10),
          ],
        ),
      ),
    );
  }
}
