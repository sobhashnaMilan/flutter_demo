import 'package:flutter_demo/controllers/auth/signup_controller.dart';
import 'package:get/instance_manager.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}
