import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/data/controller/chat/chat_controller.dart';
import 'package:zcart/data/controller/chat/chat_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/tabs/account_tab/messages/vendor_chat_screen.dart';
import 'package:zcart/views/shared_widgets/loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final conversationState = watch(conversationProvider);
        return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.messages.tr()),
              centerTitle: true,
              elevation: 0,
            ),
            body: conversationState is ConversationLoadedState
                ? conversationState.conversationModel.data!.length == 0
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info_outline),
                            const SizedBox(height: 10),
                            Text(LocaleKeys.empty_inbox.tr())
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount:
                            conversationState.conversationModel.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              tileColor: Colors.transparent,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16),
                              leading: Image.network(
                                conversationState.conversationModel.data![index]
                                    .shop!.image!,
                                errorBuilder: (BuildContext _, Object error,
                                    StackTrace? stack) {
                                  return Container();
                                },
                                width: context.screenWidth * 0.20,
                                fit: BoxFit.cover,
                              ).p(5),
                              title: Text(
                                  conversationState.conversationModel
                                      .data![index].shop!.name!,
                                  style: context.textTheme.bodyText2!),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(CupertinoIcons.chevron_forward),
                              ),
                            ),
                          ).onInkTap(() async {
                            context.nextPage(VendorChatScreen(
                                shopId: conversationState
                                    .conversationModel.data![index].shop!.id,
                                shopImage: conversationState
                                    .conversationModel.data![index].shop!.image,
                                shopName: conversationState
                                    .conversationModel.data![index].shop!.name,
                                shopVerifiedText: conversationState
                                    .conversationModel
                                    .data![index]
                                    .shop!
                                    .verifiedText));
                            await context
                                .read(productChatProvider.notifier)
                                .productConversation(
                                  conversationState
                                      .conversationModel.data![index].shop!.id,
                                );
                          });
                        }).pOnly(top: 5)
                : Center(child: LoadingWidget()));
      },
    );
  }
}
