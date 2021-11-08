import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class PasswordUpdate extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
          ? kDarkCardBgColor
          : kLightColor,
      width: context.screenWidth,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(LocaleKeys.your_password.tr(),
                        style: context.textTheme.headline6!)
                    .pOnly(bottom: 10),
                ElevatedButton(
                    onPressed: () async {
                      toast(LocaleKeys.please_wait.tr());
                      if (_formKey.currentState!.validate()) {
                        hideKeyboard(context);
                        context
                            .read(userNotifierProvider.notifier)
                            .updatePassword(
                                oldPasswordController.text.trim(),
                                newPasswordController.text.trim(),
                                confirmPasswordController.text.trim());
                        oldPasswordController.clear();
                        newPasswordController.clear();
                        confirmPasswordController.clear();
                      }
                    },
                    child: Text(LocaleKeys.update.tr())),
              ],
            ),
            CustomTextField(
              color: kLightCardBgColor,
              title: LocaleKeys.old_password.tr(),
              hintText: LocaleKeys.old_password.tr(),
              isPassword: true,
              controller: oldPasswordController,
              widthMultiplier: 1,
            ),
            CustomTextField(
              color: kLightCardBgColor,
              title: LocaleKeys.new_password.tr(),
              hintText: LocaleKeys.new_password.tr(),
              isPassword: true,
              controller: newPasswordController,
              widthMultiplier: 1,
            ),
            CustomTextField(
              color: kLightCardBgColor,
              title: LocaleKeys.your_confirm_password.tr(),
              hintText: LocaleKeys.your_confirm_password.tr(),
              isPassword: true,
              controller: confirmPasswordController,
              widthMultiplier: 1,
            ),
          ],
        ).p(10),
      ),
    );
  }
}
