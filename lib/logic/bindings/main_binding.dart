import 'package:dummy_shop/logic/controllers/main_controller.dart';
import 'package:dummy_shop/logic/controllers/payment_controller.dart';
import 'package:dummy_shop/logic/controllers/settings_controller.dart';
import 'package:get/get.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PayMentController(), permanent: true);
  }
}
