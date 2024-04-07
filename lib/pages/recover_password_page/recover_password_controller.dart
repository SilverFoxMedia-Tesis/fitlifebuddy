import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordController extends GetxController {
  final _formValidationService = Get.find<FormValidationService>();
  final emailController = TextEditingController().obs;
  final recoverFormKey = GlobalKey<FormState>();

  void sendRecoverLink() {
    if (_formValidationService.validateForm(recoverFormKey)) {
      try {
        Get.toNamed(AppRoutes.home);
      } catch (e) {
        // TODO: display error message
      }
    }
  }

  void reset() {   
    emailController.value.clear();
  }
}