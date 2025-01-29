import 'package:appifylabtask/src/config/import/imports.dart';

class SplashController extends BaseController{

  @override
  void onInit() async{
    super.onInit();
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(Routes.getLoginRoute());
  }

  @override
  void onClose() {
    super.onClose();
  }
}