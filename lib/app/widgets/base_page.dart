import 'package:flutter/material.dart';
import 'base_controller.dart';
import 'package:get/get.dart';

class BasePage extends GetView<BaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BasePage')),
        body: SafeArea(child: Text('BaseController')));
  }
}
