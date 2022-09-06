import 'dart:io';

import '../../util/app_common_stuffs/colors.dart';
import '../../ui/style/components/image_component.dart';
import '../../ui/style/text_styles.dart';
import '../../util/app_common_stuffs/string_constants.dart';
import '../../util/responsive_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonStyle {
  static Widget displayLoadingIndicator(DeviceType deviceType) {
    return deviceType == DeviceType.mobile
        ? Platform.isAndroid
            ? const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                  backgroundColor: Colors.transparent,
                ),
              )
            : const Center(child: CupertinoActivityIndicator())
        : const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              backgroundColor: Colors.transparent,
            ),
          );
  }

  static Widget displayLoadingIndicatorWhite() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white),
        backgroundColor: Colors.transparent,
      ),
    );
  }

  static Widget horizontalSpace(BuildContext context, double horizontalSpace) {
    return SizedBox(
      width: MediaQuery.of(context).size.shortestSide * horizontalSpace,
    );
  }

  static Widget verticalSpace(BuildContext context, double verticalSpace) {
    return SizedBox(
      height: MediaQuery.of(context).size.longestSide * verticalSpace,
    );
  }

  static createDivider(BuildContext context, {required height}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      color: AppColors.secondaryBorderColor.withOpacity(0.35),
    );
  }

  static double setDynamicHeight({required context, required value}) =>
      MediaQuery.of(context).size.height * value;

  static double setDynamicWidth({required context, required value}) =>
      MediaQuery.of(context).size.width * value;

  static double setLongestSide({required context, required value}) =>
      MediaQuery.of(context).size.longestSide * value;

  static double setShortestSide({required context, required value}) =>
      MediaQuery.of(context).size.shortestSide * value;

  static Widget loadNoDataView({
    required BuildContext context,
    required DeviceType deviceType,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageComponent.loadLocalImage(
            imageName: "empty_box.png",
            height: setDynamicHeight(context: context, value: 0.25),
            width: setDynamicWidth(context: context, value: 0.35),
          ),
          Text(
            StringConstant.noDataFoundLabel.tr,
            style: deviceType == DeviceType.mobile
                ? black80Medium20TextStyle(context)
                : black80Medium10TextStyle(context),
          ),
        ],
      ),
    );
  }
}
