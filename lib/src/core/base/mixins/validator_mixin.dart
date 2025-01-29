import 'package:get/get.dart';

mixin ValidatorMixin {
  static const String _requiredErrorMessage = '*Required';

  String? requiredValidator(String? value) {
    if (value == null || value.isEmpty) {
      return _requiredErrorMessage;
    }
    return null;
  }

  String? emailValidator(String? value) {
    if (requiredValidator(value) != null) {
      return _requiredErrorMessage;
    }
    if (!GetUtils.isEmail(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (requiredValidator(value) != null) {
      return _requiredErrorMessage;
    }
    if (value!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value, String? password) {
    if (requiredValidator(value) != null) {
      return _requiredErrorMessage;
    }
    if (value != password) {
      return 'Passwords does not match';
    }
    return null;
  }

  String? listValidator(List? value) {
    if (value == null || value.isEmpty) {
      return _requiredErrorMessage;
    }
    return null;
  }
}