import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/riverpod/state/product/product_state.dart';
import 'package:zcart/views/screens/tabs/vendors_tab/vendors_details.dart';
import 'package:zcart/Theme/styles/colors.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({required this.productDetailsState});

  final ProductLoadedState productDetailsState;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
          ? kDarkCardBgColor
          : kLightColor,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Image.network(
          productDetailsState.productModel.data!.shop!.image!,
          width: context.screenWidth * 0.15,
          fit: BoxFit.cover,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return Container(
              child: Icon(
                Icons.image_not_supported,
              ),
            );
          },
        ).p(5),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                productDetailsState.productModel.data!.shop!.name!,
                style: context.textTheme.headline6,
              ),
            ),
            Icon(Icons.check_circle, color: kPrimaryColor, size: 15)
                .px2()
                .pOnly(top: 3)
                .onInkTap(() {
              toast(productDetailsState.productModel.data!.shop!.verifiedText);
            })
          ],
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: double.parse(
                  productDetailsState.productModel.data!.shop!.rating ?? '0.0'),
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              ignoreGestures: true,
              unratedColor: kFadeColor,
              itemCount: 5,
              itemSize: 12,
              itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
              itemBuilder: (context, _) =>
                  Icon(Icons.star, color: kPrimaryColor),
              onRatingUpdate: (rating) => print(rating),
            ),
            Text(
              productDetailsState.productModel.data!.shop!.rating ?? '',
              style: context.textTheme.overline,
            ).visible(
                productDetailsState.productModel.data!.shop!.rating != null),
          ],
        ),
        onTap: () {
          context.read(vendorDetailsNotifierProvider.notifier).getVendorDetails(
              productDetailsState.productModel.data!.shop!.slug);
          context.read(vendorItemsNotifierProvider.notifier).getVendorItems(
              productDetailsState.productModel.data!.shop!.slug);
          context.nextPage(VendorsDetailsScreen());
        },
      ),
    ).cornerRadius(10).p(10);
  }
}
