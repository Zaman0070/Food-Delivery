import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/custom_button.dart';
import 'package:zcart/views/shared_widgets/custom_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    return Scaffold(
        body: Container(
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(236, 17, 106, 0.9700922605370274),
            Color.fromRGBO(252, 91, 18, 0.9700922605370274)
          ])),
      // decoration: BoxDecoration(
      //     color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
      //         ? kDarkCardBgColor
      //         : kLightColor,
      //     borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: BackButton(
                  color: Colors.white,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              LocaleKeys.reset_password.tr(),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ).py(10),
            CustomTextField(
              controller: _emailController,
              color: kLightCardBgColor,
              title: LocaleKeys.your_email.tr(),
              hintText: LocaleKeys.your_email.tr(),
              validator: (value) =>
                  value!.isEmpty ? LocaleKeys.field_required.tr() : null,
              widthMultiplier: 1,
            ).py(10),
            CustomButton(
                buttonText: LocaleKeys.send_reset_link.tr(),
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    hideKeyboard(context);
                    context
                        .read(userNotifierProvider.notifier)
                        .forgotPassword(_emailController.text.trim());
                    context.pop();
                  }
                }),
          ],
        ),
      ),
    ));
  }
}
