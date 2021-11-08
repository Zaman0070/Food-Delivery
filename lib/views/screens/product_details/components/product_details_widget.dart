import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/riverpod/state/product/product_state.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({required this.productDetailsState});

  final ProductLoadedState productDetailsState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
              ? kDarkCardBgColor
              : kLightColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              productDetailsState.productModel.data!.keyFeatures!.isEmpty
                  ? Container()
                  : Text('${LocaleKeys.key_features.tr()}\n',
                      style: context.textTheme.subtitle2),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productDetailsState
                      .productModel.data!.keyFeatures!.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.circle_rounded,
                          size: 10,
                        ).p(8).pOnly(right: 5),
                        Flexible(
                          child: Text(
                            productDetailsState
                                .productModel.data!.keyFeatures![index],
                            style: context.textTheme.bodyText2!
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ).pSymmetric(v: 2);
                  }),
              Text('\n${LocaleKeys.technical_details.tr()}\n',
                  style: context.textTheme.subtitle2),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2, child: Text("${LocaleKeys.brand.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState
                                      .productModel.data!.product!.brand ??
                                  LocaleKeys.not_available.tr(),
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text("${LocaleKeys.model_no.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState.productModel.data!.product!
                                      .modelNumber ??
                                  LocaleKeys.not_available.tr(),
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2, child: Text("${LocaleKeys.isbn.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState
                                      .productModel.data!.product!.gtin ??
                                  LocaleKeys.not_available.tr(),
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2, child: Text("${LocaleKeys.part_no.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState
                                      .productModel.data!.product!.mpn ??
                                  LocaleKeys.not_available.tr(),
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text("${LocaleKeys.seller_sku.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState.productModel.data!.sku ??
                                  LocaleKeys.not_available,
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text("${LocaleKeys.manufacturer.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState.productModel.data!.product!
                                      .manufacturer!.name ??
                                  LocaleKeys.not_available.tr(),
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2, child: Text("${LocaleKeys.origin.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState
                                      .productModel.data!.product!.origin ??
                                  LocaleKeys.not_available.tr(),
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text("${LocaleKeys.min_quantity.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState.productModel.data!
                                          .minOrderQuantity ==
                                      null
                                  ? LocaleKeys.not_available.tr()
                                  : productDetailsState
                                      .productModel.data!.minOrderQuantity
                                      .toString(),
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text("${LocaleKeys.shipping_weight.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState
                                      .productModel.data!.shippingWeight ??
                                  LocaleKeys.not_available.tr(),
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text("${LocaleKeys.added_on.tr()}: ")),
                      Expanded(
                          flex: 3,
                          child: Text(
                              productDetailsState.productModel.data!.product!
                                      .availableFrom ??
                                  LocaleKeys.not_available.tr(),
                              style: context.textTheme.bodyText2)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ).cornerRadius(10).p(10),
        productDetailsState.productModel.data!.product!.description == null
            ? Container()
            : Container(
                color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                    ? kDarkCardBgColor
                    : kLightColor,
                child: ExpansionTile(
                  title: Text(LocaleKeys.product_desc.tr(),
                      style: context.textTheme.subtitle2),
                  iconColor:
                      EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                          ? kLightColor
                          : kDarkColor,
                  collapsedIconColor: kPrimaryColor,
                  children: [
                    HtmlWidget(
                      productDetailsState
                          .productModel.data!.product!.description!,
                      enableCaching: true,
                      webView: true,
                      webViewJs: true,
                      webViewMediaPlaybackAlwaysAllow: true,
                    ).px(10).py(5),
                  ],
                ),
              ).cornerRadius(10).p(10),
        productDetailsState.productModel.data!.description == null
            ? Container()
            : Container(
                color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                    ? kDarkCardBgColor
                    : kLightColor,
                child: ExpansionTile(
                  title: Text(LocaleKeys.seller_spec.tr(),
                      style: context.textTheme.subtitle2),
                  iconColor:
                      EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                          ? kLightColor
                          : kDarkColor,
                  collapsedIconColor: kPrimaryColor,
                  children: [
                    HtmlWidget(
                      productDetailsState.productModel.data!.description!,
                      enableCaching: true,
                      webView: true,
                      webViewMediaPlaybackAlwaysAllow: true,
                    ).px(10).py(5),
                  ],
                ),
              ).cornerRadius(10).px(10),
      ],
    );
  }
}
