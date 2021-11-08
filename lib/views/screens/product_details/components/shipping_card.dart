import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/riverpod/providers/address_provider.dart';
import 'package:zcart/riverpod/state/product/product_state.dart';
import 'package:zcart/views/screens/product_details/shipping_address_screen.dart';
import 'package:zcart/Theme/styles/colors.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShippingCard extends StatelessWidget {
  const ShippingCard({required this.productDetailsState});

  final ProductLoadedState productDetailsState;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
          ? kDarkCardBgColor
          : kLightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.location_pin, size: 25).pOnly(left: 10),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                        productDetailsState
                            .productModel.shippingOptions!.first.name!,
                        style: context.textTheme.caption)
                    .pOnly(bottom: 5),
                Text(
                  "To ${productDetailsState.productModel.countries!.values.elementAt(productDetailsState.productModel.countries!.keys.toList().indexOf(productDetailsState.productModel.shippingCountryId.toString()))}",
                  style: context.textTheme.bodyText1!,
                ),
              ],
            ),
            subtitle: Text(
              productDetailsState
                  .productModel.shippingOptions!.first.deliveryTakes!,
              style: context.textTheme.caption,
            ).pOnly(top: 5),
            trailing: Icon(Icons.arrow_forward_ios, size: 15).pOnly(right: 10),
            onTap: () {
              context
                  .read(shippingNotifierProvider.notifier)
                  .fetchShippingOptions(
                      productDetailsState.productModel.data!.id,
                      productDetailsState.productModel.shippingCountryId,
                      null);
              context.nextPage(ShippingAddressScreen(
                  productModel: productDetailsState.productModel));
            },
          )
        ],
      ),
    );
  }
}
