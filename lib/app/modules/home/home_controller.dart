import 'package:flutter_base/app/modules/modules.dart';

import '../../data/data.dart';

import 'home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository;
  HomeController(this.repository) {
    currentItem = menuItems[0];
  }

  late MenuItem currentItem;

  final List<MenuItem> menuItems = [
    MenuItem(
      menuType: MenuItemType.setting,
      icon: 'assets/icons/setting.png',
      title: 'Setting',
    ),
    MenuItem(
      menuType: MenuItemType.about,
      icon: 'assets/icons/about.png',
      title: 'About',
    ),
  ];

  getpage(MenuItemType menuType) {
    switch (menuType) {
      case MenuItemType.setting:
        return SettingPage();
      case MenuItemType.about:
        return AboutPage();
      default:
        return SettingPage();
    }
  }
}
