import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/riverpod/providers/offers_provider.dart';
import 'package:zcart/riverpod/state/offers_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';

class OffersScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final offersState = watch(offersNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Offers"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: offersState is OffersLoadingState
              ? Container(
                  height: context.screenHeight - 100,
                  child: Center(child: LoadingWidget()))
              : offersState is OffersLoadedState
                  ? Column(
                      children: [
                        const SizedBox(height: 10),
                        Container(
                          color: EasyDynamicTheme.of(context).themeMode ==
                                  ThemeMode.dark
                              ? kDarkBgColor
                              : kLightColor,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Image.network(
                                      offersState.offersModel.data!.image!,
                                      errorBuilder: (BuildContext _,
                                          Object error, StackTrace? stack) {
                                return Container();
                              }, fit: BoxFit.fitWidth)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Text(
                                        offersState.offersModel.data!.name!,
                                        maxLines: null,
                                        softWrap: true,
                                        style: context.textTheme.bodyText2!),
                                  ),
                                ],
                              ).py(5),
                              Text(
                                  offersState.offersModel.data!.brand ??
                                      LocaleKeys.not_available.tr(),
                                  style: context.textTheme.subtitle2),
                              Text(
                                  "${offersState.offersModel.data!.gtinType ?? ""} : ${offersState.offersModel.data!.gtin ?? "${LocaleKeys.not_available.tr()}"}",
                                  style: context.textTheme.subtitle2!),
                            ],
                          ),
                        ).px(10),
                        ProductDetailsCard(
                                productList:
                                    offersState.offersModel.data!.listings)
                            .px(10)
                      ],
                    )
                  : Container(),
        ),
      ),
    );
  }
}
