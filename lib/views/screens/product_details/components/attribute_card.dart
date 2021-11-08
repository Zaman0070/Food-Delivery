import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/data/models/product/product_details_model.dart';
import 'package:zcart/riverpod/providers/product_provider.dart';
import 'package:zcart/riverpod/providers/product_slug_list_provider.dart';
import 'package:zcart/riverpod/state/product/product_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/custom_dropdownfield.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttributeCard extends StatefulWidget {
  const AttributeCard({
    required this.productModel,
    required this.quantity,
    required this.increaseQuantity,
    required this.decreaseQuantity,
    this.formKey,
  });

  final ProductDetailsModel productModel;
  final int? quantity;
  final VoidCallback increaseQuantity;
  final VoidCallback decreaseQuantity;
  final GlobalKey? formKey;

  @override
  _AttributeCardState createState() => _AttributeCardState();
}

class _AttributeCardState extends State<AttributeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
          ? kDarkCardBgColor
          : kLightColor,
      child: Column(
        children: [
          /// Quantity
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(LocaleKeys.quantity.tr(),
                      style: context.textTheme.bodyText2),
                  Text(
                      "(${widget.productModel.data!.stockQuantity} ${LocaleKeys.in_stock.tr()})",
                      style: context.textTheme.overline),
                ],
              ),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                buttonPadding: EdgeInsets.only(left: 10),
                buttonMinWidth: 30,
                buttonHeight: 20,
                children: <Widget>[
                  OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            EasyDynamicTheme.of(context).themeMode ==
                                    ThemeMode.dark
                                ? kDarkBgColor
                                : kLightBgColor),
                        foregroundColor: MaterialStateProperty.all(
                            EasyDynamicTheme.of(context).themeMode ==
                                    ThemeMode.dark
                                ? kPrimaryLightTextColor
                                : kPrimaryDarkTextColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                      ),
                      child: Icon(Icons.remove),
                      onPressed: widget.quantity ==
                              widget.productModel.data!.minOrderQuantity
                          ? () {
                              toast(
                                LocaleKeys.reached_minimum_quantity.tr(),
                              );
                            }
                          : widget.decreaseQuantity),
                  OutlinedButton(
                    child: Text(
                      widget.quantity.toString(),
                      style: context.textTheme.subtitle2,
                    ),
                    onPressed: null,
                  ),
                  OutlinedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              EasyDynamicTheme.of(context).themeMode ==
                                      ThemeMode.dark
                                  ? kDarkBgColor
                                  : kLightBgColor),
                          foregroundColor: MaterialStateProperty.all(
                              EasyDynamicTheme.of(context).themeMode ==
                                      ThemeMode.dark
                                  ? kPrimaryLightTextColor
                                  : kPrimaryDarkTextColor),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      child: Icon(Icons.add),
                      onPressed: widget.quantity ==
                              widget.productModel.data!.stockQuantity
                          ? () {
                              toast(LocaleKeys.reached_maximum_quantity.tr(),
                                  gravity: ToastGravity.CENTER,
                                  bgColor: kPrimaryColor.withOpacity(0.70));
                            }
                          : widget.increaseQuantity),
                ],
              ),
            ],
          ).px(10).py(5),

          /// Attribute field
          if (widget.productModel.variants!.attributes != null)
            Form(
              key: widget.formKey,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      widget.productModel.variants!.attributes!.values.length,
                  itemBuilder: (context, index) {
                    return ProviderListener<ProductVariantState>(
                      provider: productVariantNotifierProvider,
                      onChange: (context, state) {
                        if (state is ProductVariantLoadedState) {
                          // TODO: Need to find a better solution (Looks ugly)
                          context
                              .read(productSlugListProvider.notifier)
                              .removeProductSlug();
                          context
                              .read(productSlugListProvider.notifier)
                              .addProductSlug(
                                  state.productVariantDetails!.slug);

                          widget.productModel.data!.id =
                              state.productVariantDetails!.id;
                          widget.productModel.data!.slug =
                              state.productVariantDetails!.slug;
                          widget.productModel.data!.title =
                              state.productVariantDetails!.title;
                          widget.productModel.data!.condition =
                              state.productVariantDetails!.condition;
                          widget.productModel.data!.keyFeatures =
                              state.productVariantDetails!.keyFeatures;
                          widget.productModel.data!.stockQuantity =
                              state.productVariantDetails!.stockQuantity;
                          widget.productModel.data!.hasOffer =
                              state.productVariantDetails!.hasOffer;
                          widget.productModel.data!.rawPrice =
                              state.productVariantDetails!.rawPrice;
                          widget.productModel.data!.currency =
                              state.productVariantDetails!.currency;
                          widget.productModel.data!.currencySymbol =
                              state.productVariantDetails!.currencySymbol;
                          widget.productModel.data!.price =
                              state.productVariantDetails!.price;
                          widget.productModel.data!.offerPrice =
                              state.productVariantDetails!.offerPrice;
                          widget.productModel.data!.discount =
                              state.productVariantDetails!.discount;
                          widget.productModel.data!.freeShipping =
                              state.productVariantDetails!.freeShipping;
                          widget.productModel.data!.minOrderQuantity =
                              state.productVariantDetails!.minOrderQuantity;
                          widget.productModel.data!.rating =
                              state.productVariantDetails!.rating;
                          widget.productModel.data!.imageId =
                              state.productVariantDetails!.imageId;
                          state.productVariantDetails!.attributes!.forEach(
                            (element) => widget.productModel.data!.attributes!
                                .add(Attribute.fromJson(element.toJson())),
                          );
                          context
                              .read(productNotifierProvider.notifier)
                              .updateState(widget.productModel);
                        }
                      },
                      child: AttributeDropdownField(
                        productModel: widget.productModel,
                        index: index,
                      ),
                    );
                  }),
            ),
        ],
      ),
    ).cornerRadius(10);
  }
}

class AttributeDropdownField extends StatefulWidget {
  final ProductDetailsModel? productModel;
  final int? index;

  const AttributeDropdownField({Key? key, this.productModel, this.index})
      : super(key: key);

  @override
  _AttributeDropdownFieldState createState() => _AttributeDropdownFieldState();
}

class _AttributeDropdownFieldState extends State<AttributeDropdownField> {
  TextEditingController controller = TextEditingController();
  int selectedAttributeIndex = 0;
  bool isOnceSet = false;

  @override
  Widget build(BuildContext context) {
    if (!isOnceSet) {
      if (widget.index! < widget.productModel!.data!.attributes!.length) {
        var key = widget.productModel!.data!.attributes!
            .toList()[widget.index!]
            .value;

        if (widget.productModel!.variants!.attributes!.values
                .toList()[widget.index!]
                .value!
                .keys
                .toList()
                .indexOf(key.toString()) !=
            -1) {
          controller.text = widget.productModel!.variants!.attributes!.values
                  .toList()[widget.index!]
                  .value!
                  .values
                  .toList()[
              widget.productModel!.variants!.attributes!.values
                  .toList()[widget.index!]
                  .value!
                  .keys
                  .toList()
                  .indexOf(key.toString())];
        }
      }
      isOnceSet = true;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            flex: 2,
            child: Text(
              widget.productModel!.variants!.attributes!.values
                  .toList()[widget.index!]
                  .name!,
              style: context.textTheme.bodyText1,
            ).pOnly(left: 5)),
        Flexible(
          flex: 3,
          child: CustomDropDownField(
            isProductDetailsView: true,
            controller: controller,
            optionsList: widget.productModel!.variants!.attributes!.values
                .toList()[widget.index!]
                .value!
                .values
                .toList(),
            isCallback: true,
            callbackFunction: (index) {
              toast(LocaleKeys.please_wait.tr(), gravity: ToastGravity.TOP);
              context
                  .read(productVariantNotifierProvider.notifier)
                  .getProductVariantDetails(
                      widget.productModel!.data!.slug,
                      widget.productModel!.variants!.attributes!.keys
                          .elementAt(widget.index!),
                      widget.productModel!.variants!.attributes!.values
                          .toList()[widget.index!]
                          .value!
                          .values
                          .toList()[index]);
            },
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Select variant';
              }
              return null;
            },
          ),
        ),
      ],
    ).px(5).py(5);
  }
}
