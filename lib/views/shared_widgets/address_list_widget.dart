import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/models/address/address_model.dart';
import 'package:zcart/data/models/cart/cart_item_details_model.dart';
import 'package:zcart/data/network/network_utils.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/views/screens/tabs/account_tab/account/edit_address_screen.dart';
import 'package:zcart/Theme/styles/colors.dart';

import 'package:velocity_x/velocity_x.dart';

class AddressListBuilder extends StatefulWidget {
  final List<Addresses>? addressesList;
  final CartItemDetails? cartItem;
  final Function(int)? onPressedCheckBox;

  const AddressListBuilder(
      {this.addressesList, this.cartItem, this.onPressedCheckBox});

  @override
  _AddressListBuilderState createState() => _AddressListBuilderState();
}

class _AddressListBuilderState extends State<AddressListBuilder> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 5),
        itemCount: widget.addressesList!.length,
        itemBuilder: (context, index) {
          return Container(
              color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                  ? kDarkCardBgColor
                  : kLightColor,
              child: ListTile(
                onTap: () {
                  if (widget.cartItem != null) {
                    if (accessAllowed) {
                      //TODO: Add Address For Guest TO Order - Country is not working
                      //TODO: Create Addresses for guests
                      widget.onPressedCheckBox!(index);
                      context
                          .read(cartItemDetailsNotifierProvider.notifier)
                          .updateCart(widget.cartItem!.id,
                              countryId:
                                  widget.addressesList![index].country!.id);
                      context
                          .read(checkoutNotifierProvider.notifier)
                          .addressId = widget.addressesList![index].id;
                      context
                              .read(checkoutNotifierProvider.notifier)
                              .shippingAddress =
                          widget.addressesList![index].addressLine1! +
                              ',' +
                              widget.addressesList![index].addressLine2! +
                              ',' +
                              widget.addressesList![index].city!;
                    } else {
                      //TODO: Need to Solve Guest Address problem
                      widget.onPressedCheckBox!(index);
                      context
                          .read(cartItemDetailsNotifierProvider.notifier)
                          .updateCart(
                            widget.cartItem!.id,
                          );

                      context
                              .read(checkoutNotifierProvider.notifier)
                              .shippingAddress =
                          widget.addressesList![index].addressLine1! +
                              ',' +
                              widget.addressesList![index].addressLine2! +
                              ',' +
                              widget.addressesList![index].city! +
                              ',' +
                              widget.addressesList![index].zipCode!;
                      ;
                    }
                    setState(() {
                      selectedIndex = index;
                    });
                  }
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.addressesList![index].addressType!,
                        style: context.textTheme.bodyText2!
                            .copyWith(color: kPrimaryColor)),
                    Text(widget.addressesList![index].addressTitle!,
                        style: context.textTheme.subtitle2),
                    Text('(${widget.addressesList![index].phone})',
                        style: context.textTheme.subtitle2),
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${widget.addressesList![index].addressLine1}, ${widget.addressesList![index].addressLine2}',
                        style: context.textTheme.caption),
                    Text(
                        '${widget.addressesList![index].state != null ? widget.addressesList![index].state!.name! + ',' : ''} ${widget.addressesList![index].country == null ? '' : widget.addressesList![index].country!.name! + ','} ${widget.addressesList![index].zipCode}'
                            .trim(),
                        style: context.textTheme.caption),
                  ],
                ),
                trailing: widget.cartItem != null
                    ? index == selectedIndex
                        ? Icon(Icons.check_circle, color: kPrimaryColor)
                        : Icon(
                            Icons.radio_button_unchecked,
                            color: EasyDynamicTheme.of(context).themeMode ==
                                    ThemeMode.dark
                                ? kLightColor
                                : kDarkBgColor,
                          )
                    : IconButton(
                        onPressed: () {
                          context
                              .read(countryNotifierProvider.notifier)
                              .getCountries();
                          context.nextPage(
                            EditAddressScreen(
                                address: widget.addressesList![index]),
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
              )).py(5).cornerRadius(10);
        });
  }
}
