import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/riverpod/state/state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/address_list_widget.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/views/shared_widgets/loading_widget.dart';
import 'add_address_screen.dart';

class AddressList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.your_address.tr())),
      resizeToAvoidBottomInset: true,
      body: Container(
        color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
            ? kDarkCardBgColor
            : kLightColor,
        width: context.screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, watch, _) {
                final addressState = watch(addressNotifierProvider);
                final cartItemDetailsState =
                    watch(cartItemDetailsNotifierProvider);

                return addressState is AddressLoadedState
                    ? addressState.addresses == null
                        ? Container()
                        : addressState.addresses!.length == 0
                            ? Container()
                            : cartItemDetailsState is CartItemDetailsLoadedState
                                ? AddressListBuilder(
                                    addressesList: addressState.addresses)
                                : AddressListBuilder(
                                    addressesList: addressState.addresses)
                    : addressState is AddressLoadingState
                        ? Container(
                            child: LoadingWidget(),
                          ).py(100)
                        : Container();
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                      onPressed: () => context.nextPage(AddNewAddressScreen()),
                      child: Text(LocaleKeys.new_address.tr()))
                  .p(10),
            ),
          ],
        ).p(10),
      ),
    );
  }
}
