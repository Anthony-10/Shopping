import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/authentication/controller/auth_controller.dart';
import 'package:shopping_app/authentication/view/auth_view.dart';
import 'package:shopping_app/core/widget/drawer/drawer_view/drawer_view.dart';

class RegisterStatus extends StatelessWidget {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (authController.user != null) ? DrawerView() : AuthView();
    });
  }
}
