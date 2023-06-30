// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:registration_ui/constatns/app_colors.dart';

class AppStyles {
  static TextStyle h1 = const TextStyle(
      fontFamily: "SF-Pro-Display",
      fontSize: 34,
      fontWeight: FontWeight.w700,
      color: primaryColor);

  // variable style
  static TextStyle variablestyle(double size, FontWeight weight, Color color) {
    return TextStyle(
      fontFamily: "SF-Pro-Display",
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }
}
