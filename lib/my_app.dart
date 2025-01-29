import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appifylabtask/src/config/import/imports.dart';

class StatusBarColorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppEnvironment.statusBarColor,
      statusBarIconBrightness: AppEnvironment.statusBarIconColor,
    ));
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppEnvironment.statusBarColor,
      statusBarIconBrightness: AppEnvironment.statusBarIconColor,
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      child: SafeArea(
        child: GetMaterialApp(
          navigatorKey: navigatorKey,
          title: AppEnvironment.title,
          debugShowCheckedModeBanner: AppEnvironment.debugBanner,
          defaultTransition: Transition.rightToLeft,
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
          ),
          initialBinding: InitialBinding(),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          unknownRoute: AppPages.unknownRoute,
          builder: EasyLoading.init(),
          navigatorObservers: [StatusBarColorObserver()],
        ),
      ),
    );
  }
}
