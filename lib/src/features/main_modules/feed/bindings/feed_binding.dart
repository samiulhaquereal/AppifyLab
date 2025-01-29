import 'package:appifylabtask/src/config/import/imports.dart';

class FeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeedController>(
            () => FeedController(),
        fenix: true
    );
  }
}
