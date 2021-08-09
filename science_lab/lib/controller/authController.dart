import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:science_lab/controller/services/database.dart';
import 'package:science_lab/controller/userController.dart';
import 'package:science_lab/views/Model/users.dart';
import 'package:science_lab/views/root.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Rx<User> user;
  String get authUser => user.value?.email;

  @override
  void onReady() {
    super.onReady();
    user = Rx<User>(auth.currentUser);
    user.bindStream(auth.userChanges());
  }

  void createUser(String email, String userName, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      UserModel userModel = UserModel(
          id: userCredential.user.uid,
          name: userName,
          email: email,
          photo: "",
          tickets: 7);

      await Database().createUser(userModel);
      if (await Database().createUser(userModel)) {
        Get.find<UserContoller>().user = userModel;
        Get.off(Contt(), transition: Transition.rightToLeft);
      }
    } catch (e) {
      Get.snackbar("Error", e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.find<UserContoller>().user =
          await Database().getUser(userCredential.user.uid);
      Get.off(Root(), transition: Transition.rightToLeft);
    } catch (e) {
      Get.snackbar("Error", e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void forgotPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      Get.snackbar("Error", e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
      Get.find<UserContoller>().clear();
      Get.off(Root(), transition: Transition.rightToLeft);
    } catch (e) {
      Get.snackbar("Error", e.message, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
