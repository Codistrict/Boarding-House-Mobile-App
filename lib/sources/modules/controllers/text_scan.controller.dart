import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class TextScannerController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    textRecognizer.close();
  }

  RxBool isPermissionGranted = false.obs;
  Rx<TextRecognizer> textRecognizer = TextRecognizer().obs;

  final ImagePicker picker = ImagePicker();
  XFile? photo;

  Future grantPermission() async {
    if (!isPermissionGranted()) {
      await Permission.camera.request();
      if (await Permission.camera.isGranted) {
        isPermissionGranted.value = true;
      }
    }
  }

  Future openCamera() async {
    grantPermission();
    photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      scanImage();
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );
    } else {
      Get.snackbar('Error', 'Failed to pick image');
    }
  }

  Future<void> scanImage() async {
    try {
      final file = File(photo!.path);

      final inputImage = InputImage.fromFile(file);

      final recognizedText =
          await textRecognizer().processImage(inputImage).whenComplete(
                () => Get.back(),
              );

      // List<String> text = [];
      // recognizedText.text.split('\n').forEach((element) {
      //   text.add('ln- $element');
      // });

      // debugPrint('$text');

      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          Get.toNamed(
            '/postman/scanner',
            parameters: {'text': recognizedText.text},
          );
        },
      );
    } catch (e) {
      Get.snackbar('Error', 'An error occured when scanning text');
    }
  }
}
