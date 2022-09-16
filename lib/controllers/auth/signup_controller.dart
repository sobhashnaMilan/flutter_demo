import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isPasswordVisible = false.obs, isConfirmPasswordVisible = false.obs;
  String? gender;
  TextEditingController firstNameController = TextEditingController(),
      lastNameController = TextEditingController(),
      bioController = TextEditingController(),
      emailController = TextEditingController(),
      mobileController = TextEditingController(),
      passwordTextController = TextEditingController(),
      confirmPasswordTextController = TextEditingController();

  updatePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  updateConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
    update();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordTextController.dispose();
    confirmPasswordTextController.dispose();
    super.dispose();
  }
}
