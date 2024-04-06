import 'package:flutter/material.dart';

class FormValidationService {
  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState != null && formKey.currentState!.validate();
  }

  void clearValidations(GlobalKey<FormState> formKey) {
    formKey.currentState?.reset();
  }
}