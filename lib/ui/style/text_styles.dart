import '../../util/app_common_stuffs/colors.dart';
import '../../util/app_common_stuffs/string_constants.dart';
import 'package:flutter/material.dart';

TextStyle hintTextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: Colors.grey.withOpacity(0.9),
  );
}

TextStyle hintTextStyleDesktop(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.008,
    color: Colors.grey.withOpacity(0.9),
  );
}

TextStyle textFieldTextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle textFieldTextStyleDesktop(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.008,
    color:AppColors.blackColor.withOpacity(0.90),
  );
}

/// DEV NOTE -: Text Style method naming rule -> color-opacity-weight-size-TextStyle
/// i.e black100Light20TextStyle

TextStyle black100Light20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w300,
    color: AppColors.blackColor,
  );
}

TextStyle black100Light28TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w300,
    color: AppColors.blackColor,
  );
}

TextStyle black100Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
}

TextStyle black95Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Bold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
}

TextStyle black95SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
}

TextStyle white95SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60SemiBold24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}

TextStyle black95Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Medium24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.blackColor,
  );
}

TextStyle black95Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Regular24TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.024,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
}

TextStyle black95Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Bold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
}

TextStyle black95SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
}

TextStyle white95SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60SemiBold22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}

TextStyle black95Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Medium22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.blackColor,
  );
}

TextStyle black95Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Regular22TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.022,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
}

TextStyle black95Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Bold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
}

TextStyle black95SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
}

TextStyle white95SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60SemiBold20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}

TextStyle black95Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Medium20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.blackColor,
  );
}

TextStyle black95Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Regular20TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.020,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
}

TextStyle black95Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Bold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
}

TextStyle black95SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
}

TextStyle white95SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60SemiBold18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}

TextStyle black95Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Medium18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.blackColor,
  );
}

TextStyle black95Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Regular18TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.018,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
}

TextStyle black95Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Bold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
}

TextStyle black95SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black30SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.30),
  );
}

TextStyle black30SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.30),
  );
}

TextStyle black60SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
}

TextStyle white95SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60SemiBold16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}

TextStyle black95Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Medium16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.blackColor,
  );
}

TextStyle black95Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle black50Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.50),
  );
}

TextStyle white100Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Regular16TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
}

TextStyle black95Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Bold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
}

TextStyle black95SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
}

TextStyle white95SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60SemiBold14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}

TextStyle black95Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Medium14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.016,
    color: AppColors.blackColor,
  );
}

TextStyle black95Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Regular14TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.014,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
}

TextStyle black95Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Bold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
}

TextStyle black95SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
}

TextStyle white95SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60SemiBold12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}

TextStyle black95Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Medium12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.blackColor,
  );
}

TextStyle black95Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Regular12TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.012,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
  );
}

TextStyle black95Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Bold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
}

TextStyle black95SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
}

TextStyle white95SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60SemiBold10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
}

TextStyle black95Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle white100Medium08TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.008,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}

TextStyle primary100Medium08TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.008,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Medium10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}

TextStyle black100Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.blackColor,
  );
}

TextStyle black95Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.blackColor.withOpacity(0.95),
  );
}

TextStyle black90Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.blackColor.withOpacity(0.90),
  );
}

TextStyle black85Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.blackColor.withOpacity(0.85),
  );
}

TextStyle black80Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.blackColor.withOpacity(0.80),
  );
}

TextStyle black75Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.blackColor.withOpacity(0.75),
  );
}

TextStyle black70Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.blackColor.withOpacity(0.70),
  );
}

TextStyle black65Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.blackColor.withOpacity(0.65),
  );
}

TextStyle black60Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor.withOpacity(0.60),
  );
}

TextStyle white100Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.whiteColor,
  );
}

TextStyle white95Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.whiteColor.withOpacity(0.95),
  );
}

TextStyle white90Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.whiteColor.withOpacity(0.90),
  );
}

TextStyle white85Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.whiteColor.withOpacity(0.85),
  );
}

TextStyle white80Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.whiteColor.withOpacity(0.80),
  );
}

TextStyle white75Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.whiteColor.withOpacity(0.75),
  );
}

TextStyle white70Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.whiteColor.withOpacity(0.70),
  );
}

TextStyle white65Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.whiteColor.withOpacity(0.65),
  );
}

TextStyle white60Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.whiteColor.withOpacity(0.60),
  );
}

TextStyle primary100Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.primaryColor,
  );
}

TextStyle primary95Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.primaryColor.withOpacity(0.95),
  );
}

TextStyle primary90Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.primaryColor.withOpacity(0.90),
  );
}

TextStyle primary85Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.primaryColor.withOpacity(0.85),
  );
}

TextStyle primary80Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.primaryColor.withOpacity(0.80),
  );
}

TextStyle primary75Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.primaryColor.withOpacity(0.75),
  );
}

TextStyle primary70Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.primaryColor.withOpacity(0.70),
  );
}

TextStyle primary65Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.primaryColor.withOpacity(0.65),
  );
}

TextStyle primary60Regular10TextStyle(context) {
  return TextStyle(
    fontFamily: StringConstant.poppinsFont,
    fontSize: MediaQuery.of(context).size.longestSide * 0.010,
    color: AppColors.primaryColor.withOpacity(0.60),
  );
}
