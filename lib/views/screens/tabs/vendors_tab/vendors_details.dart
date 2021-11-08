import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/controller/chat/chat_controller.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/riverpod/state/state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/auth/login_screen.dart';
import 'package:zcart/views/screens/tabs/account_tab/messages/vendor_chat_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/views/screens/tabs/home_tab/components/error_widget.dart';
import 'package:zcart/views/screens/tabs/vendors_tab/vendors_aboutUs_screen.dart';
import 'components/vendors_card.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';

class VendorsDetailsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final vendorDetailsState = watch(vendorDetailsNotifierProvider);
    final vendorItemDetailsListState = watch(vendorItemsNotifierProvider);
    final scrollControllerProvider =
        watch(vendorItemScrollNotifierProvider.notifier);

    return ProviderListener<ScrollState>(
      provider: vendorItemScrollNotifierProvider,
      onChange: (context, state) {
        if (state is ScrollReachedBottomState) {
          context
              .read(vendorItemsNotifierProvider.notifier)
              .getMoreVendorItems();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.vendor_details.tr()),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          controller: scrollControllerProvider.controller,
          child: Column(
            children: [
              vendorDetailsState is VendorDetailsLoadedState
                  ? Column(
                      children: [
                        Container(
                          height: context.screenHeight * .30,
                          width: context.screenWidth,
                          child: Image.network(
                            vendorDetailsState.vendorDetails!.bannerImage!,
                            errorBuilder: (BuildContext _, Object error,
                                StackTrace? stack) {
                              return Container();
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                        VendorCard(
                          logo: vendorDetailsState.vendorDetails!.image,
                          name: vendorDetailsState.vendorDetails!.name,
                          verifiedText:
                              vendorDetailsState.vendorDetails!.verifiedText,
                          isVerified:
                              vendorDetailsState.vendorDetails!.verified,
                          rating: vendorDetailsState.vendorDetails!.rating,
                          onTap: () => context.nextPage(
                            VendorsAboutUsScreen(
                              vendorDetails: vendorDetailsState.vendorDetails,
                              onPressedContact: () {
                                if (accessAllowed) {
                                  context
                                      .read(productChatProvider.notifier)
                                      .productConversation(
                                        vendorDetailsState.vendorDetails!.id,
                                      );

                                  context.nextPage(
                                    VendorChatScreen(
                                        shopId: vendorDetailsState
                                            .vendorDetails!.id,
                                        shopImage: vendorDetailsState
                                            .vendorDetails!.image,
                                        shopName: vendorDetailsState
                                            .vendorDetails!.name,
                                        shopVerifiedText: vendorDetailsState
                                            .vendorDetails!.verifiedText),
                                  );
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen(
                                                needBackButton: true,
                                              )));
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  : vendorDetailsState is VendorDetailsLoadingState ||
                          vendorDetailsState is VendorDetailsInitialState
                      ? ProductLoadingWidget().px(10)
                      : vendorDetailsState is VendorDetailsErrorState
                          ? ErrorMessageWidget(vendorDetailsState.message)
                          : Container(),
              vendorItemDetailsListState is VendorItemLoadedState
                  ? ProductDetailsCard(
                          productList: vendorItemDetailsListState.vendorItem)
                      .px(10)
                  : vendorItemDetailsListState is VendorItemLoadingState ||
                          vendorItemDetailsListState is VendorItemInitialState
                      ? ProductLoadingWidget().px(10)
                      : vendorItemDetailsListState is VendorItemErrorState
                          ? ErrorMessageWidget(
                              vendorItemDetailsListState.message)
                          : Container()
            ],
          ),
        ),
      ),
    );
  }
}
