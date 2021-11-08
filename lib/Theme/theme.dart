import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zcart/Theme/dark_theme.dart';
import 'package:zcart/Theme/light_theme.dart';
import 'package:zcart/Theme/styles/colors.dart';

class AppTheme {
  AppTheme._();

  static light(BuildContext context) {
    return lightTheme.copyWith(
      textTheme: lightTextTheme(context),
      appBarTheme: appBarTheme.copyWith(
        textTheme: lightTextTheme(context).copyWith(
          headline6: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  static dark(BuildContext context) {
    return darkTheme.copyWith(
      textTheme: darkTextTheme(context),
      appBarTheme: darkAppBarTheme.copyWith(
        textTheme: darkTextTheme(context).copyWith(
          headline6: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
