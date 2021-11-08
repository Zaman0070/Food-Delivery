import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:zcart/riverpod/providers/brand_provider.dart';
import 'package:zcart/riverpod/state/brand_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/views/screens/brand/brand_profile.dart';
import 'package:zcart/views/screens/tabs/home_tab/components/error_widget.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class FeaturedBrands extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final featuredBrandsState = watch(featuredBrandsNotifierProvider);

    return featuredBrandsState is FeaturedBrandsLoadedState
        ? Container(
            height: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.featured_brands.tr(),
                        style: context.textTheme.headline6!
                            .copyWith(color: kPrimaryFadeTextColor))
                    .pOnly(bottom: 10),
                Flexible(
                  child: Container(
                    color:
                        EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                            ? kDarkCardBgColor
                            : kDarkCardBgColor,
                    child: ListView.builder(
                        itemCount:
                            featuredBrandsState.featuredBrands!.data.length > 6
                                ? 6
                                : featuredBrandsState
                                    .featuredBrands!.data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctx, index) {
                          final brand =
                              featuredBrandsState.featuredBrands!.data[index];
                          return Card(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              alignment: Alignment.center,
                              child: Image.network(
                                brand.image!,
                                fit: BoxFit.fitWidth,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Container(
                                    child: Center(
                                      child: Icon(
                                        Icons.image_not_supported,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ).onInkTap(() async {
                              context.nextPage(BrandProfileScreen());
                              await context
                                  .read(brandProfileNotifierProvider.notifier)
                                  .getBrandProfile(brand.slug);

                              await context
                                  .read(brandItemsListNotifierProvider.notifier)
                                  .getBrandItemsList(brand.slug);
                            }),
                          );
                        }).p(10),
                  ).cornerRadius(10),
                ),
              ],
            ),
          )
        : featuredBrandsState is FeaturedBrandsErrorState
            ? ErrorMessageWidget(featuredBrandsState.message)
            : Container();
  }
}
