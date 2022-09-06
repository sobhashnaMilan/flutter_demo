import '../../util/app_common_stuffs/colors.dart';
import '../../util/app_common_stuffs/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackType { success, error, warning, info }

class SnackbarUtil {
  static void showSnackbar({
    required BuildContext context,
    required SnackType type,
    required String message,
  }) {
    SnackBar snackBar = SnackBar(
      content: Text(
        message.tr,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontFamily: StringConstant.poppinsFont,
            ),
      ),
      backgroundColor: getBackgroundColorByType(snackType: type),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Color getBackgroundColorByType({required SnackType snackType}) {
    if (snackType == SnackType.success) {
      return Colors.green;
    } else if (snackType == SnackType.warning) {
      return Colors.orangeAccent;
    } else if (snackType == SnackType.error) {
      return Colors.red;
    } else {
      return AppColors.accentColor;
    }
  }
}
