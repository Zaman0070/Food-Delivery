import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:zcart/riverpod/providers/deals_provider.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/riverpod/providers/scroll_provider.dart';
import 'package:zcart/riverpod/state/deals_state.dart';
import 'package:zcart/riverpod/state/scroll_state.dart';
import 'package:zcart/riverpod/state/state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/brand/featured_brands.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';
import 'components/category_widget.dart';
import 'components/error_widget.dart';
import 'components/slider_widget.dart';
import 'components/search_bar.dart';
import 'components/banners_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final sliderState = watch(sliderNotifierProvider);
    final categoryState = watch(categoryNotifierProvider);
    final bannerState = watch(bannerNotifierProvider);
    final trendingNowState = watch(trendingNowNotifierProvider);
    final latestItemState = watch(latestItemNotifierProvider);
    final popularItemState = watch(popularItemNotifierProvider);
    final dealsUnderThePrice = watch(dealsUnderThePriceNotifierProvider);
    final randomItemState = watch(randomItemNotifierProvider);
    final scrollControllerProvider =
        watch(randomItemScrollNotifierProvider.notifier);

    return ProviderListener<ScrollState>(
        provider: randomItemScrollNotifierProvider,
        onChange: (context, state) {
          if (state is ScrollReachedBottomState) {
            context
                .read(randomItemNotifierProvider.notifier)
                .getMoreRandomItems();
          }
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:
                EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                    ? kDarkBgColor
                    : kDarkBgColor,
            brightness: Brightness.light,
            flexibleSpace: SafeArea(child: CustomSearchBar()),
          ),
          body: SingleChildScrollView(
            controller: scrollControllerProvider.controller,
            child: Column(
              children: [
                /// Slider
                sliderState is SliderLoadedState
                    ? SliderWidget(sliderState.sliderList).py(5)
                    : sliderState is SliderErrorState
                        ? ErrorMessageWidget(sliderState.message)
                        : Container(),

                /// Category
                (categoryState is CategoryInitialState ||
                        categoryState is CategoryLoadingState)
                    ? Container()
                    : categoryState is CategoryLoadedState
                        ? CategoryWidget(categoryState.categoryList).py(5)
                        : categoryState is CategoryErrorState
                            ? ErrorMessageWidget(categoryState.message)
                            : Container(),

                /// Banner
                bannerState is BannerLoadedState
                    ? BannerWidget(bannerState.bannerList!.sublist(0, 3))
                    : bannerState is BannerErrorState
                        ? ErrorMessageWidget(bannerState.message)
                        : Container(),

                /// Trending Now
                trendingNowState is TrendingNowLoadedState
                    ? ProductCard(
                            title: LocaleKeys.trending_now.tr(),
                            productList: trendingNowState.trendingNowList)
                        .py(15)
                    : trendingNowState is TrendingNowErrorState
                        ? ErrorMessageWidget(trendingNowState.message)
                        : ProductLoadingWidget(),

                /// Banner
                bannerState is BannerLoadedState
                    ? BannerWidget(
                        bannerState.bannerList!.sublist(3, 5),
                        isReverse: false,
                      )
                    : bannerState is BannerErrorState
                        ? ErrorMessageWidget(bannerState.message)
                        : Container(),

                ///Deals under the price
                // DealsUnderThePrice().pOnly(top: 15),

                dealsUnderThePrice is DealsUnderThePriceStateLoadedState
                    ? ProductCard(
                            title: dealsUnderThePrice
                                .dealsUnderThePrice!.meta!.dealTitle!,
                            productList:
                                dealsUnderThePrice.dealsUnderThePrice!.data)
                        .py(15)
                    : dealsUnderThePrice is DealsUnderThePriceStateErrorState
                        ? ErrorMessageWidget(dealsUnderThePrice.message)
                        : ProductLoadingWidget(),

                ///Featured Brands
                FeaturedBrands().pOnly(top: 15),

                /// Recently Added (Latest Item)
                latestItemState is LatestItemLoadedState
                    ? ProductCard(
                            title: LocaleKeys.recently_added.tr(),
                            productList: latestItemState.latestItemList)
                        .py(15)
                    : latestItemState is LatestItemErrorState
                        ? ErrorMessageWidget(latestItemState.message)
                        : ProductLoadingWidget(),

                /// Banner
                bannerState is BannerLoadedState
                    ? BannerWidget(bannerState.bannerList!.sublist(5, 7))
                    : bannerState is BannerErrorState
                        ? ErrorMessageWidget(bannerState.message)
                        : Container(),

                /// Popular Items
                popularItemState is PopularItemLoadedState
                    ? ProductCard(
                            title: LocaleKeys.popular_items.tr(),
                            productList: popularItemState.popularItemList)
                        .py(15)
                    : popularItemState is PopularItemErrorState
                        ? ErrorMessageWidget(popularItemState.message)
                        : ProductLoadingWidget(),

                /// Banner
                bannerState is BannerLoadedState
                    ? BannerWidget(
                        bannerState.bannerList!.sublist(7),
                        isReverse: false,
                      )
                    : bannerState is BannerErrorState
                        ? ErrorMessageWidget(bannerState.message)
                        : Container(),

                /// Random Items (Additional Items to Explore in the UI)
                randomItemState is RandomItemLoadedState
                    ? ProductDetailsCard(
                            title: LocaleKeys.additional_items.tr(),
                            productList: randomItemState.randomItemList)
                        .py(15)
                    : randomItemState is RandomItemErrorState
                        ? ErrorMessageWidget(randomItemState.message)
                        : ProductLoadingWidget(),
              ],
            ).px(10),
          ),
        ));
  }
}
