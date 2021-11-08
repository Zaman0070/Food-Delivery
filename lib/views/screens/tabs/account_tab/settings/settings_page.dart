import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:zcart/config/config.dart';
import 'package:zcart/data/controller/others/others_controller.dart';
import 'package:zcart/helper/constants.dart';
import 'package:zcart/riverpod/providers/provider.dart';
import 'package:zcart/translations/locale_keys.g.dart';
import 'package:zcart/views/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:zcart/views/screens/tabs/account_tab/others/aboutUs_screen.dart';
import 'package:zcart/views/screens/tabs/account_tab/others/privacyPolicy_screen.dart';
import 'package:zcart/views/screens/tabs/account_tab/others/termsAndConditions_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zcart/views/shared_widgets/update_language.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings.tr()),
      ),
      body: Container(
          child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text(LocaleKeys.language.tr(),
                  style: context.textTheme.subtitle2!),
              trailing: Icon(
                Icons.translate,
              ),
              onTap: () {
                updateLanguage(context);
              },
            ),
          ),
          // if (MyConfig.isChangeAbleThemeActive)
          //   Card(
          //     child: ListTile(
          //       title: Text(LocaleKeys.change_theme.tr(),
          //           style: context.textTheme.subtitle2!),
          //       trailing: EasyDynamicThemeSwitch(),
          //     ),
          //   ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Card(
            child: ListTile(
              title: Text(LocaleKeys.about_us.tr(),
                  style: context.textTheme.subtitle2!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                context.read(aboutUsProvider.notifier).fetchAboutUs();
                context.nextPage(AboutUsScreen());
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(LocaleKeys.privacy_policy.tr(),
                  style: context.textTheme.subtitle2!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                context
                    .read(privacyPolicyProvider.notifier)
                    .fetchPrivacyPolicy();
                context.nextPage(PrivacyPolicyScreen());
              },
            ),
          ),
          Card(
            child: ListTile(
              title: Text(LocaleKeys.terms_condition.tr(),
                  style: context.textTheme.subtitle2!),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                context
                    .read(termsAndConditionProvider.notifier)
                    .fetchTermsAndCondition();
                context.nextPage(TermsAndConditionScreen());
              },
            ),
          ),
          Divider(
            height: 30,
            thickness: 1,
          ),
          Card(
            child: ListTile(
              trailing: Icon(Icons.logout_outlined),
              title: Text(LocaleKeys.sign_out.tr(),
                  style: context.textTheme.subtitle2!),
              onTap: () async {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(LocaleKeys.sign_out_confirmation.tr()),
                        actions: [
                          TextButton(
                            child: Text(LocaleKeys.no.tr()),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                          TextButton(
                            child: Text(LocaleKeys.yes.tr()),
                            onPressed: () async {
                              await FirebaseAuth.instance.signOut();
                              await FacebookAuth.instance.logOut();

                              await GoogleSignIn().signOut();
                              await context
                                  .read(userNotifierProvider.notifier)
                                  .logout();

                              await setValue(LOGGED_IN, false);
                              context.nextAndRemoveUntilPage(BottomNavBar());
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ],
      )).cornerRadius(10).p(10),
    );
  }
}
