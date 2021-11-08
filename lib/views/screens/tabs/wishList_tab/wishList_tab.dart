import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zcart/riverpod/providers/product_provider.dart';
import 'package:zcart/riverpod/providers/product_slug_list_provider.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/riverpod/providers/wishlist_provider.dart';
import 'package:zcart/riverpod/state/product/random_item_state.dart';
import 'package:zcart/riverpod/state/scroll_state.dart';
import 'package:zcart/riverpod/state/wishlist_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/product_details/product_details_screen.dart';
import 'package:zcart/views/screens/tabs/home_tab/components/error_widget.dart';
import 'package:zcart/views/shared_widgets/product_details_card.dart';
import 'package:zcart/views/shared_widgets/product_loading_widget.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:easy_localization/easy_localization.dart';

class WishListTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final wishListState = watch(wishListNotifierProvider);
    final scrollControllerProvider =
        watch(wishlistScrollNotifierProvider.notifier);
    final randomItemState = watch(randomItemNotifierProvider);
    final randomScrollControllerProvider =
        watch(randomItemScrollNotifierProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.wishlist_text.tr()),
        ),
        body: wishListState is WishListLoadedState
            ? wishListState.wishList.length == 0
                ? ProviderListener<ScrollState>(
                    provider: randomItemScrollNotifierProvider,
                    onChange: (context, state) {
                      if (state is ScrollReachedBottomState) {
                        context
                            .read(randomItemNotifierProvider.notifier)
                            .getMoreRandomItems();
                      }
                    },
                    child: SingleChildScrollView(
                      controller: randomScrollControllerProvider.controller,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 100),
                          Icon(Icons.info_outline),
                          Text(LocaleKeys.no_item_found.tr()),

                          SizedBox(height: 100),

                          /// Popular Items
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: randomItemState is RandomItemLoadedState
                                ? ProductDetailsCard(
                                        title: LocaleKeys.additional_items.tr(),
                                        isTitleCentered: true,
                                        productList:
                                            randomItemState.randomItemList)
                                    .py(15)
                                : randomItemState is RandomItemErrorState
                                    ? ErrorMessageWidget(
                                        randomItemState.message)
                                    : ProductLoadingWidget(),
                          )
                        ],
                      ),
                    ),
                  )
                : ProviderListener<ScrollState>(
                    onChange: (context, state) {
                      if (state is ScrollReachedBottomState) {
                        context
                            .read(wishListNotifierProvider.notifier)
                            .getMoreWishList();
                      }
                    },
                    provider: wishlistScrollNotifierProvider,
                    child: ListView.builder(
                        controller: scrollControllerProvider.controller,
                        itemCount: wishListState.wishList.length,
                        padding: EdgeInsets.only(top: 5),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: EasyDynamicTheme.of(context).themeMode ==
                                        ThemeMode.dark
                                    ? kDarkCardBgColor
                                    : kLightColor,
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            padding: EdgeInsets.all(5),
                            child: Slidable(
                              actionPane: SlidableStrechActionPane(),
                              actionExtentRatio: 0.25,
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      wishListState.wishList[index].image!,
                                      errorBuilder: (BuildContext _,
                                          Object error, StackTrace? stack) {
                                        return Container();
                                      },
                                      height: 50,
                                      width: 50,
                                    ).p(10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text("Staff Pick",
                                                    style: context
                                                        .textTheme.overline!
                                                        .copyWith(
                                                            color:
                                                                kPrimaryLightTextColor)),
                                              ).pOnly(right: 3).visible(
                                                  wishListState.wishList[index]
                                                          .stuffPick ??
                                                      false),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text("Hot Item",
                                                    style: context
                                                        .textTheme.overline!
                                                        .copyWith(
                                                            color:
                                                                kPrimaryLightTextColor)),
                                              ).pOnly(right: 3).visible(
                                                  wishListState.wishList[index]
                                                          .hotItem ??
                                                      false),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text("Free Shipping",
                                                    style: context
                                                        .textTheme.overline!
                                                        .copyWith(
                                                            color:
                                                                kPrimaryLightTextColor)),
                                              ).pOnly(right: 3).visible(
                                                  wishListState.wishList[index]
                                                          .freeShipping ??
                                                      false),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text("New",
                                                    style: context
                                                        .textTheme.overline!
                                                        .copyWith(
                                                            color:
                                                                kPrimaryLightTextColor)),
                                              ).pOnly(right: 3).visible(
                                                  wishListState.wishList[index]
                                                          .condition ==
                                                      "New"),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 5),
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 5),
                                                child: Text(
                                                    wishListState
                                                        .wishList[index]
                                                        .discount!,
                                                    style: context
                                                        .textTheme.overline!
                                                        .copyWith(
                                                            color:
                                                                kPrimaryLightTextColor)),
                                              ).pOnly(right: 3).visible(
                                                  wishListState.wishList[index]
                                                          .hasOffer ??
                                                      false),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  wishListState
                                                      .wishList[index].title!,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  style: context
                                                      .textTheme.bodyText2!
                                                      .copyWith(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ).pOnly(bottom: 10),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Text(
                                                  wishListState.wishList[index]
                                                          .hasOffer!
                                                      ? wishListState
                                                          .wishList[index]
                                                          .offerPrice!
                                                      : wishListState
                                                          .wishList[index]
                                                          .price!,
                                                  style: context
                                                      .textTheme.bodyText2!
                                                      .copyWith(
                                                          color: EasyDynamicTheme.of(
                                                                          context)
                                                                      .themeMode ==
                                                                  ThemeMode.dark
                                                              ? kDarkPriceColor
                                                              : kPriceColor,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                              wishListState
                                                      .wishList[index].hasOffer!
                                                  ? Text(
                                                      wishListState
                                                          .wishList[index]
                                                          .price!,
                                                      style: context
                                                          .textTheme.caption!
                                                          .copyWith(
                                                        color:
                                                            kPrimaryFadeTextColor,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                      )).pOnly(left: 3)
                                                  : SizedBox(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(CupertinoIcons.cart_badge_plus).p(10)
                                  ],
                                ),
                              ),
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: LocaleKeys.delete.tr(),
                                  color: Colors.red,
                                  icon: Icons.delete,
                                  onTap: () {
                                    toast(LocaleKeys.please_wait.tr());
                                    context
                                        .read(wishListNotifierProvider.notifier)
                                        .removeFromWishList(
                                            wishListState.wishList[index].id);
                                  },
                                ),
                              ],
                            ),
                          ).onInkTap(() {
                            context
                                .read(productNotifierProvider.notifier)
                                .getProductDetails(
                                    wishListState.wishList[index].slug);
                            context
                                .read(productSlugListProvider.notifier)
                                .addProductSlug(
                                    wishListState.wishList[index].slug);
                            context.nextPage(ProductDetailsScreen());
                          });
                        }),
                  )
            : ProductLoadingWidget().px(10));
  }
}
