import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:zcart/Theme/styles/colors.dart';

import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class CustomDropDownField extends StatefulWidget {
  final String? title;
  final String? value;
  TextEditingController? controller;
  final FormFieldValidator? validator;
  final Function? onChange;
  final List<String?>? optionsList;
  final double widthMultiplier;

  final void Function(int)? callbackFunction;
  final bool isCallback;
  final bool isProductDetailsView;

  CustomDropDownField(
      {this.title,
      this.value,
      this.controller,
      this.onChange,
      this.optionsList,
      this.widthMultiplier = 0.8,
      this.callbackFunction,
      this.isCallback = false,
      this.validator,
      this.isProductDetailsView = false});

  @override
  _CustomDropDownFieldState createState() => _CustomDropDownFieldState();
}

class _CustomDropDownFieldState extends State<CustomDropDownField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: !widget.isProductDetailsView
          ? EdgeInsets.symmetric(vertical: 5)
          : null,
      child: Column(
        children: [
          widget.title != null
              ? Align(
                  alignment: Alignment.topLeft,
                  child: Text(widget.title!,
                          style: context.theme.textTheme.subtitle2)
                      .paddingBottom(5),
                )
              : Container(),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 10, vertical: !widget.isProductDetailsView ? 5 : 0),
            width: MediaQuery.of(context).size.width * widget.widthMultiplier,
            decoration: BoxDecoration(
              color: EasyDynamicTheme.of(context).themeMode == ThemeMode.dark
                  ? kDarkBgColor
                  : kLightCardBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              value: widget.optionsList!.first,
              items: widget.optionsList!.map((String? value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value!,
                    style: TextStyle(fontSize: 12),
                  ),
                  // child: Text(
                  //   value,
                  //   overflow: TextOverflow.ellipsis,
                  //   softWrap: true,
                  //   maxLines: 1,

                  // ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  widget.controller!.text = newValue!;
                });
                if (widget.isCallback)
                  widget
                      .callbackFunction!(widget.optionsList!.indexOf(newValue));
              },
            ),
            // child: Row(
            //   children: <Widget>[
            //     Expanded(
            //       child: TextFormField(
            //         controller: widget.controller,
            //         validator: widget.validator,
            //         readOnly: true,
            //         decoration: InputDecoration(
            //           hintText: 'Select',
            //           border: InputBorder.none,
            //         ),
            //       ),
            //     ),
            //     PopupMenuButton<String>(
            //       color: kDarkColor,
            //       icon: Icon(Icons.arrow_drop_down),
            //       onSelected: (value) {
            //         setState(() {
            //           widget.controller.text = value;
            //         });
            //         if (widget.isCallback)
            //           widget
            //               .callbackFunction(widget.optionsList.indexOf(value));
            //       },
            //       itemBuilder: (BuildContext context) {
            //         return widget.optionsList
            //             .map<PopupMenuItem<String>>((String value) {
            //           return PopupMenuItem(
            //             child: Text(value),
            //             value: value,
            //           );
            //         }).toList();
            //       },
            //     ),
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
