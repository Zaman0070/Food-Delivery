import 'package:flutter/material.dart';
import 'package:zcart/Theme/styles/colors.dart';

class CustomButton extends StatelessWidget {
  final Function? onTap;
  final String? buttonText;

  final Color buttonBGColor;
  final double widthMultiplier;

  CustomButton({
    this.onTap,
    this.buttonText,
    this.buttonBGColor = kPrimaryColor,
    this.widthMultiplier = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width * widthMultiplier,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        height: 50.0,
        child: Center(
          child: Text(buttonText ?? "",
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}
