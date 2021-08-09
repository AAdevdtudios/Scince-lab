import 'package:get/get.dart';
import 'package:science_lab/views/Model/users.dart';

class UserContoller extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;

  UserModel get user => userModel.value;

  set user(UserModel value) => this.userModel.value = value;

  void clear() {
    userModel.value = UserModel();
  }
}
