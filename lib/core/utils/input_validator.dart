import 'package:get/get.dart';

String? validateRequiredEmail(String? email) {
  email = email ?? "";
  if (email.trim().isEmpty) {
    return "validator_empty".tr;
  } else {
    return validateEmail(email);
  }
}

String? validateEmail(String? email) {
  if (email?.trim().isEmpty ?? true) {
    return null;
  }
  RegExp regex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  if (email != null && !regex.hasMatch(email.trim())) {
    return "validator_email_invalid".tr;
  } else {
    return null;
  }
}

String? validatePassword(String? password) {
  password = password ?? "";
  if (password.trim().isEmpty) {
    return "validator_empty".tr;
  } else if (password.length < 6) {
    return "validator_password_invalid".tr;
  }
  return null;
}