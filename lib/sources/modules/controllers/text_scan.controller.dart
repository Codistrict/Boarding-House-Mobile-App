import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skripsi_kos_app/sources/modules/controllers/controllers.dart';

import '../../services/services.dart';

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

  PackageService packageService = PackageService();
  AuthController authController = AuthController();
  PackageController pkgController = Get.find<PackageController>();

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

  Future openCamera(context) async {
    grantPermission();
    photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      scanImage(context);
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

  Future getData(recognizedText) async {
    List<String> text = [];
    int tempIndex = 0;

    for (var element in recognizedText.blocks) {
      text.add(element.text);
    }

    for (int i = 0; i < text.length; i++) {
      if (text[i] == 'Recipient') {
        tempIndex = i;
        break;
      }
    }

    Map<String, String> data = {
      'recipient': text[tempIndex + 1],
      'building': text[tempIndex + 2],
      'address': text[tempIndex + 3],
      'room': text[tempIndex + 4],
      'resi': text[tempIndex + 5],
    };

    return data;
  }

  Future<void> scanImage(context) async {
    try {
      final file = File(photo!.path);

      final inputImage = InputImage.fromFile(file);

      final recognizedText =
          await textRecognizer().processImage(inputImage).whenComplete(
                () => Get.back(),
              );

      await getData(recognizedText).then((value) {
        pkgController.setControllerData(value);
      });
    } catch (e) {
      Get.snackbar('Error', 'An error occured when scanning text');
    }
  }
}
