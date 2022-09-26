import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/bindings/authentication/signup_binding.dart';
import 'package:flutter_demo/controllers/auth/login_controller.dart';
import 'package:flutter_demo/helper_manager/socket_manager/socket_manager.dart';
import 'package:flutter_demo/singleton/user_data_singleton.dart';
import 'package:flutter_demo/ui/chat/signup_screen.dart';
import 'package:flutter_demo/ui/style/components/button_component.dart';
import 'package:flutter_demo/ui/style/components/textfield_component.dart';
import 'package:flutter_demo/ui/style/style.dart';
import 'package:flutter_demo/ui/style/text_styles.dart';
import 'package:flutter_demo/util/app_common_stuffs/colors.dart';
import 'package:flutter_demo/util/app_common_stuffs/preference_keys.dart';
import 'package:flutter_demo/util/app_common_stuffs/screen_routes.dart';
import 'package:flutter_demo/util/app_common_stuffs/string_constants.dart';
import 'package:flutter_demo/util/app_logger.dart';
import 'package:flutter_demo/util/responsive_util.dart';
import 'package:flutter_demo/util/snackbar_util.dart';
import 'package:flutter_demo/util/string_extensions.dart';
import 'package:flutter_demo/util/util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = Get.find<LoginController>();

  @override
  void initState() {
    super.initState();

    /// DEV NOTE -: temp email and password set for demo

    controller.emailTextController.text = "harry@yopmail.com";
    controller.passwordTextController.text = "123456";

    // AwesomeNotificationUtil.checkForPermission(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: buildBodySection(
          ResponsiveUtil.isMobile(context) ? DeviceType.mobile : DeviceType.desktop,
        ),
      ),
    );
  }

  Widget buildBodySection(DeviceType type) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        color: Colors.black12,
        child: Center(
          child: SizedBox(
            width: CommonStyle.setDynamicWidth(
              context: context,
              value: 0.84,
            ),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: CommonStyle.setDynamicHeight(context: context, value: 0.06),
                  bottom: CommonStyle.setDynamicHeight(context: context, value: 0.06),
                ),
                child: type == DeviceType.mobile ? buildMobileBodyLogin(type) : buildWebBodyLogin(type),
                // child: buildMobileBodyLogin(type),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMobileBodyLogin(DeviceType type) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: CommonStyle.setDynamicHeight(context: context, value: type == DeviceType.mobile ? 0.13 : 0.017),
              width: CommonStyle.setDynamicWidth(context: context, value: type == DeviceType.mobile ? 0.3 : 0.017),
              child: Image.network(
                "https://raw.githubusercontent.com/sobhashnaMilan/image/main/flutter_icon.png",
              ),
            ),
            type == DeviceType.mobile ? CommonStyle.verticalSpace(context, 0.01) : CommonStyle.verticalSpace(context, 0.035),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: CommonStyle.setDynamicHeight(context: context, value: type == DeviceType.mobile ? 0.1 : 0.011),
                  width: CommonStyle.setDynamicWidth(context: context, value: type == DeviceType.mobile ? 0.2 : 0.019),
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
        CommonStyle.verticalSpace(context, 0.025),
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
          child: buildLoginForm(type),
        ),
      ],
    );
  }

  Widget buildWebBodyLogin(DeviceType type) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: CommonStyle.setDynamicHeight(context: context, value: 0.19),
                width: CommonStyle.setDynamicWidth(context: context, value: 0.19),
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
                child: Image.network("https://raw.githubusercontent.com/sobhashnaMilan/image/main/flutter_icon.png"),
              ),
              CommonStyle.verticalSpace(context, 0.035),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: CommonStyle.setDynamicHeight(context: context, value: 0.11),
                    width: CommonStyle.setDynamicWidth(context: context, value: 0.11),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                child: buildLoginForm(type),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDoNotHaveAnAccountSection(DeviceType type) {
    return SizedBox(
      height: CommonStyle.setDynamicHeight(context: context, value: 0.035),
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: StringConstant.dontHaveAnAccountLabel.tr,
                style: type == DeviceType.mobile ? black100Medium18TextStyle(context) : black100Medium10TextStyle(context),
              ),
              TextSpan(
                text: " ${StringConstant.signupLabel.tr}",
                style: TextStyle(
                  fontFamily: StringConstant.poppinsFont,
                  fontSize: type == DeviceType.mobile ? MediaQuery.of(context).size.longestSide * 0.018 : MediaQuery.of(context).size.longestSide * 0.010,
                  fontWeight: FontWeight.w600,
                  color: AppColors.accentColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.to(
                        const SignupScreen(),
                        binding: SignupBinding(),
                      ),
              )
            ],
          ),
        ),
      ),
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
          textEditingController: controller.emailTextController,
          hint: StringConstant.emailFieldHint.tr,
          textInputType: TextInputType.emailAddress,
        )
      ],
    );
  }

  Widget buildHeadingSection(DeviceType type) {
    return Text(
      StringConstant.loginTitle.tr,
      style: type == DeviceType.mobile ? black100Medium24TextStyle(context) : black100Medium20TextStyle(context),
    );
  }

  Widget buildLoginButtonSection(DeviceType type) {
    return Obx(
      () => controller.isLoggingIn.value
          ? CommonStyle.displayLoadingIndicator(type)
          : ButtonComponent(
              context: context,
              backgroundColor: AppColors.accentColor,
              text: StringConstant.loginButtonLabel.tr.toUpperCase(),
              onPressed: () => checkValidation(),
            ),
    );
  }

  Widget buildLoginForm(DeviceType type) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildEmailFieldSection(type),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.01,
        ),
        buildPasswordFieldSection(type),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.035 : 0.025,
        ),
        buildLoginButtonSection(type),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.035 : 0.025,
        ),
        buildDoNotHaveAnAccountSection(
          ResponsiveUtil.isMobile(context) ? DeviceType.mobile : DeviceType.desktop,
        )
        /*  CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.005,
        ),
        Visibility(
          visible: type == DeviceType.mobile ? true : false,
          child: Text(
            "OR",
            style: black100Medium18TextStyle(context),
          ),
        ),
        CommonStyle.verticalSpace(
          context,
          type == DeviceType.mobile ? 0.02 : 0.00,
        ),
        Visibility(
          visible: type == DeviceType.mobile ? true : false,
          child: ButtonComponent(
            context: context,
            backgroundColor: AppColors.primaryColor,
            text: StringConstant.testChatModuleLabel.tr.toUpperCase(),
            // onPressed: () => Get.toNamed(ScreenRoutesConstant.chatListScreen),
            onPressed: () => loginAPICall(),
          ),
        ), */
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
            textInputAction: TextInputAction.done,
            iconSuffix: GestureDetector(
              onTap: () => controller.updatePasswordVisibility(),
              child: Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.longestSide * 0.008),
                padding: EdgeInsets.all(MediaQuery.of(context).size.longestSide * 0.008),
                color: Colors.transparent,
                child: Icon(
                  size: type == DeviceType.mobile ? MediaQuery.of(context).size.shortestSide * 0.04 : MediaQuery.of(context).size.shortestSide * 0.04,
                  controller.isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void checkValidation() {
    if (!controller.emailTextController.text.isStringValid()) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterEmailIDFieldValidation,
      );
    } else if (!controller.emailTextController.text.isEmail) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterValidEmailIDFieldValidation,
      );
    } else if (!controller.passwordTextController.text.isStringValid()) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.enterPasswordFieldValidation,
      );
    } else if (!controller.passwordTextController.text.isStringValid(minLength: 6)) {
      return SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: StringConstant.passwordLengthValidation,
      );
    } else {
      hideKeyboard(context);
      loginAPICall();
    }
  }

  void loginAPICall() async {
    Map<String, dynamic> requestParams = {};
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String fcmToken = preferences.getString(PreferenceKeys.prefKeyToken) ?? "";
    if (fcmToken.isEmpty) fcmToken = "121212121";
    requestParams['email'] = controller.emailTextController.text;
    requestParams['deviceType'] = "android";
    requestParams['deviceId'] = "121212";
    requestParams['fcm_token'] = fcmToken;
    requestParams['loginType'] = "1";
    requestParams['password'] = controller.passwordTextController.text;

    var loginResult = await controller.loginUserAPICall(
      requestParams: requestParams,
      onError: (msg) => SnackbarUtil.showSnackbar(
        context: context,
        type: SnackType.error,
        message: msg,
      ),
    );

    if (loginResult) {
      // ignore: use_build_context_synchronously
      // user connect
      Map<String, dynamic> socketParams = {};
      socketParams['userId'] = userDataSingleton.id;

      SocketManager.userConnectEvent(socketParams, onConnect: (data) {
        Get.offNamed(ScreenRoutesConstant.chatListScreen);
      });
    }
  }
}
