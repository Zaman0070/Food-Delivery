import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/controller/blog/blog_controller.dart';
import 'package:zcart/data/controller/cart/coupon_controller.dart';
import 'package:zcart/data/controller/cart/coupon_state.dart';
import 'package:zcart/data/controller/chat/chat_controller.dart';
import 'package:zcart/riverpod/notifier/user_state_notifier.dart';
import 'package:zcart/riverpod/providers/dispute_provider.dart';
import 'package:zcart/riverpod/providers/order_provider.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/riverpod/providers/wishlist_provider.dart';
import 'package:zcart/riverpod/state/dispute/disputes_state.dart';
import 'package:zcart/riverpod/state/order_state.dart';
import 'package:zcart/riverpod/state/state.dart';
import 'package:zcart/riverpod/state/wishlist_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:zcart/views/screens/brand/featured_brands.dart';
import 'package:zcart/views/screens/tabs/account_tab/account/account_details_screen.dart';
import 'package:zcart/views/screens/tabs/account_tab/account/address_list.dart';
import 'package:zcart/views/screens/tabs/account_tab/blogs/blogs_screen.dart';
import 'package:zcart/views/screens/tabs/account_tab/coupons/myCoupons_screen.dart';
import 'package:zcart/views/screens/tabs/account_tab/disputes/disputes_screen.dart';
import 'package:zcart/views/screens/tabs/account_tab/messages/messages_screen.dart';
import 'package:zcart/views/screens/tabs/account_tab/orders/myOrder_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/views/screens/tabs/account_tab/settings/settings_page.dart';

class AccountTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.account_text.tr()),
          actions: [
            IconButton(
              onPressed: () {
                context.nextPage(SettingsPage());
              },
              icon: Icon(Icons.settings),
              tooltip: "Settings",
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Account_dashboard(),
                UserActivityCard(),
                ActionCard(),
                FeaturedBrands().p(10),
              ],
            ),
          ),
        ));
  }
}

class Account_dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final userState = watch(userNotifierProvider);

      return userState is UserLoadedState
          ? Container(
              padding: EdgeInsets.all(16),
              color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                  ? kDarkCardBgColor
                  : kLightColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        backgroundImage: NetworkImage(userState.user!.avatar!),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.your_full_name.tr(),
                              style: context.textTheme.caption!.copyWith(
                                  color: kPrimaryFadeTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${userState.user!.name}",
                              style: context.textTheme.subtitle2!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ).pOnly(bottom: 10).px(10),
                  Divider(
                    height: 16,
                    thickness: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.your_email.tr(),
                        style: context.textTheme.caption!.copyWith(
                            color: kPrimaryFadeTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${userState.user!.email}",
                        style: context.textTheme.subtitle2!
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ).p(10),
                  userState.user!.dob != null || userState.user!.sex != null
                      ? Divider(
                          height: 16,
                          thickness: 1,
                        )
                      : Container(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      userState.user!.sex == null
                          ? Container()
                          : Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.sex.tr(),
                                    style: context.textTheme.caption!.copyWith(
                                        color: kPrimaryFadeTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${userState.user!.sex}",
                                    style: context.textTheme.subtitle2!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                      userState.user!.dob == null
                          ? Container()
                          : Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.dob.tr(),
                                    style: context.textTheme.caption!.copyWith(
                                        color: kPrimaryFadeTextColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${userState.user!.dob}",
                                    style: context.textTheme.subtitle2!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                    ],
                  ).p(10),
                ],
              ),
            ).cornerRadius(10).p(10)
          : Container();
    });
  }
}

class UserActivityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kLightCardBgColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(builder: (context, watch, _) {
                  final orderListState = watch(ordersProvider);

                  return Text(
                    orderListState is OrdersLoadedState
                        ? orderListState.orders!.length.toString()
                        : "0",
                    style: context.textTheme.headline4!.copyWith(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  );
                }),
                Text(
                  LocaleKeys.orders.tr(),
                  style: context.textTheme.caption!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ).onInkTap(() {
              context.nextPage(MyOrderScreen());
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kLightCardBgColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(
                  builder: (context, watch, _) {
                    final couponState = watch(couponsProvider);
                    return Text(
                      couponState is CouponLoadedState
                          ? "${couponState.coupon!.length}"
                          : "0",
                      style: context.textTheme.headline4!.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                Text(
                  LocaleKeys.coupons.tr(),
                  style: context.textTheme.caption!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ).onInkTap(() {
              context.nextPage(MyCouponsScreen());
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kLightCardBgColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(
                  builder: (context, watch, _) {
                    final disputesState = watch(disputesProvider);
                    return Text(
                      disputesState is DisputesLoadedState
                          ? disputesState.disputes.length.toString()
                          : "0",
                      style: context.textTheme.headline4!.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                Text(
                  LocaleKeys.disputes.tr(),
                  style: context.textTheme.caption!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ).onInkTap(() {
              context.nextPage(DisputeScreen());
            }),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kLightCardBgColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(
                  builder: (ctx, watch, _) {
                    final wishListState = watch(wishListNotifierProvider);
                    return Text(
                      wishListState is WishListLoadedState
                          ? wishListState.wishList.length.toString()
                          : '0',
                      style: context.textTheme.headline4!.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    );
                  },
                ),
                Text(
                  LocaleKeys.wishlist_text.tr(),
                  style: context.textTheme.caption!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ).onInkTap(() {
              context.nextReplacementPage(BottomNavBar(selectedIndex: 3));
            }),
          ),
        ),
      ],
    ).cornerRadius(10).p(10);
  }
}

class ActionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
            ? kDarkCardBgColor
            : kLightColor,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.bubble_left_bubble_right,
                  ).pOnly(bottom: 10),
                  Text(
                    LocaleKeys.messages.tr(),
                    style: context.textTheme.caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ).onInkTap(() {
                context.read(conversationProvider.notifier).conversation();
                context.nextPage(MessagesScreen());
              }),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.location).pOnly(bottom: 10),
                  Text(
                    LocaleKeys.addresses.tr(),
                    style: context.textTheme.caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ).onInkTap(() {
                context.read(countryNotifierProvider.notifier).getCountries();
                context.read(addressNotifierProvider.notifier).fetchAddress();
                context.nextPage(AddressList());
              }),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person,
                  ).pOnly(bottom: 10),
                  Text(
                    LocaleKeys.account_text.tr(),
                    style: context.textTheme.caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ).onInkTap(() {
                context.read(userNotifierProvider.notifier).getUserInfo();
                context.nextPage(AccountDetailsScreen());
              }),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.doc_append,
                  ).pOnly(bottom: 10),
                  Text(
                    LocaleKeys.blogs.tr(),
                    style: context.textTheme.caption!
                        .copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ).onInkTap(() {
                context.read(blogsProvider.notifier).blogs();
                context.nextPage(BlogsScreen());
              }),
            ),
          ],
        )).cornerRadius(10).p(10);
  }
}
