import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:intl/intl.dart';
import 'package:zcart/Theme/light_theme.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:flutter/material.dart';

class CustomDateTimeField extends StatefulWidget {
  final String? title;
  final Function(DateTime?)? onTextChanged;
  final DateTime? initialDate;
  final Color color;
  final double widthMultiplier;
  final String? hintText;
  CustomDateTimeField({
    Key? key,
    this.title,
    this.onTextChanged,
    this.initialDate,
    this.color = kLightColor,
    this.widthMultiplier = 0.8,
    this.hintText,
  }) : super(key: key);

  @override
  _CustomDateTimeFieldState createState() => _CustomDateTimeFieldState();
}

class _CustomDateTimeFieldState extends State<CustomDateTimeField> {
  DateFormat dobFormat = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${widget.title}',
                  style: context.theme.textTheme.subtitle2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1)
              .paddingBottom(10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: MediaQuery.of(context).size.width * widget.widthMultiplier,
            decoration: BoxDecoration(
              color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                  ? kDarkBgColor
                  : widget.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Theme(
              data: lightTheme.copyWith(
                colorScheme: ColorScheme.light().copyWith(
                  primary: kPrimaryColor,
                ),
              ),
              child: DateTimeField(
                initialValue: widget.initialDate ?? null,
                style: context.theme.textTheme.subtitle2,
                resetIcon: Icon(Icons.clear),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  hintStyle: context.theme.textTheme.subtitle2,
                ),
                onChanged: widget.onTextChanged,
                format: dobFormat,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime.utc(1900),
                      initialDate:
                          widget.initialDate ?? currentValue ?? DateTime.now(),
                      lastDate: DateTime.now());
                },
              ).paddingTop(5),
            ),
          ),
        ],
      ),
    );
  }
}
