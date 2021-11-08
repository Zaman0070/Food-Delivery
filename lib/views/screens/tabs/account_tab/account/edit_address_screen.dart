import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/data/models/address/address_model.dart';
import 'package:zcart/riverpod/providers/address_provider.dart';
import 'package:zcart/riverpod/state/address/country_state.dart';
import 'package:zcart/riverpod/state/address/states_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/custom_dropdownfield.dart';
import 'package:zcart/views/shared_widgets/custom_textfield.dart';
import 'package:zcart/views/shared_widgets/dropdown_field_loading_widget.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditAddressScreen extends StatefulWidget {
  final Addresses address;
  const EditAddressScreen({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  _EditAddressScreenState createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    addressTypeController.text = widget.address.addressType!;
    contactPersonController.text = widget.address.addressTitle!;
    contactNumberController.text = widget.address.phone!;
    zipCodeController.text = widget.address.zipCode!;
    addressLine1Controller.text = widget.address.addressLine1!;
    addressLine2Controller.text = widget.address.addressLine2!;
    cityController.text = widget.address.city!;

    super.initState();
  }

  final TextEditingController addressTypeController = TextEditingController();
  final TextEditingController contactPersonController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController statesController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  int? selectedCountryID;

  int? selectedStateID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(LocaleKeys.edit_address.tr()),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              await context
                  .read(addressRepositoryProvider)
                  .deleteAddress(widget.address.id);
              context.read(countryNotifierProvider.notifier).getCountries();
              context.read(addressNotifierProvider.notifier).fetchAddress();
              context.pop();
            },
            icon: Icon(
              CupertinoIcons.delete,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  color:
                      EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                          ? kDarkCardBgColor
                          : kLightColor,
                  width: context.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomDropDownField(
                        title: LocaleKeys.address_type.tr(),
                        optionsList: ["Primary", "Billing", "Shipping"],
                        value: widget.address.addressType,
                        controller: addressTypeController,
                        widthMultiplier: 1,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return LocaleKeys.field_required.tr();
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        color: kLightCardBgColor,
                        title: LocaleKeys.contact_person_name.tr(),
                        hintText: LocaleKeys.contact_person_name.tr(),
                        controller: contactPersonController,
                        widthMultiplier: 1,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return LocaleKeys.field_required.tr();
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        color: kLightCardBgColor,
                        title: LocaleKeys.contact_number.tr(),
                        hintText: LocaleKeys.contact_number.tr(),
                        controller: contactNumberController,
                        widthMultiplier: 1,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return LocaleKeys.field_required.tr();
                          }
                          return null;
                        },
                      ),
                      Consumer(
                        builder: (context, watch, _) {
                          final countryState = watch(countryNotifierProvider);
                          return countryState is CountryLoadedState
                              ? CustomDropDownField(
                                  title: LocaleKeys.country.tr(),
                                  optionsList: countryState.countryList!
                                      .map((e) => e.name)
                                      .toList(),
                                  controller: countryController,
                                  widthMultiplier: 1,
                                  isCallback: true,
                                  callbackFunction: (int countryId) {
                                    selectedCountryID =
                                        countryState.countryList![countryId].id;
                                    context
                                        .read(statesNotifierProvider.notifier)
                                        .getState(countryState
                                            .countryList![countryId].id);
                                  },
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please select a country';
                                    }
                                    return null;
                                  },
                                )
                              : countryState is CountryLoadingState
                                  ? FieldLoading()
                                  : Container();
                        },
                      ),
                      Consumer(
                        builder: (context, watch, _) {
                          final statesState = watch(statesNotifierProvider);
                          if (statesState is StatesLoadedState) {
                            selectedStateID =
                                statesState.statesList!.length == 0
                                    ? null
                                    : statesState.statesList![0].id;
                          }
                          return statesState is StatesLoadedState
                              ? CustomDropDownField(
                                  title: LocaleKeys.states.tr(),

                                  optionsList:
                                      statesState.statesList!.length == 0
                                          ? ["Select"]
                                          : statesState.statesList!
                                              .map((e) => e.name)
                                              .toList(),
                                  //value: "Select",
                                  controller: statesController,

                                  widthMultiplier: 1,
                                  isCallback: true,
                                  callbackFunction: (int stateId) {
                                    selectedStateID =
                                        statesState.statesList![stateId].id;
                                  },
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Please select a state';
                                    }
                                    return null;
                                  },
                                )
                              : statesState is StatesLoadingState
                                  ? FieldLoading()
                                  : Container();
                        },
                      ),
                      CustomTextField(
                        color: kLightCardBgColor,
                        title: LocaleKeys.zip_code.tr(),
                        hintText: LocaleKeys.zip_code.tr(),
                        controller: zipCodeController,
                        widthMultiplier: 1,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return LocaleKeys.field_required.tr();
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                          color: kLightCardBgColor,
                          title: LocaleKeys.address_line_1.tr(),
                          hintText: LocaleKeys.address_line_1.tr(),
                          controller: addressLine1Controller,
                          widthMultiplier: 1,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              if (addressLine2Controller.text.isEmpty) {
                                return LocaleKeys.field_required.tr();
                              }
                            }
                            return null;
                          }),
                      CustomTextField(
                        color: kLightCardBgColor,
                        title: LocaleKeys.address_line_2.tr(),
                        hintText: LocaleKeys.address_line_2.tr(),
                        controller: addressLine2Controller,
                        widthMultiplier: 1,
                        validator: (text) {
                          if (addressLine1Controller.text.isEmpty) {
                            if (text == null || text.isEmpty) {
                              return LocaleKeys.field_required.tr();
                            }
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        color: kLightCardBgColor,
                        title: LocaleKeys.city.tr(),
                        hintText: LocaleKeys.city.tr(),
                        controller: cityController,
                        widthMultiplier: 1,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return LocaleKeys.field_required.tr();
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  toast(LocaleKeys.please_wait.tr(),
                                      gravity: ToastGravity.CENTER,
                                      bgColor: kPrimaryColor);
                                  context
                                      .read(addressNotifierProvider.notifier)
                                      .editAddress(
                                        addressId: widget.address.id,
                                        addressType: addressTypeController.text,
                                        contactPerson:
                                            contactPersonController.text,
                                        contactNumber:
                                            contactNumberController.text,
                                        countryId: selectedCountryID == null
                                            ? widget.address.country!.id
                                                .toString()
                                            : selectedCountryID.toString(),
                                        stateId: selectedStateID == null
                                            ? widget.address.state == null
                                                ? null
                                                : widget.address.state!.id
                                                    .toString()
                                            : selectedStateID.toString(),
                                        cityId: cityController.text,
                                        addressLine1:
                                            addressLine1Controller.text,
                                        addressLine2:
                                            addressLine2Controller.text,
                                        zipCode: zipCodeController.text,
                                      );
                                  context
                                      .read(addressRepositoryProvider)
                                      .fetchAddresses();
                                  context.pop();
                                }
                              },
                              child: Text(LocaleKeys.update_address.tr())),
                        ],
                      ),
                    ],
                  ).p(10),
                ).cornerRadius(10).p(10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
