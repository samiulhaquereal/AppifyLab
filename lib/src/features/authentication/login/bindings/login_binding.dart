import 'package:appifylabtask/src/config/import/imports.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(
            () => LoginScreenController(),
        fenix: true
    );
  }
}
