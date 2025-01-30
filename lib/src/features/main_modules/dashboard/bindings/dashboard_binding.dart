import 'package:appifylabtask/src/config/import/imports.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardScreenController>(
            () => DashboardScreenController(),
        fenix: true
    );
    Get.lazyPut<NewsFeedController>(
            () => NewsFeedController(),
        fenix: true
    );
  }
}
