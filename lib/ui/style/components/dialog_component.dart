import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../util/app_common_stuffs/colors.dart';
import '../../../util/app_common_stuffs/string_constants.dart';
import '../../../util/enum_all/enums_all.dart';
import '../../../util/extensions/text_style_extension.dart';
import '../text_styles.dart';
import 'alert_component.dart';

class DialogComponent {
  static showAlert(
    BuildContext _context, {
    String? title,
    String? message,
    List<String>? arrButton,
    bool barrierDismissible = false,
    AlertWidgetButtonActionCallback? callback,
  }) {
    Widget alertDialog = AlertWidget(
      title: title,
      message: message,
      buttonOption: arrButton,
      onCompletion: callback,
    );

    if (!barrierDismissible) {
      alertDialog = WillPopScope(
        child: alertDialog,
        onWillPop: () async {
          return false;
        },
      );
    }

    // flutter defined function
    showDialog(
      barrierDismissible: barrierDismissible,
      context: _context,
      builder: (BuildContext context1) {
        return alertDialog;
      },
    );
  }

  static void buildLogoutDialog({
    required BuildContext context,
    required onYesClick,
    required onNoClick,
  }) {
    Platform.isAndroid
        ? showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => AlertDialog(
              content: Text(
                StringConstant.logoutWarningMsg.tr,
                style: black100Medium20TextStyle(context),
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    onYesClick();
                  },
                  child: Text(
                    StringConstant.yesLabel.tr,
                    style: black80Medium20TextStyle(context),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    onNoClick();
                  },
                  child: Text(
                    StringConstant.noLabel.tr,
                    style: black80Medium20TextStyle(context),
                  ),
                ),
              ],
            ),
          )
        : showCupertinoDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => CupertinoAlertDialog(
              content: Text(
                StringConstant.logoutWarningMsg.tr,
                style: black100Medium20TextStyle(context),
              ),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    onYesClick();
                  },
                  child: Text(
                    StringConstant.yesLabel.tr,
                    style: black80Medium20TextStyle(context),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    onNoClick();
                  },
                  child: Text(
                    StringConstant.noLabel.tr,
                    style: black80Medium20TextStyle(context),
                  ),
                ),
              ],
            ),
          );
  }

  static void buildLogoutDialogWeb({
    required BuildContext context,
    required onYesClick,
    required onNoClick,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        content: Text(
          StringConstant.logoutWarningMsg.tr,
          style: black100Medium10TextStyle(context),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              onYesClick();
            },
            child: Text(
              StringConstant.yesLabel.tr,
              style: black80Medium10TextStyle(context),
            ),
          ),
          MaterialButton(
            onPressed: () {
              onNoClick();
            },
            child: Text(
              StringConstant.noLabel.tr,
              style: black80Medium10TextStyle(context),
            ),
          ),
        ],
      ),
    );
  }

  static Future showImagePickerDialog({
    required context,
    required imageDialogTitle,
    required imageDialogDesc,
    required camera,
    required gallery,
    required onCameraPress,
    required onGalleryPress,
  }) async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(imageDialogTitle, style: black100Bold22TextStyle(context)),
        content:
            Text(imageDialogDesc, style: black80Medium20TextStyle(context)),
        actions: [
          TextButton(
            onPressed: () async {
              onCameraPress();
            },
            child: Text(camera, style: primary100Medium18TextStyle(context)),
          ),
          MaterialButton(
            color: AppColors.primaryColor,
            onPressed: () async {
              onGalleryPress();
            },
            child: Text(gallery, style: white100Medium18TextStyle(context)),
          )
        ],
      ),
    );
  }

  static showBottomSheet(
    BuildContext context, {
    String title = '',
    String message = '',
    List<String>? arrButton,
    AlertWidgetButtonActionCallback? callback,
  }) {
    final titlewidget = (title.isNotEmpty)
        ? Text(
            title,
            style: EZTextStyle.setTS(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: AppColors.reddishColor),
          )
        : null;
    final messsagewidget = (message.isNotEmpty)
        ? Text(
            message,
            style: EZTextStyle.setTS(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: AppColors.reddishColor),
          )
        : null;

    void onButtonPressed(String btnTitle) {
      int index = (arrButton ?? []).indexOf(btnTitle);
      //dismiss Diloag
      Navigator.of(context).pop();

      // Provide callback
      if (callback != null) {
        callback(index);
      }
    }

    List<Widget> actions = [];

    for (String str in (arrButton ?? [])) {
      bool isDistructive =
          (str.toLowerCase() == "delete") || (str.toLowerCase() == "no");
      actions.add(
        CupertinoDialogAction(
          child: Container(
            child: Text(
              str,
              style: EZTextStyle.setTS(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: AppColors.reddishColor,
              ),
            ),
            alignment: Alignment.center,
            height: 44.h,
          ),
          onPressed: () => onButtonPressed(str),
          isDestructiveAction: isDistructive,
        ),
      );
    }

    final cancelAciton = CupertinoDialogAction(
      onPressed: () => onButtonPressed('Cancel'),
      child: Text(
        'Cancel',
        style: EZTextStyle.setTS(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.reddishColor,
        ),
      ),
    );
    final actionSheet = CupertinoActionSheet(
      title: titlewidget,
      message: messsagewidget,
      actions: actions,
      cancelButton: cancelAciton,
    );

    showCupertinoModalPopup(
        context: context, builder: (BuildContext context) => actionSheet).then(
      (result) {
        if (kDebugMode) {
          print("Result :: $result");
        }
      },
    );
  }
}
