import 'package:appifylabtask/src/config/import/imports.dart';

abstract class AppColors {
  static Color primaryColor = ColorParse().parseColor('001E6C');
  static Color secondaryColor = ColorParse().parseColor('0078E6');
  static Color whiteColor = ColorParse().parseColor('FFFFFF');
  static Color blackColor = ColorParse().parseColor('000000');
  static const Color grayColor = Colors.grey;
  static const Color greenColor = Colors.green;
  static const Color redColor = Colors.red;
  static const Color redAccentColor = Colors.redAccent;
  static const Color transparentColor = Colors.transparent;
  static Color yellowColor = ColorParse().parseColor('D1990A');
  static Color errorColor = ColorParse().parseColor('bf2d26');

  static Color dialogBoxSuccessColor = ColorParse().parseColor('12C069');
  static Color dialogBoxErrorColor = ColorParse().parseColor('91011E');
  static Color dialogBoxAlertColor = ColorParse().parseColor('29363F');
  static Color dialogBoxInfoColor = ColorParse().parseColor('C99207');
}




