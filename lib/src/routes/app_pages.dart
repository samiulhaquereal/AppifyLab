import 'package:appifylabtask/src/config/import/imports.dart';
import 'package:appifylabtask/src/features/authentication/login/bindings/login_binding.dart';
import 'package:appifylabtask/src/features/authentication/login/screen/login_screen.dart';

class AppPages {
  AppPages._();
  static String initial = Routes.getSplashRoute();
  static final unknownRoute = GetPage(
    name: Routes.getPageNotFoundRoute(),
    page: () => NotFoundScreen(),
    transition: Transition.fadeIn,
  );
  static List<GetPage> routes = [
    GetPage(
        name: Routes.getSplashRoute(),
        page: SplashScreen.new,
        binding: SplashBinding()
    ),
    GetPage(
        name: Routes.getLoadingRoute(),
        page: ()=> const LoaderScreen(),
        opaque: false,
        transition: Transition.fadeIn,
        preventDuplicates: true,
        fullscreenDialog: true,
    ),
    GetPage(
      name: Routes.getLoginRoute(),
      page: ()=> LoginScreen(),
      binding:LoginBinding(),
    ),
    GetPage(
        name: Routes.getDashboardRoute(),
        page: ()=> DashboardScreen(),
        binding:DashboardBinding(),
    ),
  ];
}