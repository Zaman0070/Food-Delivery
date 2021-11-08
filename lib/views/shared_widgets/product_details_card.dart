import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zcart/data/models/product/product_details_model.dart';
import 'package:zcart/riverpod/providers/product_slug_list_provider.dart';
import 'package:zcart/riverpod/providers/product_provider.dart';
import 'package:zcart/views/screens/product_details/product_details_screen.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailsCard extends StatelessWidget {
  final List<dynamic>? productList;
  final String? title;
  final bool isTitleCentered;

  const ProductDetailsCard(
      {this.productList, this.title, this.isTitleCentered = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        title == null
            ? Container()
            : Text(title!,
                    textAlign:
                        isTitleCentered ? TextAlign.center : TextAlign.left,
                    style: context.textTheme.headline6!
                        .copyWith(color: kPrimaryFadeTextColor))
                .pOnly(bottom: 5),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: productList!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context
                      .read(productNotifierProvider.notifier)
                      .getProductDetails(productList![index].slug);
                  context
                      .read(productSlugListProvider.notifier)
                      .addProductSlug(productList![index].slug);
                  context.nextPage(ProductDetailsScreen());
                },
                child: Card(
                  elevation: 0,
                  color:
                      EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                          ? kDarkCardBgColor
                          : kLightColor,
                  child: GridTile(
                    header: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        productList![index] is LinkedItem
                            ? SizedBox()
                            : productList![index].hotItem
                                ? ShaderMask(
                                    shaderCallback: (bounds) => LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.yellow[700]!,
                                              Colors.deepOrange[300]!
                                            ],
                                            tileMode: TileMode.clamp)
                                        .createShader(bounds),
                                    child: Text(
                                      "Hot Item",
                                      style:
                                          context.textTheme.caption!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              shadows: <Shadow>[
                                                Shadow(
                                                    offset: Offset(1, 1),
                                                    blurRadius: 10,
                                                    color: kDarkColor
                                                        .withOpacity(0.4)),
                                              ],
                                              color: kPrimaryLightTextColor),
                                    ),
                                  )
                                : Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            productList![index].condition == "New"
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 6),
                                    child: Text(
                                      productList![index].condition,
                                      style: context.textTheme.caption!
                                          .copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryLightTextColor),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: kPrimaryColor),
                                  ).pOnly(right: 3)
                                : Container(),
                            productList![index].discount != null
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 6),
                                    child: Text(
                                      productList![index].discount,
                                      style: context.textTheme.caption!
                                          .copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryLightTextColor),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: kPrimaryColor),
                                  )
                                : Container(),
                          ],
                        ),
                      ],
                    ).pSymmetric(h: 6, v: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Image.network(
                          productList![index].image,
                          fit: BoxFit.fitWidth,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null)
                              return child;
                            else
                              return Center(child: Icon(Icons.image));
                          },
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Container(
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: kDarkColor,
                                ),
                              ),
                            );
                          },
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                productList![index].title,
                                maxLines: null,
                                softWrap: true,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 13),
                              ),
                            ),
                          ],
                        ).pOnly(bottom: 5, top: 5),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Flexible(
                              child: productList![index].hasOffer
                                  ? Text(productList![index].offerPrice,
                                      style: context.textTheme.subtitle2!
                                          .copyWith(
                                              color:
                                                  EasyDynamicTheme.of(context)
                                                              .themeMode ==
                                                          ThemeMode.dark
                                                      ? kDarkPriceColor
                                                      : kPriceColor,
                                              fontWeight: FontWeight.bold))
                                  : Text(
                                      productList![index].price,
                                      style: context
                                          .textTheme.subtitle2!
                                          .copyWith(
                                              color:
                                                  EasyDynamicTheme.of(context)
                                                              .themeMode ==
                                                          ThemeMode.dark
                                                      ? kDarkPriceColor
                                                      : kPriceColor,
                                              fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            productList![index].hasOffer
                                ? Text(
                                    productList![index].price,
                                    style: context.textTheme.caption!.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 10,
                                        color: kPrimaryFadeTextColor),
                                  )
                                : SizedBox(),
                          ],
                        )
                      ],
                    ).p(10),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
