import 'package:get/instance_manager.dart';
import '../../controllers/platform_channels/PlatformChannelsController.dart';
import '../../controllers/home/home_controller.dart';

class PlatformChannelsBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<PlatformChannelsController>(PlatformChannelsController());
    Get.lazyPut(() => PlatformChannelsController());
  }
}
