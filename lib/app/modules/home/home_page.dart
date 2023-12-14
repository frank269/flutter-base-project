import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  RxString selectedValue = "".obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text(controller.currentItem.title)),
          body: controller.getpage(controller.currentItem.menuType),
          drawer: Drawer(
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.menu),
                title: Text(controller.menuItems[index].title),
                onTap: () {
                  Get.back();
                  controller.currentItem = controller.menuItems[index];
                  mounted ? setState(() {}) : null;
                },
              ),
              itemCount: controller.menuItems.length,
            ),
          ),
        );
      },
    );
  }
}
