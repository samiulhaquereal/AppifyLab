import 'package:appifylabtask/src/config/import/imports.dart';

class InitialBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    await SessionManager().init();
  }
}