import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:zcart/data/controller/chat/chat_controller.dart';
import 'package:zcart/data/controller/chat/chat_state.dart';
import 'package:zcart/data/models/chat/order/order_chat_model.dart';
import 'package:zcart/data/models/orders/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderChatScreen extends StatelessWidget {
  final Orders orders;
  OrderChatScreen({
    Key? key,
    required this.orders,
  }) : super(key: key);

  /// Controller
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor:
            EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                ? kDarkCardBgColor
                : kLightColor,
        actions: [
          IconButton(
            onPressed: () async {
              await context
                  .read(orderChatProvider.notifier)
                  .orderConversation(orders.id, update: true);
            },
            icon: Icon(Icons.refresh),
          )
        ],
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),

                SizedBox(width: 20),
                Container(
                  width: 20,
                  height: 20,
                  child: Image.network(
                    orders.shop!.image!,
                    errorBuilder:
                        (BuildContext _, Object error, StackTrace? stack) {
                      return Container();
                    },
                  ),
                ),
                SizedBox(width: 20),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        LocaleKeys.order_chat.tr(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 6),
                      Text(
                        orders.shop!.name!,
                        style: context.textTheme.caption!
                            .copyWith(color: kFadeColor),
                      ),
                    ],
                  ),
                ),
                //Icon(Icons.settings, color: kDarkColor54),
              ],
            ),
          ),
        ),
      ),
      body: _chatBody(context),
    );
  }

  Widget _chatBody(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                    ? kDarkCardBgColor
                    : kLightColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    runSpacing: 10,
                    children: [
                      Text(
                        "${LocaleKeys.order_number.tr()} : \n${orders.orderNumber}",
                        textAlign: TextAlign.center,
                        style:
                            context.textTheme.overline!.copyWith(fontSize: 11),
                      ),
                      Text(
                        "${LocaleKeys.ordered_at.tr()} : \n${orders.orderDate}",
                        textAlign: TextAlign.center,
                        style:
                            context.textTheme.overline!.copyWith(fontSize: 11),
                      ),
                      Text(
                        "${LocaleKeys.order_status.tr()} : \n${orders.orderStatus}",
                        textAlign: TextAlign.center,
                        style:
                            context.textTheme.overline!.copyWith(fontSize: 11),
                      ),
                    ],
                  ).pOnly(top: 10, bottom: 10),
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer(builder: (context, watch, _) {
              final _orderChatProvider = watch(orderChatProvider);
              return _orderChatProvider is OrderChatInitialLoadedState
                  ? Container(
                      child: Center(
                        child: Text(
                          _orderChatProvider.orderChatInitialModel.message!,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : _orderChatProvider is OrderChatLoadedState
                      ? _chatLoadedBody(context, _orderChatProvider)
                      : LoadingWidget();
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 1, color: kAccentColor),
                      color: EasyDynamicTheme.of(context).themeMode ==
                              ThemeMode.dark
                          ? kDarkCardBgColor
                          : kLightColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            //TODO: Attach Images
                          },
                          icon: Icon(Icons.image),
                        ),
                        Expanded(
                          child: TextField(
                            controller: messageController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: LocaleKeys.type_a_message.tr(),
                              hintStyle: context.textTheme.caption,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: kPrimaryColor),
                  child: Icon(Icons.send, color: kLightColor),
                ).onInkTap(() {
                  if (messageController.text.isNotEmpty) {
                    String message = messageController.text.trim();
                    messageController.clear();
                    context
                        .read(orderChatSendProvider.notifier)
                        .sendMessage(
                            //TODO: Send attachement
                            orders.id,
                            message)
                        .then(
                      (value) {
                        messageController.clear();
                        context
                            .read(orderChatProvider.notifier)
                            .orderConversation(orders.id, update: true);
                      },
                    );
                  } else {
                    toast(LocaleKeys.empty_message.tr());
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatLoadedBody(
      BuildContext context, OrderChatLoadedState orderChatState) {
    List<Reply> _messageList = orderChatState.orderChatModel.data!.replies!;
    List<Reply> _reversedMessageList = _messageList.reversed.toList();
    return Container(
      child: orderChatState.orderChatModel.data!.replies!.isEmpty
          ? Column(
              children: [
                FirstMessageBox(
                  orderChatModel: orderChatState.orderChatModel,
                ).py(10),
                Expanded(child: SizedBox()),
              ],
            )
          : Container(
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: _reversedMessageList.map((message) {
                  return Column(
                    children: [
                      Visibility(
                        visible: _messageList.indexOf(message) == 0,
                        child: FirstMessageBox(
                          orderChatModel: orderChatState.orderChatModel,
                        ).py(10),
                      ),
                      Container(
                        padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 5),
                        child: Align(
                          alignment: (message.customer == null
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: context.screenWidth * 0.75),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: (message.customer == null
                                  ? EasyDynamicTheme.of(context).themeMode ==
                                          ThemeMode.dark
                                      ? kDarkCardBgColor
                                      : Colors.grey.shade200
                                  : kPrimaryColor.withOpacity(0.1)),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: message.customer == null
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              children: [
                                //TODO: Send Attachement
                                message.attachments!.isEmpty
                                    ? SizedBox()
                                    : Text(message.attachments.toString()),
                                HtmlWidget(message.reply!),
                                const SizedBox(height: 5),
                                message.customer != null
                                    ? Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(message.updatedAt!,
                                              style: TextStyle(fontSize: 10)),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            message.read == null
                                                ? Icons.watch_later_outlined
                                                : Icons.check,
                                            size: 14,
                                          )
                                        ],
                                      )
                                    : Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            message.read == null
                                                ? Icons.watch_later_outlined
                                                : Icons.check,
                                            size: 14,
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            message.updatedAt!,
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
    );
  }
}

class FirstMessageBox extends StatelessWidget {
  final OrderChatModel orderChatModel;
  const FirstMessageBox({
    Key? key,
    required this.orderChatModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: orderChatModel.data!.subject != null,
            child: Text(
              "${orderChatModel.data!.subject ?? "Hello"}",
              style: context.textTheme.caption!
                  .copyWith(color: kPrimaryLightTextColor),
            ).paddingBottom(5),
          ),
          HtmlWidget(
            orderChatModel.data!.message!,
            textStyle: TextStyle(color: kPrimaryLightTextColor),
            // style: TextStyle(color: kPrimaryLightTextColor),
          ).paddingBottom(5),

          //TODO: Attatchments
          Visibility(
            visible: orderChatModel.data!.attachments!.isNotEmpty,
            child: Text(
              "${orderChatModel.data!.attachments}",
              style: context.textTheme.caption!
                  .copyWith(color: kPrimaryLightTextColor),
            ).paddingBottom(5),
          ),
        ],
      ),
    );
  }
}
