import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/riverpod/providers/brand_provider.dart';
import 'package:zcart/riverpod/state/brand_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/product_details_card.dart';
import 'package:zcart/views/shared_widgets/product_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class BrandItemsListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final brandItemsListState = watch(brandItemsListNotifierProvider);

    return Column(
      children: [
        brandItemsListState is BrandItemsLoadedState
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ProductDetailsCard(
                  productList: brandItemsListState.brandItemsList.data,
                ))
            : brandItemsListState is BrandItemsLoadingState ||
                    brandItemsListState is BrandItemsInitialState
                ? Container(
                    child: ProductLoadingWidget(),
                  ).px(10)
                : brandItemsListState is BrandItemsErrorState
                    ? Container(
                        child: Center(
                          child: Column(
                            children: [
                              Icon(Icons.info_outline),
                              Text(LocaleKeys.something_went_wrong.tr()),
                            ],
                          ),
                        ),
                      ).px(10).py(20)
                    : Container(),
      ],
    );
  }
}
