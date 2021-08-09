import 'package:get/get.dart';
import 'package:science_lab/controller/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
