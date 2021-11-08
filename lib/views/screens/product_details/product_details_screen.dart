import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/data/controller/chat/chat_controller.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:zcart/riverpod/providers/cart_provider.dart';
import 'package:zcart/riverpod/providers/product_slug_list_provider.dart';
import 'package:zcart/riverpod/providers/product_provider.dart';
import 'package:zcart/riverpod/state/cart_state.dart';
import 'package:zcart/riverpod/state/product/product_state.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/auth/login_screen.dart';
import 'package:zcart/views/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:zcart/views/screens/product_details/components/product_brand_card.dart';
import 'package:zcart/views/screens/product_details/components/shop_card.dart';
import 'package:zcart/views/screens/tabs/account_tab/messages/vendor_chat_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'components/attribute_card.dart';
import 'components/frequently_bought_together.dart';
import 'components/more_offer_from_seller.dart';
import 'components/product_details_widget.dart';
import 'components/product_image_slider.dart';
import 'components/product_name_card_dart.dart';
import 'components/shipping_card.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  int _quantity = 1;

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      _quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _totalPrice = 0.0;
    return ProviderListener<ProductState>(
        provider: productNotifierProvider,
        onChange: (context, state) {
          if (state is ProductLoadedState) {
            context.read(cartNotifierProvider.notifier).getCartList();
            _quantity = state.productModel.data!.minOrderQuantity ?? 1;
          }
        },
        child: Consumer(
          builder: (context, watch, _) {
            final productDetailsState = watch(productNotifierProvider);

            if (productDetailsState is ProductLoadedState) {
              _totalPrice = double.parse(
                      productDetailsState.productModel.data!.rawPrice!) *
                  _quantity;
            }

            final cartState = watch(cartNotifierProvider);

            int? cartItems;
            if (cartState is CartLoadedState) {
              cartItems = 0;
              if (cartState.cartList != null) {
                for (var item in cartState.cartList!) {
                  cartItems = cartItems! + item.items!.length;
                }
              }
            }

            return WillPopScope(
              // ignore: missing_return
              onWillPop: () async {
                /// Reason: Deep linking product details screen navigation.
                context
                    .read(productSlugListProvider.notifier)
                    .removeProductSlug();
                if (context.read(productSlugListProvider).isNotEmpty)
                  context
                      .read(productNotifierProvider.notifier)
                      .getProductDetails(
                          context.read(productSlugListProvider).last);

                Navigator.of(context).pop(true);

                return true;
              },
              child: Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: productDetailsState is ProductLoadedState
                              ? Column(
                                  children: [
                                    ProductImageSlider(productDetailsState
                                        .productModel.variants!.images),
                                    ProductNameCard(
                                            productModel: productDetailsState
                                                .productModel)
                                        .pOnly(top: 5),
                                    AttributeCard(
                                      productModel:
                                          productDetailsState.productModel,
                                      quantity: _quantity,
                                      increaseQuantity: () =>
                                          _increaseQuantity(),
                                      decreaseQuantity: () =>
                                          _decreaseQuantity(),
                                      formKey: _formKey,
                                    ).cornerRadius(10).p(10),
                                    ShippingCard(
                                            productDetailsState:
                                                productDetailsState)
                                        .cornerRadius(10)
                                        .px(10),
                                    ProductDetailsWidget(
                                        productDetailsState:
                                            productDetailsState),
                                    // BrandCards
                                    ProductBrandCard(productDetailsState)
                                        .cornerRadius(10)
                                        .px(10)
                                        .pOnly(top: 10),

                                    MoreOffersFromSellerCard(
                                            productDetailsState:
                                                productDetailsState)
                                        .cornerRadius(10)
                                        .px(10)
                                        .pOnly(top: 10),

                                    ShopCard(
                                        productDetailsState:
                                            productDetailsState),
                                    FrequentlyBoughtTogetherCard(
                                            productDetailsState:
                                                productDetailsState)
                                        .pOnly(bottom: 50)
                                  ],
                                )
                              : ProductLoadingWidget().p(10),
                        ),
                      ),
                      Visibility(
                        visible: !(productDetailsState is ProductLoadingState),
                        child: Container(
                          color: kDarkColor,
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: kLightColor,
                                child: Center(
                                    child: Icon(CupertinoIcons.bubble_left_fill,
                                        color: kDarkColor, size: 20)),
                              ).cornerRadius(10).px(5).onInkTap(() {
                                if (productDetailsState is ProductLoadedState) {
                                  if (accessAllowed) {
                                    context
                                        .read(productChatProvider.notifier)
                                        .productConversation(productDetailsState
                                            .productModel.data!.shop!.id);

                                    context.nextPage(VendorChatScreen(
                                        shopId: productDetailsState
                                            .productModel.data!.shop!.id,
                                        shopImage: productDetailsState
                                            .productModel.data!.shop!.image,
                                        shopName: productDetailsState
                                            .productModel.data!.shop!.name,
                                        shopVerifiedText: productDetailsState
                                            .productModel
                                            .data!
                                            .shop!
                                            .verifiedText));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginScreen(
                                                  needBackButton: true,
                                                )));
                                  }
                                }
                              }),
                              ElevatedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(kLightColor),
                                    shape: MaterialStateProperty.all(
                                        StadiumBorder()),
                                    foregroundColor:
                                        MaterialStateProperty.all(kDarkColor),
                                  ),
                                  onPressed: () {
                                    context.nextAndRemoveUntilPage(
                                        BottomNavBar(selectedIndex: 3));
                                  },
                                  icon: Icon(CupertinoIcons.cart,
                                      color: kDarkColor, size: 20),
                                  label: Text(cartItems == null
                                      ? "+"
                                      : cartItems.toString())),
                              Spacer(),
                              Container(
                                height: 40,
                                width: context.screenWidth * 0.50,
                                color: kPrimaryColor,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(LocaleKeys.add_to_cart.tr(),
                                            style: context.textTheme.subtitle2!
                                                .copyWith(
                                                    color:
                                                        kPrimaryLightTextColor)),
                                        Text(
                                          "${LocaleKeys.total.tr()} - \$${_totalPrice.toDoubleStringAsPrecised(length: 2)}",
                                          style: context.textTheme.overline!
                                              .copyWith(
                                                  color:
                                                      kPrimaryLightTextColor),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(CupertinoIcons.cart_badge_plus,
                                            color: kPrimaryLightTextColor,
                                            size: 20)
                                        .pOnly(left: 10)
                                  ],
                                ).px(10),
                              ).cornerRadius(10).onInkTap(() async {
                                if (productDetailsState is ProductLoadedState) {
                                  if (productDetailsState.productModel.variants!
                                              .attributes !=
                                          null
                                      ? _formKey.currentState!.validate()
                                      : true) {
                                    toast(LocaleKeys.please_wait.tr());
                                    context
                                        .read(cartNotifierProvider.notifier)
                                        .addToCart(
                                            context,
                                            productDetailsState
                                                .productModel.data!.slug,
                                            _quantity,
                                            productDetailsState
                                                .productModel.shippingCountryId,
                                            productDetailsState.productModel
                                                .shippingOptions!.first.id,
                                            productDetailsState
                                                .productModel
                                                .shippingOptions!
                                                .first
                                                .shippingZoneId);
                                  }
                                }
                              }),
                            ],
                          ),
                        ),
                        replacement: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
