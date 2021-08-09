import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:science_lab/controller/firebaseConst.dart';
import 'package:science_lab/views/Authentication/signIn.dart';
import 'package:science_lab/views/Model/users.dart';
import 'package:science_lab/views/home.dart';

class AuthController2 extends GetxController {
  static AuthController2 instance = Get.find();
  Rx<User> firebaseUser;
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();

  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User user) {
    if (user == null) {
      Get.offAll(SignIn());
    } else {
      Get.offAll(HomePage());
    }
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) => initializes(result.user.uid));
      clearController();
    } catch (e) {
      Get.snackbar("Error", e.message);
    }
  }

  void signUp() async {
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String uid = result.user.uid;
        firebaseFirestore.doc(result.user.uid).set({
          "id": uid,
          "name": userName.text.trim(),
          "email": email.text.trim(),
          "photo": "",
          "ticket": 7
        });
        initializes(uid);
      });
      clearController();
    } catch (e) {
      Get.snackbar("Error", e.message);
    }
  }

  void signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      Get.snackbar("Error", e.message);
    }
  }

  initializes(String uid) async {
    userModel.value = await firebaseFirestore
        .doc(uid)
        .get()
        .then((value) => UserModel.fromDocumentSnapshot(value));
    print(userModel.value.name);
  }

  showLoading() {
    Get.defaultDialog(
        title: "Loading",
        content: CircularProgressIndicator(),
        barrierDismissible: false);
  }

  clearController() {
    userName.clear();
    email.clear();
    password.clear();
  }
}
