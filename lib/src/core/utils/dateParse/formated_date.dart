import 'package:intl/intl.dart';

class FormatedDate{

  static FormatedDate? _instance;
  FormatedDate._internal();
  factory FormatedDate(){
    _instance ??= FormatedDate._internal();
    return _instance!;
  }

  String formatTime(String dateTime) {
    DateTime date = DateTime.parse(dateTime);
    return DateFormat.yMMMd().format(date);
  }
}