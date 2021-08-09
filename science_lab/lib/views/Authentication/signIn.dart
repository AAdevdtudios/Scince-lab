import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:science_lab/Designs/inputDesign.dart';
import 'package:science_lab/controller/authController.dart';
import 'package:science_lab/controller/firebaseConst.dart';
import 'package:science_lab/controller/uiControllers.dart';
import 'package:science_lab/views/Authentication/signUp.dart';

class SignIn extends GetWidget<AuthController> {
  final UiController uiController = Get.put(UiController(), permanent: false);
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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
                    hint: "Password",
                    topText: "Password*",
                    obscureText: true,
                    controller: controller2.password,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller2.signIn,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF282834)),
                      ),
                      child: Text(
                        "SIGN IN",
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
                          text: "New user ?",
                          style: TextStyle(
                            color: Colors.black38,
                          )),
                      TextSpan(text: " "),
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.red,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(SignUp(),
                              transition: Transition.rightToLeft),
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
