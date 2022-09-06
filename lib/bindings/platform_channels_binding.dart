import 'package:get/instance_manager.dart';
import '../controllers/PlatformChannelsController.dart';
import '../controllers/home_controller.dart';

class PlatformChannelsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<PlatformChannelsController>(PlatformChannelsController());
    Get.lazyPut(() => PlatformChannelsController());
  }
}
