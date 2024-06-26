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

String? validateLettersOnly(String? input) {
  input = input ?? "";
  if (input.trim().isEmpty) {
    return "validator_empty".tr;
  } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(input)) {
    return "validator_letters_invalid".tr;
  }
  return null;
}

String? validateNumbersOnly(String? input) {
  input = input ?? "";
  if (input.trim().isEmpty) {
    return "validator_empty".tr;
  } else if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
    return "validator_numbers_invalid".tr;
  }
  return null;
}

String? validateNotNullOrEmpty(String? input) {
  if (input == null || input.trim().isEmpty) {
    return "validator_empty".tr;
  }
  return null;
}

String? validateWeightAndHeight(String? input) {
  input = input ?? "";
  if (input.trim().isEmpty) {
    return "validator_empty".tr;
  } else if (input.length > 3) {
    return "validator_max_length".tr;
  } else if (int.parse(input) > 250) {
    return "validator_max_input".tr;
  } else if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
    return "validator_numbers_invalid".tr;
  }
  return null;
}