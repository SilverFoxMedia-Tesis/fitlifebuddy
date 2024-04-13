import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _formValidationService = Get.find<FormValidationService>();

  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  
  final obscurePassword = true.obs;

  void setObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void login() {
    if (_formValidationService.validateForm(loginFormKey)) {
      try {
        Get.toNamed(AppRoutes.home);
      } catch (e) {
        displayErrorToast(e);
      }
    }
  }

  void forgotPassword() {
    try {
      Get.toNamed(AppRoutes.recoverPassword);
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void reset() {
    obscurePassword(true);
    emailController.value.clear();
    passwordController.value.clear();
  }
}