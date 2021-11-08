import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:zcart/Theme/styles/colors.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;

  ErrorMessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.screenHeight * .8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, color: kFadeColor).pOnly(bottom: 5),
            Text(
              message,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
