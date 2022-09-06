
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../util/app_common_stuffs/colors.dart';
import '../../../util/extensions/text_style_extension.dart';

class ButtonFilled extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final TextStyle? style;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final double? cornerRadius;
  final GestureTapCallback? onTap;
  final Alignment? alignment;

  const ButtonFilled({
    Key? key,
    required this.title,
    this.backgroundColor = AppColors.reddishColor,
    this.style,
    this.padding,
    this.width,
    this.cornerRadius = 5,
    this.height,
    this.onTap,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onTap == null) {
      return _buildButtonWithOutTap();
    }
    return InkWell(
      onTap: onTap,
      child: _buildButtonWithOutTap(),
    );
  }

  _buildButtonWithOutTap() {
    return Container(
      height: height,
      width: width,
      padding: padding ??  EdgeInsets.symmetric(horizontal: 10.w,vertical: 15.w),
      alignment: alignment,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(cornerRadius ?? 5),
      ),
      child: Text(
        title,
        style: style ??
            EZTextStyle.setTS(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.whiteColor,
            ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
