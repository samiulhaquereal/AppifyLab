import 'package:appifylabtask/src/config/import/imports.dart';

class CreatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatePostController>(
            () => CreatePostController(),
        fenix: true
    );
  }
}
