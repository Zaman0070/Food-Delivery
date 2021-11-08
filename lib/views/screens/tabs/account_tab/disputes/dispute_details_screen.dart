import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/riverpod/providers/dispute_provider.dart';
import 'package:zcart/riverpod/state/dispute/dispute_details_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/tabs/account_tab/disputes/dispute_responses.dart';
import 'package:zcart/views/shared_widgets/custom_button.dart';
import 'package:zcart/views/shared_widgets/custom_textfield.dart';
import 'package:zcart/views/shared_widgets/loading_widget.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';

class DisputeDetailsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final disputeDetailsState = watch(disputeDetailsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.dispute_details.tr()),
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
      ),
      body: disputeDetailsState is DisputeDetailsLoadedState
          ? SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
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
                              CustomButton(
                                buttonText:
                                    disputeDetailsState.disputeDetails!.status,
                                buttonBGColor: disputeDetailsState
                                            .disputeDetails!.status ==
                                        "SOLVED"
                                    ? kGreenColor
                                    : kPrimaryColor,
                                widthMultiplier: 1,
                              ),
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
                                              "${LocaleKeys.reason.tr()} : ")),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                              disputeDetailsState
                                                  .disputeDetails!.reason!,
                                              style:
                                                  context.textTheme.subtitle2)),
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
                                              "${LocaleKeys.updated_at.tr()} : ")),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                              disputeDetailsState
                                                  .disputeDetails!.updatedAt!,
                                              style:
                                                  context.textTheme.subtitle2)),
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
                                              "${LocaleKeys.description.tr()} : ")),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                              disputeDetailsState
                                                      .disputeDetails!
                                                      .description ??
                                                  LocaleKeys.not_available.tr(),
                                              style:
                                                  context.textTheme.subtitle2)),
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
                                              "${LocaleKeys.goods_received.tr()} : ")),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                              disputeDetailsState
                                                          .disputeDetails!
                                                          .goodsReceived ??
                                                      false
                                                  ? LocaleKeys.yes.tr()
                                                  : LocaleKeys.no.tr(),
                                              style:
                                                  context.textTheme.subtitle2)),
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
                                              "${LocaleKeys.return_goods.tr()} : ")),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                              disputeDetailsState
                                                          .disputeDetails!
                                                          .returnGoods ??
                                                      false
                                                  ? LocaleKeys.yes.tr()
                                                  : LocaleKeys.no.tr(),
                                              style:
                                                  context.textTheme.subtitle2)),
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
                                              "${LocaleKeys.refund_amount.tr()} : ")),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                              disputeDetailsState
                                                      .disputeDetails!
                                                      .refundAmount ??
                                                  LocaleKeys.not_available.tr(),
                                              style:
                                                  context.textTheme.subtitle2)),
                                    ],
                                  ),
                                ],
                              ).pOnly(top: 10),
                              _disputeDetailsButtons(
                                      disputeDetailsState, context)
                                  .pOnly(top: 10),
                            ],
                          ),
                        ),
                      ).cornerRadius(10),
                      Container(
                        color: EasyDynamicTheme.of(context).themeMode ==
                                ThemeMode.dark
                            ? kDarkCardBgColor
                            : kLightColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  disputeDetailsState
                                      .disputeDetails!.shop!.image!,
                                  errorBuilder: (BuildContext _, Object error,
                                      StackTrace? stack) {
                                    return Container();
                                  },
                                  height: 50,
                                  width: 50,
                                ).p(10),
                                Text(
                                  disputeDetailsState
                                      .disputeDetails!.shop!.name!,
                                  style: context.textTheme.headline6!,
                                ),
                                disputeDetailsState
                                        .disputeDetails!.shop!.verified!
                                    ? Icon(Icons.check_circle,
                                            color: kPrimaryColor, size: 15)
                                        .px2()
                                        .pOnly(top: 3)
                                    : Container()
                              ],
                            ),
                            Divider(),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                itemCount: disputeDetailsState.disputeDetails!
                                    .orderDetails!.items!.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Image.network(
                                      disputeDetailsState.disputeDetails!
                                          .orderDetails!.items![index].image!,
                                      errorBuilder: (BuildContext _,
                                          Object error, StackTrace? stack) {
                                        return Container();
                                      },
                                    ),
                                    title: Text(disputeDetailsState
                                        .disputeDetails!
                                        .orderDetails!
                                        .items![index]
                                        .description!),
                                    subtitle: Text(
                                      disputeDetailsState
                                          .disputeDetails!
                                          .orderDetails!
                                          .items![index]
                                          .unitPrice!,
                                      style: context.textTheme.subtitle2!
                                          .copyWith(color: kPrimaryColor),
                                    ),
                                    trailing: Text('x ' +
                                        disputeDetailsState
                                            .disputeDetails!
                                            .orderDetails!
                                            .items![index]
                                            .quantity
                                            .toString()),
                                  );
                                })
                          ],
                        ),
                      ).cornerRadius(10).py(10),
                    ],
                  )),
            )
          : LoadingWidget(),
    );
  }

  Row _disputeDetailsButtons(
      DisputeDetailsLoadedState disputeDetailsState, BuildContext context) {
    TextEditingController _appealTextController = TextEditingController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Wrap(
            //runSpacing: 5.0,
            spacing: 10.0,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  LocaleKeys.responses.tr(),
                  style: TextStyle(color: kLightColor),
                ),
              ).onInkTap(() {
                print(disputeDetailsState.disputeDetails!.replies);
                context.nextPage(DisputeResponseScreen());
              }),
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  disputeDetailsState.disputeDetails!.closed!
                      ? LocaleKeys.appeal.tr()
                      : LocaleKeys.mark_as_solved.tr(),
                  style: TextStyle(color: kLightColor),
                ).onInkTap(() {
                  if (!disputeDetailsState.disputeDetails!.closed!) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(LocaleKeys.close_dispute.tr()),
                            content: Text(LocaleKeys.are_you_sure.tr()),
                            actions: [
                              TextButton(
                                child: Text(LocaleKeys.yes.tr()),
                                onPressed: () {
                                  context
                                      .read(disputesProvider.notifier)
                                      .markAsSolved(disputeDetailsState
                                          .disputeDetails!.id)
                                      .then((value) {
                                    context.pop();
                                    context.pop();
                                  });
                                },
                              )
                            ],
                          );
                        });
                  } else {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            // child: Center(
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       GestureDetector(
                            //         onTap: () {
                            //           //TODO: Attach Images
                            //         },
                            //         child: Container(
                            //           height: 30,
                            //           width: 30,
                            //           decoration: BoxDecoration(
                            //               color: kPrimaryColor,
                            //               borderRadius:
                            //                   BorderRadius.circular(30)),
                            //           child: Icon(Icons.image,
                            //               color: kLightColor, size: 20),
                            //         ),
                            //       ),
                            //       SizedBox(width: 10),

                            //     ],
                            //   ),
                            // ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20),
                                CustomTextField(
                                  title: LocaleKeys.appeal.tr(),
                                  controller: _appealTextController,
                                  hintText: LocaleKeys.appeal_message.tr(),
                                  color:
                                      EasyDynamicTheme.of(context).themeMode ==
                                              ThemeMode.dark
                                          ? kDarkBgColor
                                          : kLightCardBgColor,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          //TODO: Attach Images
                                        },
                                        child:
                                            Text(LocaleKeys.attach_files.tr())),
                                    ElevatedButton(
                                        onPressed: () {
                                          if (!_appealTextController
                                              .text.isEmpty) {
                                            context
                                                .read(disputeDetailsProvider
                                                    .notifier)
                                                .postDisputeAppeal(
                                              disputeDetailsState
                                                  .disputeDetails!.id,
                                              {
                                                'reply': _appealTextController
                                                    .text
                                                    .trim()
                                              },
                                            ).then((value) => context.pop());
                                          } else {
                                            toast(LocaleKeys
                                                .message_cannot_be_empty
                                                .tr());
                                          }
                                        },
                                        child:
                                            Text(LocaleKeys.send_appeal.tr())),
                                  ],
                                )
                              ],
                            ),
                          );
                        });
                  }
                }),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//  {
//                           return AlertDialog(
//                             title: Text("Appeal Dispute"),
//                             content: Row(
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//
//                                   },
//                                   child: Container(
//                                     height: 30,
//                                     width: 30,
//                                     decoration: BoxDecoration(
//                                         color: kPrimaryColor,
//                                         borderRadius:
//                                             BorderRadius.circular(30)),
//                                     child: Icon(Icons.image,
//                                         color: kLightColor, size: 20),
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 CustomTextField(
//                                   controller: _appealTextController,
//                                   hintText: "Appeal Message",
//                                   color: kCardBgColor,
//                                 ),
//                               ],
//                             ),
//                             actions: [
//                               TextButton(
//                                 child: Text("Send"),
//                                 onPressed: () {
//
//                                 },
//                               )
//                             ],
//                           );
//                         };