import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:science_lab/controller/uiControllers.dart';

class InstructionAsk extends StatelessWidget {
  final UiController uiController = Get.put(UiController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    if(!uiController.cameraController.value.isInitialized){
      return Container();
    }
    return GestureDetector(
      onDoubleTap: uiController.onFocusModeButtonPressed,
      child: Container(
        height: double.infinity,
          width: double.infinity,
          child: CameraPreview(
              uiController.cameraController,
            child: Stack(
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black12,
                              child: Icon(
                                MdiIcons.rotateLeft,
                                color: Colors.white38,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: uiController.onTakePictureButtonPressed,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: Icon(
                                MdiIcons.camera,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: uiController.onPickPictureButtonPressed,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black12,
                              child: Icon(
                                Icons.image,
                                color: Colors.white38,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: ()=>uiController.setFlashMode(FlashMode.always),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor:uiController.cameraController.value.flashMode ==FlashMode.always? Colors.blue: Colors.black54,
                            child: Icon(
                              MdiIcons.flash,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: ()=>uiController.setFlashMode(FlashMode.auto),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor:uiController.cameraController.value.flashMode ==FlashMode.auto? Colors.blue: Colors.black54,
                            child: Icon(
                              MdiIcons.flashAuto,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: ()=>uiController.setFlashMode(FlashMode.off),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor:uiController.cameraController.value.flashMode ==FlashMode.off? Colors.blue: Colors.black54,
                            child: Icon(
                              Icons.flash_off,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: ()=>uiController.setFlashMode(FlashMode.torch),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor:uiController.cameraController.value.flashMode ==FlashMode.torch? Colors.blue: Colors.black54,
                            child: Icon(
                              Icons.highlight,
                              color: Colors.white38,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
      ),
    );
  }
}
