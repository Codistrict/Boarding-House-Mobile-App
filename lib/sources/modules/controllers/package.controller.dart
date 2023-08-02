import 'package:get/get.dart';
import 'controllers.dart';
import '../../services/services.dart';

class PackageController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (authController.role() == 1) {
      listPackage =
          packageService.readPackage(authController.uid(), '', '').obs;
      listPackageHistory =
          packageService.readPackageHistory(authController.uid(), '', '').obs;
    } else if (authController.role() == 2) {
      listPackage =
          packageService.readPackage('', authController.uid(), '').obs;
      listPackageHistory =
          packageService.readPackageHistory('', authController.uid(), '').obs;
    } else if (authController.role() == 3) {
      listPackage =
          packageService.readPackage('', '', authController.uid()).obs;
      listPackageHistory =
          packageService.readPackageHistory('', '', authController.uid()).obs;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  // Variable Declaration

  PackageService packageService = PackageService();
  AuthController authController = Get.find<AuthController>();

  late Rx<Future> listPackage;
  late Rx<Future> listPackageHistory;

  Rx<Future> detailPackage = Future.value().obs;

  getDetailPackage(packageId) {
    detailPackage = packageService.readPackageDetail(packageId).obs;
  }
}
