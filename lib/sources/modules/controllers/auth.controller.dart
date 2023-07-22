import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../services/services.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPref();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    textCtrlName().dispose();
    textCtrlEmail().dispose();
    textCtrlPassword().dispose();

    textCtrBuilding().dispose();
    textCtrlStreet().dispose();
    textCtrlBiography().dispose();
  }

  // Variable

  AuthService authService = AuthService();

  final box = GetStorage();
  Rx<String> uid = "".obs;
  Rx<bool> session = false.obs;
  Rx<int> role = 0.obs;

  Rx<TextEditingController> textCtrlName = TextEditingController().obs;
  Rx<TextEditingController> textCtrlEmail = TextEditingController().obs;
  Rx<TextEditingController> textCtrlPassword = TextEditingController().obs;

  Rx<TextEditingController> textCtrBuilding = TextEditingController().obs;
  Rx<TextEditingController> textCtrlStreet = TextEditingController().obs;
  Rx<TextEditingController> textCtrlBiography = TextEditingController().obs;

  // Function
  void setPref(String uid, bool session, int role) async {
    box.write('uid', uid);
    box.write('session', session);
    box.write('role', role);

    debugPrint("Uid: $uid\nSession: $session\nRole: $role");
  }

  void getPref() async {
    uid(box.read('uid'));
    session(box.read('session'));
    role(box.read('role'));

    debugPrint("Uid: $uid\nSession: $session\nRole: $role");
  }

  Future signIn() async {
    session(true);
    debugPrint("Uid: $uid\nSession: $session\nRole: $role");

    if (role() == 1) {
      setPref("1user", session(), role());
      Get.offAllNamed('/user/nav');
    } else if (role() == 2) {
      setPref("1postman", session(), role());
      Get.offAllNamed('/postman/nav');
    } else {
      setPref("1admin", session(), role());
      Get.offAllNamed('/admin/nav');
    }
  }

  Future signUp() async {
    session(true);
    debugPrint("Uid: $uid\nSession: $session\nRole: $role");

    if (role() == 1) {
      setPref("1user", session(), role());
      Get.offAllNamed('/user/nav');
    } else if (role() == 2) {
      setPref("1postman", session(), role());
      Get.offAllNamed('/postman/nav');
    } else {
      setPref("1admin", session(), role());
      Get.offAllNamed('/admin/nav');
    }
  }

  Future signOut() async {
    uid("");
    session(false);
    role(0);
    setPref(uid(), session(), role());
    debugPrint("Uid: $uid\nSession: $session\nRole: $role");

    Get.offAllNamed('/');
  }
}
