import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/controllers/auth/signup_controller.dart';
import 'package:flutter_demo/ui/style/components/button_component.dart';
import 'package:flutter_demo/ui/style/components/textfield_component.dart';
import 'package:flutter_demo/ui/style/style.dart';
import 'package:flutter_demo/ui/style/text_styles.dart';
import 'package:flutter_demo/util/app_common_stuffs/colors.dart';
import 'package:flutter_demo/util/app_common_stuffs/string_constants.dart';
import 'package:flutter_demo/util/remove_glow_effect.dart';
import 'package:flutter_demo/util/responsive_util.dart';
import 'package:flutter_demo/util/snackbar_util.dart';
import 'package:flutter_demo/util/string_extensions.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupController controller = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: buildBodySection(
          ResponsiveUtil.isMobile(context)
              ? DeviceType.mobile
              : DeviceType.desktop,
        ),
      ),
    );
  }

  Widget buildBodySection(DeviceType type) {
    return Container(
      color: Colors.black12,
      child: Center(
        child: SizedBox(
          width: CommonStyle.setDynamicWidth(
            context: context,
            value: 0.84,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: CommonStyle.setDynamicHeight(context: context, value: 0.05),
              bottom:
                  CommonStyle.setDynamicHeight(context: context, value: 0.03),
            ),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: type == DeviceType.mobile
                  ? buildMobileBodyLogin(type)
                  : buildWebBodyLogin(type),
              // child: buildMobileBodyLogin(type),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMobileBodyLogin(DeviceType type) {
    return ScrollConfiguration(
      behavior: RemoveGlowEffect(),
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: CommonStyle.setDynamicHeight(
                context: context,
                value: type == DeviceType.mobile ? 0.13 : 0.017),
            width: CommonStyle.setDynamicWidth(
                context: context,
                value: type == DeviceType.mobile ? 0.3 : 0.017),
            child: Image.network(
              "https://raw.githubusercontent.com/sobhashnaMilan/image/main/flutter_icon.png",
            ),
          ),
          type == DeviceType.mobile
              ? CommonStyle.verticalSpace(context, 0.00)
              : CommonStyle.verticalSpace(context, 0.035),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: CommonStyle.setDynamicHeight(
                    context: context,
                    value: type == DeviceType.mobile ? 0.1 : 0.011),
                width: CommonStyle.setDynamicWidth(
                    context: context,
                    value: type == DeviceType.mobile ? 0.2 : 0.011),
                child: Image.network(
                  "https://miro.medium.com/max/700/1*tOitxCwTNcS3ESstLylmtg.png",
                ),
              ),
              Container(
                height: 40,
                color: Colors.black,
                width: 1,
              ),
              CommonStyle.horizontalSpace(context, 0.025),
              buildHeadingSection(type),
            ],
          ),
          CommonStyle.verticalSpace(
            context,
            type == DeviceType.mobile ? 0.04 : 0.02,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: CommonStyle.setLongestSide(
                context: context,
                value: 0.03,
              ),
              right: CommonStyle.setLongestSide(
                context: context,
                value: 0.03,
              ),
            ),
            child: buildSignupForm(),
          ),
        ],
      ),
    );
  }

  Widget buildWebBodyLogin(DeviceType type) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height:
                    CommonStyle.setDynamicHeight(context: context, value: 0.19),
                width:
                    CommonStyle.setDynamicWidth(context: context, value: 0.19),
                padding: EdgeInsets.only(
                  left: CommonStyle.setLongestSide(
                    context: context,
                    value: 0.01,
                  ),
                  right: CommonStyle.setLongestSide(
                    context: context,
                    value: 0.01,
                  ),
                ),
                child: Image.network(
                    "https://raw.githubusercontent.com/sobhashnaMilan/image/main/flutter_icon.png"),
              ),
              CommonStyle.verticalSpace(context, 0.035),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: CommonStyle.setDynamicHeight(
                        context: context, value: 0.11),
                    width: CommonStyle.setDynamicWidth(
                        context: context, value: 0.11),
                    child: Image.network(
                      "https://miro.medium.com/max/700/1*tOitxCwTNcS3ESstLylmtg.png",
                    ),
                  ),
                  Container(
                    height: 40,
                    color: Colors.black,
                    width: 1,
                  ),
                  CommonStyle.horizontalSpace(context, 0.025),
                  buildHeadingSection(type),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 6,
          child: ScrollConfiguration(
            behavior: RemoveGlowEffect(),
            child: ListView(
              shrinkWrap: true,
              children: [
                CommonStyle.verticalSpace(
                  context,
                  type == DeviceType.mobile ? 0.04 : 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: CommonStyle.setLongestSide(
                      context: context,
                      value: 0.03,
                    ),
                    right: CommonStyle.setLongestSide(
                      context: context,
                      value: 0.03,
                    ),
                  ),
                  child: buildSignupFormDesktop(type),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildAlreadyHaveAnAccountSection(DeviceType type) {
    return SizedBox(
      height: CommonStyle.setDynamicHeight(context: context, value: 0.035),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: StringConstant.alreadyHaveAnAccountLabel.tr,
                style: type == DeviceType.mobile
                    ? black100Medium18TextStyle(context)
                    : black100Medium10TextStyle(context),
              ),
              TextSpan(
                text: " ${StringConstant.loginLabel.tr}",
                style: TextStyle(
                  fontFamily: StringConstant.poppinsFont,
                  fontSize: type == DeviceType.mobile
                      ? MediaQuery.of(context).size.longestSide * 0.018
                      : MediaQuery.of(context).size.longestSide * 0.010,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentColor,
                ),
                recognizer: TapGestureRecognizer()..onTap = (() => Get.back()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBioSection(DeviceType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabelForTextField(
          context: context,
          text: StringConstant.bioFieldLabel.tr,
          deviceType: type,
        ),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.01,
        ),
        TextFieldComponent(
          context: context,
          deviceType: type,
          textEditingController: controller.bioController,
          hint: StringConstant.bioFieldHint.tr,
          maxLength: 200,
          maxLines: 2,
        )
      ],
    );
  }

  Widget buildConfirmPasswordFieldSection(DeviceType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabelForTextField(
          context: context,
          text: StringConstant.confirmPasswordFieldLabel.tr,
          deviceType: type,
        ),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.01,
        ),
        Obx(
          () => TextFieldComponent(
            context: context,
            deviceType: type,
            textEditingController: controller.confirmPasswordTextController,
            hint: StringConstant.confirmPasswordFieldHint.tr,
            obscure: controller.isConfirmPasswordVisible.value ? false : true,
            textInputAction: TextInputAction.done,
            iconSuffix: GestureDetector(
              onTap: () => controller.updateConfirmPasswordVisibility(),
              child: Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.longestSide * 0.008),
                padding: EdgeInsets.all(
                    MediaQuery.of(context).size.longestSide * 0.008),
                color: Colors.transparent,
                child: Icon(
                  size: MediaQuery.of(context).size.shortestSide * 0.04,
                  controller.isConfirmPasswordVisible.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildEmailFieldSection(DeviceType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabelForTextField(
          context: context,
          text: StringConstant.emailFieldLabel.tr,
          deviceType: type,
        ),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.01,
        ),
        TextFieldComponent(
          context: context,
          deviceType: type,
          textEditingController: controller.emailController,
          hint: StringConstant.emailFieldHint.tr,
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget buildFirstNameSection(DeviceType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabelForTextField(
          context: context,
          text: StringConstant.firstNameFieldLabel.tr,
          deviceType: type,
        ),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.01,
        ),
        TextFieldComponent(
          context: context,
          deviceType: type,
          textEditingController: controller.firstNameController,
          hint: StringConstant.firstNameFieldHint.tr,
        )
      ],
    );
  }

  Widget buildHeadingSection(DeviceType type) {
    return Text(
      StringConstant.signupHeadingLabel.tr,
      style: type == DeviceType.mobile
          ? black100Medium20TextStyle(context)
          : black100Medium24TextStyle(context),
      textAlign: TextAlign.center,
    );
  }

  Widget buildLastNameSection(DeviceType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabelForTextField(
          context: context,
          text: StringConstant.lastNameFieldLabel.tr,
          deviceType: type,
        ),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.01,
        ),
        TextFieldComponent(
          context: context,
          deviceType: type,
          textEditingController: controller.lastNameController,
          hint: StringConstant.lastNameFieldHint.tr,
        ),
      ],
    );
  }

  Widget buildMobileNoFieldSection(DeviceType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabelForTextField(
          context: context,
          text: StringConstant.genderFieldLabel.tr,
          deviceType: type,
        ),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.01,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: "male",
                    groupValue: controller.gender,
                    onChanged: (value) {
                      controller.gender = value.toString();
                    },
                  ),
                  const Text("Male")
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Radio(
                    value: "female",
                    groupValue: controller.gender,
                    onChanged: (value) {
                      controller.gender = value.toString();
                    },
                  ),
                  const Text("Female")
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPasswordFieldSection(DeviceType type) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabelForTextField(
          context: context,
          text: StringConstant.passwordFieldLabel.tr,
          deviceType: type,
        ),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.01,
        ),
        Obx(
          () => TextFieldComponent(
            context: context,
            textEditingController: controller.passwordTextController,
            hint: StringConstant.passwordFieldHint.tr,
            deviceType: type,
            obscure: controller.isPasswordVisible.value ? false : true,
            iconSuffix: GestureDetector(
              onTap: () => controller.updatePasswordVisibility(),
              child: Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.longestSide * 0.008),
                padding: EdgeInsets.all(
                    MediaQuery.of(context).size.longestSide * 0.008),
                color: Colors.transparent,
                child: Icon(
                  size: MediaQuery.of(context).size.shortestSide * 0.04,
                  controller.isPasswordVisible.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRegisterButtonSection(DeviceType type) {
    return ButtonComponent(
      context: context,
      backgroundColor: AppColors.accentColor,
      text: StringConstant.registerBtnLabel.tr.toUpperCase(),
      onPressed: () => checkValidation(),
    );
  }

  Widget buildSignupFormDesktop(DeviceType type) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(child: buildFirstNameSection(type)),
            CommonStyle.horizontalSpace(context, 0.02),
            Expanded(child: buildLastNameSection(type)),
          ],
        ),
        CommonStyle.verticalSpace(context, 0.02),
        Row(
          children: [
            Expanded(child: buildEmailFieldSection(type)),
            CommonStyle.horizontalSpace(context, 0.02),
            Expanded(child: buildMobileNoFieldSection(type))
          ],
        ),
        CommonStyle.verticalSpace(context, 0.02),
        Row(
          children: [
            Expanded(child: buildPasswordFieldSection(type)),
            CommonStyle.horizontalSpace(context, 0.02),
            Expanded(child: buildConfirmPasswordFieldSection(type))
          ],
        ),
        CommonStyle.verticalSpace(context, 0.025),
        buildRegisterButtonSection(type),
        CommonStyle.verticalSpace(context, 0.02),
        buildAlreadyHaveAnAccountSection(
          ResponsiveUtil.isMobile(context)
              ? DeviceType.mobile
              : DeviceType.desktop,
        ),
        CommonStyle.verticalSpace(context, 0.02),
      ],
    );
  }

  Widget buildSignupForm() {
    return Column(
      children: [
        buildFirstNameSection(DeviceType.mobile),
        CommonStyle.verticalSpace(context, 0.02),
        buildLastNameSection(DeviceType.mobile),
        CommonStyle.verticalSpace(context, 0.02),
        buildEmailFieldSection(DeviceType.mobile),
        CommonStyle.verticalSpace(context, 0.02),
        buildMobileNoFieldSection(DeviceType.mobile),
        CommonStyle.verticalSpace(context, 0.02),
        buildPasswordFieldSection(DeviceType.mobile),
        CommonStyle.verticalSpace(context, 0.02),
        buildConfirmPasswordFieldSection(DeviceType.mobile),
        CommonStyle.verticalSpace(context, 0.035),
        buildRegisterButtonSection(DeviceType.mobile),
        CommonStyle.verticalSpace(context, 0.02),
        buildAlreadyHaveAnAccountSection(
          ResponsiveUtil.isMobile(context)
              ? DeviceType.mobile
              : DeviceType.desktop,
        ),
        CommonStyle.verticalSpace(context, 0.02),
      ],
    );
  }

  void checkValidation() {
    if (!controller.firstNameController.text.isStringValid()) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterFirstNameValidation,
      );
    } else if (!controller.lastNameController.text.isStringValid()) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterLastNameValidation,
      );
    } else if (!controller.bioController.text.isStringValid()) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterBioValidation,
      );
    } else if (!controller.emailController.text.isStringValid()) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterEmailIDFieldValidation,
      );
    } else if (!controller.emailController.text.isEmail) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterValidEmailIDFieldValidation,
      );
    } else if (!controller.mobileController.text.isStringValid()) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterMobileNoValidation,
      );
    } else if (!controller.mobileController.text.isStringValid(minLength: 10)) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterValidMobileNoValidation,
      );
    } else if (!controller.passwordTextController.text.isStringValid()) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterPasswordFieldValidation,
      );
    } else if (!controller.passwordTextController.text
        .isStringValid(minLength: 6)) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.passwordLengthValidation,
      );
    } else if (!controller.confirmPasswordTextController.text.isStringValid()) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.reEnterPasswordValidation,
      );
    } else if (!controller.confirmPasswordTextController.text
        .isStringValid(minLength: 6)) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.passwordLengthValidation,
      );
    } else if (controller.passwordTextController.text !=
        controller.confirmPasswordTextController.text) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.passwordsNotMatchValidation,
      );
    } else {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.success,
        message: "All set for registration!",
      );
    }
  }
}
