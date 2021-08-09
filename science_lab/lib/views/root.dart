import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:science_lab/controller/authController.dart';
import 'package:science_lab/controller/userController.dart';
import 'package:science_lab/views/Authentication/signIn.dart';
import 'package:science_lab/views/home.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserContoller>(UserContoller());
      },
      builder: (_) {
        if (Get.find<AuthController>().authUser != null) {
          return HomePage();
        } else {
          return SignIn();
        }
      },
    );
  }
}

class Contt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
