import 'package:appifylabtask/src/config/import/imports.dart';

abstract class BaseController extends GetxController {

  ApiServices get apiServices => ApiServices();
  SessionManager get prefs => SessionManager();
  BuildContext? get buildContext => FindContext.getContext();

  Future<void> showLoader() async {
    Future.delayed(
      Duration.zero,
      () => Get.toNamed(
            Routes.getLoadingRoute(),
      ),
    );
  }

  void closeLoader() {
    Get.until((route) => route.settings.name != Routes.getLoadingRoute());
  }


  Future<void> dataFetcher(
      Future<void> Function() fetchDataFunction, {
        bool shouldShowLoader = true,
      }) async {
      if (shouldShowLoader) {
        await showLoader();
      }
      try {
        await fetchDataFunction();
      } finally {
        if (shouldShowLoader) {
          closeLoader();
        }
      }
  }

  @override
  void onClose() {
    super.onClose();
  }
}