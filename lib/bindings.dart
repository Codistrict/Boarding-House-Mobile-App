import 'package:get/get.dart';

import 'sources/modules/controllers/controllers.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}

class NavBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => NavController(), fenix: true);
  }
}

class TextScannerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TextScannerController(), fenix: true);
  }
}

class ImagePickerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ImagePickerController(), fenix: true);
  }
}
