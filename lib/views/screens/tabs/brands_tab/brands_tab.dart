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

class BrandsTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final brandsState = watch(allBrandsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.brands.tr()),
      ),
      body: brandsState is BrandsLoadedState
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 10),
              itemCount: brandsState.allBrands!.data.length,
              itemBuilder: (context, index) {
                final brand = brandsState.allBrands!.data[index];
                return GestureDetector(
                  onTap: () async {
                    context.nextPage(BrandProfileScreen());
                    await context
                        .read(brandProfileNotifierProvider.notifier)
                        .getBrandProfile(brand.slug);

                    await context
                        .read(brandItemsListNotifierProvider.notifier)
                        .getBrandItemsList(brand.slug);
                  },
                  child: Card(
                    elevation: 0,
                    color:
                        EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                            ? kDarkCardBgColor
                            : kLightColor,
                    child: GridTile(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Image.network(
                            brand.image!,
                            fit: BoxFit.fitWidth,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null)
                                return child;
                              else
                                return Center(child: Icon(Icons.image));
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  brand.name!,
                                  maxLines: null,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.subtitle2,
                                ),
                              ),
                            ],
                          ).pOnly(bottom: 5, top: 5),
                        ],
                      ).p(10),
                    ),
                  ),
                );
              },
            ).px(10)
          : brandsState is BrandsErrorState
              ? ErrorMessageWidget(brandsState.message)
              : Container(),
    );
  }
}
