import 'package:flutter/material.dart';
import 'about_controller.dart';
import 'package:get/get.dart';

class AboutPage extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('About Page'));
  }
}
