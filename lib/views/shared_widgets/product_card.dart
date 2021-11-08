import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:zcart/riverpod/providers/product_slug_list_provider.dart';
import 'package:zcart/riverpod/providers/product_provider.dart';
import 'package:zcart/views/screens/product_details/product_details_screen.dart';
import 'package:zcart/Theme/styles/colors.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductCard extends StatelessWidget {
  ProductCard({required this.productList, this.title});

  final List<dynamic>? productList;
  final String? title;

  @override
  Widget build(BuildContext context) {
    productList!.shuffle();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!,
                style: context.textTheme.headline6!
                    .copyWith(color: kPrimaryFadeTextColor))
            .pOnly(bottom: 10),
        Flexible(
          child: Container(
            color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                ? kDarkCardBgColor
                : kLightColor,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: .85,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: productList!.length > 12 ? 12 : productList!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Expanded(
                            child: Image.network(
                          productList![index].image,
                          fit: BoxFit.fitWidth,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Container(
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                ),
                              ),
                            );
                          },
                        ).pOnly(bottom: 10)),
                        Text(
                          "${productList![index].offerPrice ?? ''}",
                          style: context.textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: EasyDynamicTheme.of(context).themeMode ==
                                    ThemeMode.dark
                                ? kDarkPriceColor
                                : kPriceColor,
                          ),
                        )
                            .pOnly(bottom: 3)
                            .visible(productList![index].hasOffer),
                        Text("${productList![index].price}",
                                style: context.textTheme.subtitle2!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color:
                                      EasyDynamicTheme.of(context).themeMode ==
                                              ThemeMode.dark
                                          ? kDarkPriceColor
                                          : kPriceColor,
                                ))
                            .pOnly(bottom: 3)
                            .visible(!productList![index].hasOffer),
                        Text(
                          "${productList![index].price}",
                          style: context.textTheme.caption!.copyWith(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 10,
                              fontStyle: FontStyle.italic,
                              color: kPrimaryFadeTextColor),
                        ).visible(productList![index].hasOffer),
                      ],
                    ),
                  ).onInkTap(() {
                    context
                        .read(productNotifierProvider.notifier)
                        .getProductDetails(productList![index].slug);
                    context
                        .read(productSlugListProvider.notifier)
                        .addProductSlug(productList![index].slug);
                    context.nextPage(ProductDetailsScreen());
                  });
                }).p(10),
          ).cornerRadius(10),
        ),
      ],
    );
  }
}
