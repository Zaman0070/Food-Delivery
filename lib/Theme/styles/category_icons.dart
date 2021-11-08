import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Change the icons as your app needs
IconData getCategoryIcon(String? iconString) {
  switch (iconString) {
    case 'fa-shower':
      return FontAwesomeIcons.shower;
    case 'fa-plug':
      return FontAwesomeIcons.plug;
    case 'fa-gamepad':
      return FontAwesomeIcons.gamepad;
    case 'fa-tshirt':
      return FontAwesomeIcons.tshirt;
    case 'fa-hot-tub':
      return FontAwesomeIcons.hotTub;
    case 'fa-skiing':
      return FontAwesomeIcons.skiing;
    case 'fa-gem':
      return FontAwesomeIcons.gem;
    case 'fa-dog':
      return FontAwesomeIcons.dog;
    case 'fa-paint-brush':
      return FontAwesomeIcons.paintBrush;
    default:
      return FontAwesomeIcons.cubes;
  }
}
