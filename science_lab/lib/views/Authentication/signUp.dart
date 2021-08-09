import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:science_lab/Designs/inputDesign.dart';
import 'package:science_lab/controller/authController.dart';
import 'package:science_lab/controller/firebaseConst.dart';

class SignUp extends GetWidget<AuthController> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              "images/logodesign.png",
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  InputDesign(
                    controller: controller2.email,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InputDesign(
                    controller: controller2.userName,
                    topText: "Username*",
                    hint: "Username",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InputDesign(
                    controller: controller2.password,
                    hint: "Password",
                    topText: "Password*",
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                      onPressed: controller2.signUp,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF282834)),
                      ),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                            color: Colors.black38,
                          )),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GoogleAuthButton(
                    onPressed: () {},
                    style: AuthButtonStyle(
                      buttonType: AuthButtonType.icon,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
