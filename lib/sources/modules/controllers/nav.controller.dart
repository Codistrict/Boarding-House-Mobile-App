import 'package:get/get.dart';
import 'controllers.dart';

class NavController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ctrlAuth.getPref();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  final ctrlAuth = Get.find<AuthController>();
  Rx<int> selectedIndex = 0.obs;
}
