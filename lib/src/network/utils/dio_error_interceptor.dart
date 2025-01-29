import 'package:dio/dio.dart';
import 'package:appifylabtask/src/config/import/imports.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  @override
  Future<void> onError(DioError error, ErrorInterceptorHandler handler) async {
    final response = error.response;
    final requestOptions = error.requestOptions;
    final endpoint = requestOptions.path;
    Get.until((route) => route.settings.name != Routes.getLoadingRoute());
    if (response != null && response.statusCode != null) {
      Get.until((route) => route.settings.name != Routes.getLoadingRoute());
      final data = response.data;
      final errorMessage = AppStrings.somethingWrongMessage;
      /*await CustomDialog().show(
        title: errorMessage,
        buttonText: AppStrings.back,
        buttonColor: AppColors.secondaryColor,
        buttonTextColor: AppColors.whiteColor,
        onTap: () => Get.back(),
        mode: Mode.error,
      );*/
    }
    return handler.next(error);
  }
}
