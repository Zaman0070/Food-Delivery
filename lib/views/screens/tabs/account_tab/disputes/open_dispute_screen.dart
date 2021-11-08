import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/riverpod/providers/dispute_provider.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/riverpod/state/dispute/dispute_info_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:nb_utils/nb_utils.dart';

class OpenDisputeScreen extends StatefulWidget {
  @override
  _OpenDisputeScreenState createState() => _OpenDisputeScreenState();
}

class _OpenDisputeScreenState extends State<OpenDisputeScreen> {
  bool showItemsDropdownField = false;
  bool selected = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController disputeReasonController = TextEditingController();
  final TextEditingController goodsReceivedConfirmationController =
      TextEditingController();
  final TextEditingController refundAmountController = TextEditingController();
  final TextEditingController productController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.open_a_dispute.tr()),
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final disputeInfoState = watch(disputeInfoProvider);
          return disputeInfoState is DisputeInfoLoadedState
              ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          /// Order details
                          Container(
                            color: EasyDynamicTheme.of(context).themeMode ==
                                    ThemeMode.dark
                                ? kDarkCardBgColor
                                : kLightColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('\n${LocaleKeys.order_details.tr()}\n',
                                      style: context.textTheme.subtitle2),
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  "${LocaleKeys.order_number.tr()}: ")),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                  disputeInfoState.disputeInfo!
                                                      .orderNumber!,
                                                  style: context
                                                      .textTheme.subtitle2)),
                                        ],
                                      ),
                                      const SizedBox(height: 9),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  "${LocaleKeys.order_status.tr()}: ")),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                  disputeInfoState.disputeInfo!
                                                      .orderStatus!,
                                                  style: context
                                                      .textTheme.subtitle2)),
                                        ],
                                      ),
                                      const SizedBox(height: 9),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  "${LocaleKeys.amount_paid.tr()}: ")),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                  disputeInfoState
                                                      .disputeInfo!.total!,
                                                  style: context
                                                      .textTheme.subtitle2)),
                                        ],
                                      ),
                                      const SizedBox(height: 9),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ).cornerRadius(10).pOnly(bottom: 10),

                          /// Open dispute
                          Container(
                            color: EasyDynamicTheme.of(context).themeMode ==
                                    ThemeMode.dark
                                ? kDarkCardBgColor
                                : kLightColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('\n${LocaleKeys.open_dispute.tr()}\n',
                                      style: context.textTheme.subtitle2),
                                  CustomDropDownField(
                                    title:
                                        LocaleKeys.select_dispute_reason.tr(),
                                    optionsList: disputeInfoState
                                        .disputeInfo!.disputeType!.values
                                        .toList(),
                                    value: "Select",
                                    isCallback: true,
                                    controller: disputeReasonController,
                                    widthMultiplier: 1,
                                    callbackFunction: (int disputeValueIndex) {
                                      context
                                              .read(openDisputeInfoProvider
                                                  .notifier)
                                              .disputeType =
                                          disputeInfoState
                                              .disputeInfo!.disputeType!.keys
                                              .toList()[disputeValueIndex];
                                    },
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return LocaleKeys.field_required.tr();
                                      }
                                      return null;
                                    },
                                  ),
                                  CustomDropDownField(
                                    title:
                                        LocaleKeys.have_you_received_goods.tr(),
                                    optionsList: [
                                      LocaleKeys.no.tr(),
                                      LocaleKeys.yes.tr(),
                                    ],
                                    value: "Select",
                                    controller:
                                        goodsReceivedConfirmationController,
                                    isCallback: true,
                                    widthMultiplier: 1,
                                    callbackFunction: (id) {
                                      /* NO - 0, YES - 1*/
                                      setState(() {
                                        showItemsDropdownField = (id == 1);
                                        context
                                            .read(openDisputeInfoProvider
                                                .notifier)
                                            .orderReceived = id.toString();
                                        if (!showItemsDropdownField)
                                          selected = false;
                                      });
                                    },
                                    validator: (text) {
                                      if (text == null || text.isEmpty) {
                                        return LocaleKeys.field_required.tr();
                                      }

                                      return null;
                                    },
                                  ),
                                  Visibility(
                                    visible: showItemsDropdownField,
                                    child: CustomDropDownField(
                                      title: LocaleKeys.select_product.tr(),
                                      optionsList: disputeInfoState
                                          .disputeInfo!.items!.values
                                          .toList(),
                                      value: "Select",
                                      controller: productController,
                                      widthMultiplier: 1,
                                      isCallback: true,
                                      callbackFunction:
                                          (int productValueIndex) {
                                        context
                                                .read(openDisputeInfoProvider
                                                    .notifier)
                                                .productId =
                                            disputeInfoState
                                                .disputeInfo!.items!.keys
                                                .toList()[productValueIndex];
                                      },
                                      validator: (text) {
                                        if (text == null || text.isEmpty) {
                                          return LocaleKeys.field_required.tr();
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Visibility(
                                      visible: showItemsDropdownField,
                                      child: ListTile(
                                        dense: true,
                                        minLeadingWidth: 0,
                                        horizontalTitleGap: 5,
                                        contentPadding: EdgeInsets.zero,
                                        leading: selected
                                            ? Icon(
                                                Icons.check_circle,
                                                color: kPrimaryColor,
                                              )
                                            : Icon(
                                                Icons.radio_button_unchecked),
                                        onTap: () {
                                          setState(() {
                                            selected = !selected;
                                          });
                                          /* NO - 0, YES - 1*/
                                          if (showItemsDropdownField)
                                            context
                                                    .read(
                                                        openDisputeInfoProvider
                                                            .notifier)
                                                    .returnGoods =
                                                selected == true ? '1' : '0';
                                        },
                                        title:
                                            Text(LocaleKeys.return_goods.tr()),
                                      )),
                                  Visibility(
                                      visible: selected,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 5.0),
                                        child: Text(
                                          LocaleKeys.open_dispute_note.tr(),
                                          style: context.textTheme.subtitle2!
                                              .copyWith(color: kPrimaryColor),
                                        ),
                                      )),
                                  CustomTextField(
                                    color: kLightCardBgColor,
                                    title: LocaleKeys.refund_amount.tr(),
                                    hintText: LocaleKeys.refund_amount.tr(),
                                    controller: refundAmountController,
                                    widthMultiplier: 1,
                                    validator: (value) {
                                      if (value
                                          .toString()
                                          .isNotBlank) if (double.parse(
                                              value!) >
                                          double.parse(disputeInfoState
                                              .disputeInfo!.totalRaw!
                                              .split('\$')
                                              .last)) {
                                        return LocaleKeys
                                            .refund_amount_validation
                                            .tr(args: [
                                          "${disputeInfoState.disputeInfo!.totalRaw}"
                                        ]);
                                      }
                                      context
                                          .read(
                                              openDisputeInfoProvider.notifier)
                                          .refundAmount = value;
                                      return null;
                                    },
                                  ),
                                  CustomTextField(
                                    color: kLightCardBgColor,
                                    title: LocaleKeys.description.tr(),
                                    hintText: LocaleKeys.description.tr(),
                                    controller: descriptionController,
                                    widthMultiplier: 1,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return LocaleKeys.field_required.tr();
                                      }
                                      context
                                          .read(
                                              openDisputeInfoProvider.notifier)
                                          .description = value;
                                      return null;
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              toast(
                                                  LocaleKeys.please_wait.tr());
                                              context
                                                  .read(openDisputeInfoProvider
                                                      .notifier)
                                                  .getOpenDispute(
                                                      disputeInfoState
                                                          .disputeInfo!.id)
                                                  .then((value) {
                                                toast(LocaleKeys.dispute_opened
                                                    .tr());
                                                context
                                                    .read(disputesProvider
                                                        .notifier)
                                                    .getDisputes();
                                                context
                                                    .read(
                                                        ordersProvider.notifier)
                                                    .orders(
                                                        ignoreLoadingState:
                                                            true);
                                                context.pop();
                                              });
                                            }
                                          },
                                          child: Text(
                                              LocaleKeys.open_a_dispute.tr())),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ).cornerRadius(10).pOnly(bottom: 10),

                          /// How to open a dispute
                          Container(
                            color: EasyDynamicTheme.of(context).themeMode ==
                                    ThemeMode.dark
                                ? kDarkCardBgColor
                                : kLightColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '\n${LocaleKeys.how_to_open_dispute.tr()}\n',
                                      style: context.textTheme.subtitle2),
                                  Text('${LocaleKeys.first_step.tr()}:',
                                      style: context.textTheme.subtitle2),
                                  Text(
                                    '${LocaleKeys.dispute_first_step.tr()}\n',
                                    style: context.textTheme.subtitle2,
                                  ),
                                  Text('${LocaleKeys.second_step.tr()}:',
                                      style: context.textTheme.subtitle2),
                                  Text(
                                    '''${LocaleKeys.dispute_second_step.tr()}''',
                                    style: context.textTheme.subtitle2,
                                  ),
                                  Text('${LocaleKeys.third_step.tr()}:',
                                      style: context.textTheme.subtitle2),
                                  Text(
                                    '${LocaleKeys.dispute_third_step.tr()}\n',
                                    style: context.textTheme.subtitle2,
                                  ),
                                ],
                              ),
                            ),
                          ).cornerRadius(10),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(child: LoadingWidget().center()).center();
        },
      ),
    );
  }
}
