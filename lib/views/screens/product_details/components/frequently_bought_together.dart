import 'package:flutter/material.dart';
import 'package:zcart/riverpod/state/product/product_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';

class FrequentlyBoughtTogetherCard extends StatelessWidget {
  const FrequentlyBoughtTogetherCard(
      {Key? key, required this.productDetailsState});

  final ProductLoadedState productDetailsState;

  @override
  Widget build(BuildContext context) {
    return productDetailsState.productModel.data!.linkedItems!.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(LocaleKeys.frequently_bought_together.tr(),
                      style: context.textTheme.subtitle2!
                          .copyWith(color: kPrimaryFadeTextColor))
                  .pOnly(top: 10, left: 10, bottom: 5),
              ProductDetailsCard(
                      productList:
                          productDetailsState.productModel.data!.linkedItems)
                  .px(10),
            ],
          )
        : Container();
  }
}
