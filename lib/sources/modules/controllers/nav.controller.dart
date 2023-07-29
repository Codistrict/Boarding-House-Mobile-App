import 'package:get/get.dart';
import 'controllers.dart';

class NavController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  final ctrlAuth = Get.find<AuthController>();
  final imagePickerController = Get.find<ImagePickerController>();
  Rx<int> selectedIndex = 0.obs;
}
