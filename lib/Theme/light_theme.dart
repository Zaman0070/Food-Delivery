import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zcart/Theme/styles/colors.dart';

//main color
final Color _lightPrimaryColor = kPrimaryColor.withOpacity(0.1);

//Background Colors
Color _lightBackgroundAppBarColor = _lightPrimaryColor;

TextStyle _textStyle(BuildContext context, double size, Color color) =>
    GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
      ),
    );

TextTheme lightTextTheme(BuildContext context) {
  return GoogleFonts.latoTextTheme(
    Theme.of(context).textTheme,
  ).copyWith(
    //bodyText1: TextStyle(fontSize: 18, color: kSecondaryDarkTextColor),
    bodyText1: _textStyle(context, 18, kPrimaryDarkTextColor),
    //bodyText2: TextStyle(fontSize: 16, color: kSecondaryDarkTextColor),
    bodyText2: _textStyle(context, 16, kPrimaryDarkTextColor),
    // button: TextStyle(
    //     fontSize: 16,
    //     color: kPrimaryLightTextColor,
    //     fontWeight: FontWeight.bold),
    button: _textStyle(context, 16, kPrimaryLightTextColor),

    // headline6: TextStyle(fontSize: 18, color: kPrimaryDarkTextColor),
    headline6: _textStyle(context, 18, kPrimaryDarkTextColor),
    //headline5: TextStyle(fontSize: 24, color: kPrimaryDarkTextColor),
    headline5: _textStyle(context, 24, kPrimaryDarkTextColor),
    //headline4: TextStyle(fontSize: 34, color: kPrimaryDarkTextColor),
    headline4: _textStyle(context, 34, kPrimaryDarkTextColor),
    //headline3: TextStyle(fontSize: 44, color: kPrimaryDarkTextColor),
    headline3: _textStyle(context, 44, kPrimaryDarkTextColor),
    //headline2: TextStyle(fontSize: 54, color: kPrimaryDarkTextColor),
    headline2: _textStyle(context, 54, kPrimaryDarkTextColor),
    //headline1: TextStyle(fontSize: 64, color: kPrimaryDarkTextColor),
    headline1: _textStyle(context, 64, kPrimaryDarkTextColor),
    //subtitle1: TextStyle(fontSize: 16, color: kSecondaryDarkTextColor),
    subtitle1: _textStyle(context, 16, kPrimaryDarkTextColor),
    // subtitle2: TextStyle(fontSize: 14.0, color: kSecondaryDarkTextColor),
    subtitle2: _textStyle(context, 14.0, kPrimaryDarkTextColor),
    //caption: TextStyle(fontSize: 12.0, color: kSecondaryDarkTextColor),
    caption: _textStyle(context, 12.0, kPrimaryDarkTextColor),

    // overline: TextStyle(
    //     fontSize: 10.0, color: kSecondaryDarkTextColor, letterSpacing: 0),
    overline: _textStyle(context, 10.0, kPrimaryDarkTextColor),
  );
}

final AppBarTheme appBarTheme = AppBarTheme(
  color: kPrimaryColor,
  iconTheme: IconThemeData(color: kLightColor),
  brightness: Brightness.dark,
  elevation: 0,
  centerTitle: true,
  foregroundColor: kLightColor,
);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: kLightBgColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    cardTheme: CardTheme(color: kLightCardBgColor, elevation: 0),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      secondary: _lightPrimaryColor,
      primaryVariant: kDarkColor,
      // secondary: _lightSecondaryColor,
    ),
    switchTheme: SwitchThemeData(
      overlayColor: MaterialStateProperty.all(kPrimaryColor),
    ),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: kDarkColor, actionTextColor: kPrimaryLightTextColor),
    iconTheme: IconThemeData(
      color: kDarkColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
      elevation: MaterialStateProperty.all(0),
    )),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(kPrimaryColor),
      elevation: MaterialStateProperty.all(0),
    )),
    popupMenuTheme: PopupMenuThemeData(color: _lightBackgroundAppBarColor),
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _lightPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _lightPrimaryColor,
    timePickerTheme: TimePickerThemeData(
      backgroundColor: kPrimaryColor,
    ));
