import 'package:flutter/material.dart';

import '../../../util/app_common_stuffs/colors.dart';
import '../../../util/app_common_stuffs/string_constants.dart';
import '../../../util/responsive_util.dart';
import '../text_styles.dart';

class TextFieldComponent extends StatelessWidget {
  final BuildContext context;
  final TextEditingController? textEditingController;
  final TextCapitalization capitalization;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool obscure;
  final int maxLength;
  final int maxLines;
  final String hint;
  final bool enabled;
  final bool isDecoration;
  final bool isStyle;
  final TextStyle style;
  final Function(String s)? onChange;
  final Function(String s)? onSubmit;
  final Function()? onEditingComplete;
  final DeviceType deviceType;
  final Widget? iconSuffix;
  final InputDecoration? decoration;

  const TextFieldComponent({
    Key? key,
    required this.context,
    this.textEditingController,
    this.capitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscure = false,
    this.maxLength = 50,
    this.maxLines = 1,
    required this.hint,
    this.enabled = true,
    this.isDecoration = false,
    this.isStyle = false,
    this.style = const TextStyle(),
    this.onChange,
    this.onSubmit,
    this.onEditingComplete,
    this.deviceType = DeviceType.mobile,
    this.iconSuffix,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          controller: textEditingController,
          enabled: enabled,
          decoration: isDecoration == true
              ? decoration
              : InputDecoration(
                  hintText: hint,
                  hintStyle: deviceType == DeviceType.mobile ? hintTextStyle(context) : hintTextStyleDesktop(context),
                  counterText: '',
                  contentPadding: EdgeInsets.all(
                    deviceType == DeviceType.mobile ? MediaQuery.of(context).size.longestSide * 0.03 : MediaQuery.of(context).size.shortestSide * 0.03,
                  ),
                  isDense: true,
                  enabledBorder: setEnabledBorder(),
                  disabledBorder: setDisabledBorder(),
                  focusedBorder: setFocusedBorder(),
                ),
          textCapitalization: capitalization,
          style: isStyle == true
              ? style
              : deviceType == DeviceType.mobile
                  ? textFieldTextStyle(context)
                  : textFieldTextStyleDesktop(context),
          textAlignVertical: TextAlignVertical.center,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          obscureText: obscure,
          cursorColor: AppColors.accentColor,
          onChanged: (v) => onChange == null ? null : onChange!(v),
          onSubmitted: (v) => onSubmit == null ? null : onSubmit!(v),
          onEditingComplete: () => onEditingComplete == null ? null : onEditingComplete!(),
        ),
        iconSuffix != null ? iconSuffix! : Container()
      ],
    );
  }
}

Widget buildLabelForTextField({
  required BuildContext context,
  required String text,
  DeviceType deviceType = DeviceType.mobile,
}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: text,
          style: deviceType == DeviceType.mobile ? black100Medium18TextStyle(context) : black100Medium10TextStyle(context),
        ),
        const TextSpan(
          text: " ${StringConstant.mandatoryAsterisk}",
          style: TextStyle(color: Colors.red),
        )
      ],
    ),
  );
}

InputBorder setEnabledBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.accentColor.withOpacity(0.5)),
    borderRadius: BorderRadius.circular(5.0),
  );
}

InputBorder setDisabledBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
    borderRadius: BorderRadius.circular(5.0),
  );
}

InputBorder setFocusedBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.accentColor.withOpacity(0.5)),
    borderRadius: BorderRadius.circular(5.0),
  );
}
