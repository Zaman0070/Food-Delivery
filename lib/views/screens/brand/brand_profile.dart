import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:zcart/data/models/brand/brand_profile_model.dart';
import 'package:zcart/riverpod/providers/brand_provider.dart';
import 'package:zcart/riverpod/state/brand_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/brand/brand_items_list.dart';
import 'package:zcart/views/shared_widgets/product_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class BrandProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final brandProfileState = watch(brandProfileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.brand_details.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            brandProfileState is BrandProfileLoadedState
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: context.screenHeight * .30,
                        width: context.screenWidth,
                        child: Image.network(
                          brandProfileState.brandProfile.data!.coverImage!,
                          errorBuilder: (BuildContext _, Object error,
                              StackTrace? stack) {
                            return Container();
                          },
                          fit: BoxFit.cover,
                        ),
                      ),

                      //Name
                      ListTile(
                        title: Text(
                          brandProfileState.brandProfile.data!.name!,
                          style: context.textTheme.headline6!,
                        ),
                        leading: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: context.screenWidth * .10,
                          child: Image.network(
                            brandProfileState.brandProfile.data!.image!,
                            errorBuilder: (BuildContext _, Object error,
                                StackTrace? stack) {
                              return Container();
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).p(10),

                      Container(
                        color: EasyDynamicTheme.of(context).themeMode ==
                                ThemeMode.dark
                            ? kDarkBgColor
                            : kLightColor,
                        child: Column(
                          children: [
                            BrandDetailsRowItem(
                              title: LocaleKeys.origin.tr(),
                              value:
                                  brandProfileState.brandProfile.data!.origin ??
                                      LocaleKeys.not_available.tr(),
                            ).py(5),
                            BrandDetailsRowItem(
                              title: LocaleKeys.available_from.tr(),
                              value: brandProfileState
                                      .brandProfile.data!.availableFrom ??
                                  LocaleKeys.not_available.tr(),
                            ).py(5),
                            BrandDetailsRowItem(
                              title: LocaleKeys.url.tr(),
                              value: brandProfileState.brandProfile.data!.url ??
                                  LocaleKeys.not_available.tr(),
                            ).py(5),
                            BrandDetailsRowItem(
                              title: LocaleKeys.product_count.tr(),
                              value: brandProfileState
                                      .brandProfile.data!.listingCount ??
                                  LocaleKeys.not_available.tr(),
                            ).py(5),
                          ],
                        ).px(16).py(10),
                      ).cornerRadius(10).py(5).px(10),

                      BrandDescription(
                              brandProfile: brandProfileState.brandProfile)
                          .cornerRadius(10)
                          .py(5)
                          .px(10),

                      BrandItemsListView(),
                    ],
                  )
                : brandProfileState is BrandProfileLoadingState ||
                        brandProfileState is BrandProfileInitialState
                    ? Container(
                        child: ProductLoadingWidget(),
                      ).px(10)
                    : brandProfileState is BrandProfileErrorState
                        ? Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(Icons.info_outline),
                                  Text(LocaleKeys.something_went_wrong.tr()),
                                ],
                              ),
                            ),
                          ).px(10)
                        : Container(),
          ],
        ),
      ),
    );
  }
}

class BrandDescription extends StatefulWidget {
  const BrandDescription({
    Key? key,
    required this.brandProfile,
  }) : super(key: key);

  final BrandProfile brandProfile;

  @override
  _BrandDescriptionState createState() => _BrandDescriptionState();
}

class _BrandDescriptionState extends State<BrandDescription> {
  int _maxLines = 3;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
          ? kDarkBgColor
          : kLightColor,
      child: ListTile(
        title: Text(LocaleKeys.description.tr()).py(5),
        onTap: () {
          setState(() {
            _maxLines = _maxLines > 3 ? 3 : 99999;
          });
        },
        subtitle: Text(
          widget.brandProfile.data!.description!,
          maxLines: _maxLines,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.subtitle2,
        ),
      ),
    );
  }
}

class BrandDetailsRowItem extends StatelessWidget {
  BrandDetailsRowItem({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title  :  ",
          style: context.textTheme.subtitle2,
        ),
        Flexible(
          child: SelectableText(
            value,
            style: context.textTheme.subtitle2,
          ),
        )
      ],
    );
  }
}
