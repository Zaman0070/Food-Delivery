import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zcart/helper/get_formated_date.dart';
import 'package:zcart/riverpod/state/state.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/shared_widgets/shared_widgets.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class PersonalDetails extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? fullNameController;
  TextEditingController? nickNameController;
  TextEditingController? bioController;
  TextEditingController? emailController;

  DateTime? _dateOfBirth;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final userState = watch(userNotifierProvider);

      if (userState is UserLoadedState) {
        fullNameController = TextEditingController(text: userState.user!.name);
        nickNameController =
            TextEditingController(text: userState.user!.niceName);
        bioController =
            TextEditingController(text: userState.user!.description);
        emailController = TextEditingController(text: userState.user!.email);
        _dateOfBirth = getDateFormatedFromString(userState.user!.dob);

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
                    Text(LocaleKeys.basic_info.tr(),
                            style: context.textTheme.headline6!)
                        .pOnly(bottom: 10),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_dateOfBirth != null) {
                              hideKeyboard(context);
                              await context
                                  .read(userNotifierProvider.notifier)
                                  .updateUserInfo(
                                    fullNameController!.text.trim(),
                                    nickNameController!.text.trim(),
                                    bioController!.text.trim(),
                                    emailController!.text.trim(),
                                    getDateFormatedToString(_dateOfBirth!),
                                  );
                              await context
                                  .read(userNotifierProvider.notifier)
                                  .getUserInfo();
                            }
                            toast(LocaleKeys.something_went_wrong.tr());
                          }
                        },
                        child: Text(LocaleKeys.update.tr())),
                  ],
                ),
                CustomTextField(
                  color: kLightCardBgColor,
                  title: LocaleKeys.your_full_name.tr(),
                  hintText: LocaleKeys.your_full_name.tr(),
                  controller: fullNameController,
                  widthMultiplier: 1,
                ),
                CustomTextField(
                  color: kLightCardBgColor,
                  title: LocaleKeys.your_nick_name.tr(),
                  hintText: LocaleKeys.your_nick_name.tr(),
                  controller: nickNameController,
                  widthMultiplier: 1,
                ),
                CustomTextField(
                  color: kLightCardBgColor,
                  title: LocaleKeys.your_email.tr(),
                  hintText: LocaleKeys.your_email.tr(),
                  controller: emailController,
                  validator: (value) {
                    if (!value!.contains("@") || !value.contains(".")) {
                      return LocaleKeys.invalid_email.tr();
                    } else
                      return null;
                  },
                  widthMultiplier: 1,
                ),
                CustomTextField(
                  color: kLightCardBgColor,
                  title: LocaleKeys.your_bio.tr(),
                  hintText: LocaleKeys.your_bio.tr(),
                  controller: bioController,
                  widthMultiplier: 1,
                  minLines: 1,
                  maxLines: null,
                ),
                CustomDateTimeField(
                  title: LocaleKeys.dob.tr(),
                  color: kLightCardBgColor,
                  widthMultiplier: 1,
                  hintText: LocaleKeys.dob.tr(),
                  initialDate: _dateOfBirth,
                  onTextChanged: (date) {
                    _dateOfBirth = date;
                  },
                )
              ],
            ).p(10),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
