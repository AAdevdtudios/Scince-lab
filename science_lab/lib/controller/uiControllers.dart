import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:science_lab/main.dart';

class UiController extends GetxController with SingleGetTickerProviderMixin {
  var tabIndex = 0.obs;
  RxBool visible = false.obs;
  CameraController cameraController;
  File imageFile;
  File cropper;
  File galleryFile;
  AnimationController _focusModeControlRowAnimationController;
  final picker = ImagePicker();

  void changeTab(int index) {
    tabIndex.value = index;
  }

  Future<void> setFlashMode(FlashMode mode) async {
    if (cameraController == null) {
      return;
    }

    try {
      await cameraController?.setFlashMode(mode);
    } on CameraException catch (e) {
      _showCameraException(e.description);
      rethrow;
    }
  }

  void _showCameraException(String e) {
    Get.snackbar("Error", e);
  }

  void onFocusModeButtonPressed() {
    if (_focusModeControlRowAnimationController.value == 1) {
      _focusModeControlRowAnimationController.reverse();
    } else {
      _focusModeControlRowAnimationController.forward();
    }
  }

  void onTakePictureButtonPressed() {
    takePicture().then((XFile file) async {
      if (file != null) {
        imageFile = File(file.path);
        Get.dialog(Image.file(imageFile));

        if (file != null)
          Get.snackbar("Image", "Picture saved to ${file.path}");
      }
    });
  }

  Future<void> onPickPictureButtonPressed() async {
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 500,
    );
    galleryFile = File(picked.path);
    if (galleryFile != null) {
      Get.dialog(Image.file(galleryFile));
    } else {
      Get.snackbar("Error", "Un-able to get image");
    }
  }

  Future<XFile> takePicture() async {
    final CameraController controller = cameraController;
    if (controller == null || !controller.value.isInitialized) {
      Get.snackbar("Error", "Error: select a camera first.");
      return null;
    }

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      XFile file = await controller.takePicture();
      return file;
    } on CameraException catch (e) {
      Get.snackbar("Error", e.description);
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _focusModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    cameraController = CameraController(camera[0], ResolutionPreset.max);
    cameraController.initialize();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }
}
