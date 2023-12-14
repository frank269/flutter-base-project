import '../data/data.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    injectService();
  }

  void injectService() {
    Get.putAsync(() => UserService().init());
  }
}
