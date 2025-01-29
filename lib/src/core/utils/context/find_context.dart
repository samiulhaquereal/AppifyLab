import 'dart:developer' as dev;
import 'package:appifylabtask/src/config/import/imports.dart';

class FindContext{

  static FindContext? _instance;
  FindContext._internal();
  factory FindContext(){
    _instance ??= FindContext._internal();
    return _instance!;
  }

  static BuildContext? getContext() {
    BuildContext? context = navigatorKey.currentContext;
    if (context == null) {
      dev.log('Warning: BuildContext is null.');
    }
    return context;
  }
}
