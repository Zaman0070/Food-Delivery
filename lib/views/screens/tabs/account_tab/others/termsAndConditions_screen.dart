import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:zcart/data/controller/others/others_controller.dart';
import 'package:zcart/data/controller/others/terms_and_condition_state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class TermsAndConditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.terms_condition.tr()),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(
                builder: (context, watch, _) {
                  final termsAndConditionState =
                      watch(termsAndConditionProvider);
                  return termsAndConditionState is TermsAndConditionLoadedState
                      ? HtmlWidget(
                          termsAndConditionState
                              .termsAndConditionModel.data!.content!,
                          webView: true,
                        )
                      : termsAndConditionState is TermsAndConditionLoadingState
                          ? LoadingWidget()
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Icon(Icons.info_outline),
                                  const SizedBox(height: 10),
                                  Text(LocaleKeys.no_data_yet.tr())
                                ],
                              ),
                            );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
