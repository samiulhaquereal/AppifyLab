import 'package:appifylabtask/src/config/import/imports.dart';

abstract class AppEnvironment {
  static late String baseUrl;
  static late String title;
  static late bool debugBanner;
  static late int sessionTimeout;
  static late int renewSession;
  static late Environment _environment;
  static late Color statusBarColor;
  static late Brightness statusBarIconColor;

  static Environment get environment => _environment;

  static void setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.development:
        {
          title = '${AppStrings.appName} - Dev';
          sessionTimeout = 1800;
          renewSession = 1500;
          debugBanner = true;
          statusBarColor = AppColors.primaryColor;
          statusBarIconColor = Brightness.light;
          break;
        }
      case Environment.production: {
        title = AppStrings.appName;
        debugBanner = false;
        baseUrl = '${dotenv.env['BASE_URL']}';
        statusBarColor = AppColors.primaryColor;
        statusBarIconColor = Brightness.light;
        break;
      }
    }
  }
}