import 'package:flutter/material.dart';

import '../../../util/app_common_stuffs/string_constants.dart';
import '../../../util/responsive_util.dart';

class ButtonComponent extends StatelessWidget {
  final BuildContext context;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  double? width;
  final Function onPressed;
  final double? elevation;
  final DeviceType deviceType;

  ButtonComponent({
    Key? key,
    required this.context,
    required this.backgroundColor,
    this.textColor = Colors.white,
    required this.text,
    this.width,
    required this.onPressed,
    this.elevation = 5,
    this.deviceType = DeviceType.mobile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    width = width ?? MediaQuery.of(context).size.width;
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: deviceType == DeviceType.mobile
          ? MediaQuery.of(context).size.longestSide * 0.065
          : MediaQuery.of(context).size.longestSide * 0.03,
      child: MaterialButton(
        elevation: elevation,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () => onPressed(),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: StringConstant.poppinsFont,
            fontSize: deviceType == DeviceType.mobile
                ? MediaQuery.of(context).size.longestSide * 0.020
                : MediaQuery.of(context).size.longestSide * 0.009,
            fontWeight: FontWeight.w500,
            color: textColor.withOpacity(0.95),
          ),
        ),
      ),
    );
  }
}
