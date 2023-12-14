import '../app/modules/modules.dart';
import 'package:get/get.dart';
part './routes.dart';

class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ABOUT,
      page: () => AboutPage(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: Routes.SETTING,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
  ];
}
