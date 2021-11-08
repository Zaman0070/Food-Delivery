import 'dart:io';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zcart/Theme/dark_theme.dart';
import 'package:zcart/Theme/theme.dart';
import 'package:zcart/config/config.dart';
import 'package:zcart/data/network/api.dart';
import 'package:zcart/riverpod/providers/logger_provider.dart';
import 'package:zcart/translations/codegen_loader.g.dart';
import 'package:zcart/translations/supported_locales.dart';
import 'views/screens/startup/loading_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zcart/theme.dart';
import 'package:zcart/lib2/Home/CustomeUi.dart';
import 'package:zcart/lib2/Splash/SplashScreen.dart';
import 'package:zcart/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();

  runApp(
    EasyDynamicThemeWidget(
      child: EasyLocalization(
        path: "assets/translations",
        supportedLocales: supportedLocales,
        fallbackLocale: Locale("en"),
        assetLoader: CodegenLoader(),
        child: ProviderScope(
          observers: [Logger()],
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: API.APP_NAME,
      // themeMode: MyConfig.isChangeAbleThemeActive
      //     ? EasyDynamicTheme.of(context).themeMode == ThemeMode.system
      //         ? ThemeMode.dark
      //         : EasyDynamicTheme.of(context).themeMode
      //     : ThemeMode.dark,
      theme: AppTheme.dark(context),
      // darkTheme: AppTheme.light(context),
      home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong.'),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return LoadingScreen();
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      // home: LoadingScreen(),
    );
  }
}

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]).then((_) => runApp(new MyApp()));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: AppTheme.getTheme(),
//       debugShowCheckedModeBanner: false,
//       routes: routes,
//     );
//   }

//   var routes = <String, WidgetBuilder>{
//     Routes.SPLASH: (BuildContext context) => SplashScreen(),
//     Routes.HOME: (BuildContext context) => CustomeUiScreen(),
//   };
// }

class Routes {
  static const String SPLASH = "/";
  static const String HOME = "/Home/CustomeUi";
}

class AppThemeSocail {
  static var primaryColorString = '#F44C64';
  static var secondaryColorString = '#232937';
  static bool isLightTheme = true;

  static ThemeData getTheme() {
    if (isLightTheme) {
      return ThemeData.dark();
    } else {
      return ThemeData.dark();
    }
  }

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      headline6: GoogleFonts.ubuntu(
          textStyle: TextStyle(
              color: base.headline6!.color,
              fontSize: 20,
              fontWeight: FontWeight.w500)),
      subtitle1: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.subtitle1!.color, fontSize: 18)),
      subtitle2: GoogleFonts.ubuntu(
          textStyle: TextStyle(
              color: base.subtitle2!.color,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      bodyText2: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.bodyText2!.color, fontSize: 16)),
      bodyText1: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.bodyText1!.color, fontSize: 14)),
      button: GoogleFonts.ubuntu(
          textStyle: TextStyle(
              color: base.button!.color,
              fontSize: 14,
              fontWeight: FontWeight.w500)),
      caption: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.caption!.color, fontSize: 12)),
      headline4: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.headline4!.color, fontSize: 34)),
      headline3: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.headline3!.color, fontSize: 48)),
      headline2: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.headline2!.color, fontSize: 60)),
      headline1: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.headline1!.color, fontSize: 96)),
      headline5: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.headline5!.color, fontSize: 24)),
      overline: GoogleFonts.ubuntu(
          textStyle: TextStyle(color: base.overline!.color, fontSize: 10)),
    );
  }

  static ThemeData lightTheme() {
    Color primaryColor = HexColor(primaryColorString);
    Color secondaryColor = HexColor(secondaryColorString);
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );

    final ThemeData base = ThemeData.light();
    return base.copyWith(
        appBarTheme: AppBarTheme(color: Colors.white),
        popupMenuTheme: PopupMenuThemeData(color: Colors.white),
        colorScheme: colorScheme,
        primaryColor: primaryColor,
        // ignore: deprecated_member_use
        buttonColor: primaryColor,
        splashColor: Colors.white.withOpacity(0.1),
        hoverColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
        highlightColor: Colors.transparent,
        // ignore: deprecated_member_use
        accentColor: primaryColor,
        canvasColor: Colors.white,
        scaffoldBackgroundColor: HexColor("#4D596F"),
        backgroundColor: secondaryColor,
        errorColor: Colors.red,
        textTheme: _buildTextTheme(base.textTheme),
        primaryTextTheme: _buildTextTheme(base.textTheme),
        platform: TargetPlatform.iOS,
        indicatorColor: primaryColor,
        disabledColor: HexColor("#D5D7D8"));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
