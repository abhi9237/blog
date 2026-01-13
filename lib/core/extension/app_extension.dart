import 'package:flutter/material.dart'; // Add this
import 'package:blog/core/theme/color_constant.dart';
import '../common/app_font.dart';

TextStyle appStyle(
    double fontSize, {
      FontWeight? fontWeight,
      Color? color,
      String? fontFamily,
    }) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight ?? FontWeight.bold,
    color: color ?? ColorConstant.whiteColor,
    fontFamily: fontFamily ?? FontHelper.natoRegular,
  );
}

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}