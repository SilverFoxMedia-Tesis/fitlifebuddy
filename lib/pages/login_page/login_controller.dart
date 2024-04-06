import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _formValidationService = Get.find<FormValidationService>();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final obscurePassword = true.obs;
  final loginFormKey = GlobalKey<FormState>();

  void setObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void login() {
    if (_formValidationService.validateForm(loginFormKey)) {
      try {
        Get.toNamed(AppRoutes.home);
      } catch (e) {
        // TODO: display error message
      }
    }
  }

  void forgotPassword() {
    try {
      Get.toNamed(AppRoutes.recoverPassword);
    } catch (e) {
      // TODO: display error message
    }
  }

  void reset() {
    obscurePassword(true);
    emailController.value.clear();
    passwordController.value.clear();
  }
}