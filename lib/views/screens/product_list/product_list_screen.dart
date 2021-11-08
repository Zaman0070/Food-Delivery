import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/riverpod/providers/category_provider.dart';
import 'package:zcart/riverpod/state/category_item_state.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/loading_widget.dart';
import 'package:zcart/views/shared_widgets/product_details_card.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final categoryItemState = watch(categoryItemNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.product_list.tr()),
        ),
        body: categoryItemState is CategoryItemLoadingState
            ? Container(
                height: context.screenHeight - 100,
                child: Center(child: LoadingWidget()))
            : categoryItemState is CategoryItemLoadedState
                ? categoryItemState.categoryItemList!.isEmpty
                    ? Container(
                        height: context.screenHeight,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info_outline),
                            Text("No Items available")
                          ],
                        )))
                    : SingleChildScrollView(
                        child: ProductDetailsCard(
                                productList: categoryItemState.categoryItemList)
                            .px(10),
                      )
                : Container());
  }
}
