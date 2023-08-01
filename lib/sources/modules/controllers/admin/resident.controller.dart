import 'package:get/get.dart';

import '../../../services/services.dart';
import '../controllers.dart';

class ResidentController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    listResident =
        adminService.readAllResident(authController.buildingId()).obs;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  AdminService adminService = AdminService();
  final authController = Get.find<AuthController>();

  late Rx<Future> listResident;

  Future delResident(residentId) async {
    var response = await adminService.deleteResident(residentId).whenComplete(
      () {
        Get.back();
        Get.back();
      },
    );

    if (response[0] == 200) {
      listResident.value =
          adminService.readAllResident(authController.buildingId());
    } else if (response[0] == 404) {
      return Get.snackbar("Error", response[1]);
    } else {
      return Get.snackbar("Error", response);
    }
  }
}
