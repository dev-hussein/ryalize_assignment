
import 'package:flutter/material.dart';
import 'package:ryalize_assignment/constants/app_colors.dart';
import 'package:ryalize_assignment/constants/common_constants.dart';

///
/// This class methods return the TextStyle object with specific font weight and other styles.
///

class FontFamilyStyle {
  FontFamilyStyle._();
  static TextStyle standardTextStyleW500(
      {required double fontSize,
        Color color = AppColors.color000000,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
         fontFamily: FontFamily.kDinNext,
        fontSize: fontSize,
        height: lineHeight,
        letterSpacing: 0.0,
      );

  static TextStyle standardTextStyleW700(
      {required double fontSize,
        Color color = AppColors.color000000,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
         fontFamily: FontFamily.kDinNext,
        fontSize: fontSize,
        letterSpacing: 0.0,
        height: lineHeight,
      );

  static TextStyle standardTextStyleW400(
      {required double fontSize,
        Color color = AppColors.color909090,
        double lineHeight = 1.25}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.kDinNext,
        fontSize: fontSize,
        letterSpacing: 0.0,
        height: lineHeight,
      );
}
