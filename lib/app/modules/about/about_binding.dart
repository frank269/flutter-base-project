import 'about_controller.dart';
import 'package:get/get.dart';

class AboutBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutController>(() => AboutController());
  }
}
