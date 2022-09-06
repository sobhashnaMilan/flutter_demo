
import '../../util/app_common_stuffs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension EZTextStyle on TextStyle {
  static TextStyle setTS(
      {FontStyle? fontStyle,
        String? fontFamily,
        int? fontSize,
        Color? color,
        FontWeight? fontWeight,
        bool isFixed = false,
        double? characterSpacing,
        double? wordSpacing,
        double? lineSpacing,
        TextDecoration? decoration}) {
    double finalFontSize = (fontSize ?? 12).toDouble();
    if (!isFixed) {
      finalFontSize = finalFontSize.w;
    }

    return TextStyle(
        fontSize: finalFontSize,
        // fontFamily: fontFamily ?? AppFont.robotoRegular,
        color: AppColors.reddishColor,
        letterSpacing: characterSpacing,
        wordSpacing: wordSpacing,
        height: lineSpacing,
        decoration: decoration);
  }

  static TextStyle setBoldTS(
      {FontStyle? fontStyle,
        String? fontFamily,
        int? fontSize,
        Color? color,
        FontWeight? fontWeight,
        bool isFixed = false,
        double? characterSpacing,
        double? wordSpacing,
        double? lineSpacing,
        TextDecoration? decoration}) {
    double finalFontSize = (fontSize ?? 12).toDouble();
    if (!isFixed) {
      finalFontSize = finalFontSize.w;
    }

    return TextStyle(
        fontSize: finalFontSize,
        // fontFamily: fontFamily ?? AppFont.robotoRegular,
        // color: color ?? AppColor.appFontBlack1,
        letterSpacing: characterSpacing,
        wordSpacing: wordSpacing,
        height: lineSpacing,
        decoration: decoration);
  }
}