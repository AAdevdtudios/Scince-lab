import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:science_lab/controller/uiControllers.dart';
import 'package:science_lab/views/Screens/ask.dart';
import 'package:science_lab/views/Screens/profile.dart';

class HomePage extends StatelessWidget {
  final UiController uiController = Get.put(UiController(), permanent: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => IndexedStack(
              index: uiController.tabIndex.value,
              children: [InstructionAsk(), Profile()],
            )),
        bottomNavigationBar: Obx(
          () => (BottomNavigationBar(
            backgroundColor: Colors.white,
            fixedColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Icon(MdiIcons.ocr),
                label: "OCR",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: "Profile",
              ),
            ],
            currentIndex: uiController.tabIndex.value,
            onTap: uiController.tabIndex,
          )),
        ));
  }
}
