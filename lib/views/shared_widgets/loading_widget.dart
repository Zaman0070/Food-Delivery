import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';
import 'package:zcart/Theme/styles/colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //Change this loading as your own loading widget
      child: SpinKitCubeGrid(
        color: kPrimaryColor,
        size: 24,
        duration: Duration(milliseconds: 700),
      ),
    ).center();
  }
}
