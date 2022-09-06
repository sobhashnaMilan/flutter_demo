import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_common_stuffs/colors.dart';

class AppBarComponent {
  static AppBar buildAppbarWithDrawer({
    required Widget titleWidget,
    List<Widget>? actionWidgets,
    required Function onMenuClick,
  }) {
    return AppBar(
      title: titleWidget,
      leading: IconButton(
        onPressed: () => onMenuClick(),
        icon: const Icon(Icons.menu),
      ),
      actions: actionWidgets,
    );
  }

  static AppBar buildAppbar({
    required Widget titleWidget,
    Color? backColor,
    Widget? leadingWidget,
    List<Widget>? actionWidgets,
    Function? onBackPress,
  }) {
    return AppBar(
      title: titleWidget,
      backgroundColor: backColor ?? AppColors.primaryColor,
      leading: leadingWidget ??
          IconButton(
            onPressed: () {
              onBackPress == null ? Get.back() : onBackPress();
            },
            icon: const Icon(Icons.arrow_back),
          ),
      actions: actionWidgets,
    );
  }

  static AppBar buildAppbarForHome({
    required Widget titleWidget,
    Color? backColor,
    List<Widget>? actionWidgets,
    Function? onBackPress,
  }) {
    return AppBar(
      title: titleWidget,
      backgroundColor: backColor ?? AppColors.primaryColor,
      actions: actionWidgets,
    );
  }
}
