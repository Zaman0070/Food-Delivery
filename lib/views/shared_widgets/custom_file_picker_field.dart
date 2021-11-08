import 'package:flutter/material.dart';
import 'package:zcart/Theme/styles/colors.dart';

class CustomFilePickerField extends StatefulWidget {
  final String? title;
  final String? hintText;
  final Function? onTap;

  CustomFilePickerField({this.hintText, this.onTap, this.title});

  @override
  _CustomFilePickerFieldState createState() => _CustomFilePickerFieldState();
}

class _CustomFilePickerFieldState extends State<CustomFilePickerField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 0.0, left: 16.0, bottom: 8.0),
          alignment: Alignment.topLeft,
          child: Text(
            '${widget.title}',
            style: TextStyle(
              fontSize: 12.0,
              color: kPrimaryDarkTextColor,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        GestureDetector(
          onTap: widget.onTap as void Function()?,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 15.0),
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${widget.hintText}',
                style: TextStyle(
                  fontSize: 16.0,
                  color: kPrimaryDarkTextColor,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
