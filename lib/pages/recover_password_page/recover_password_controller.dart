import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class RecoverPasswordController extends GetxController {
  final _formValidationService = Get.find<FormValidationService>();
  final _toastification = Get.find<AppToast>();
  final emailController = TextEditingController().obs;
  final recoverFormKey = GlobalKey<FormState>();

  Future<void> sendRecoverLink() async {
    if (_formValidationService.validateForm(recoverFormKey)) {
      try {
        _toastification.showToast(
          message: 'password_recovery_request_sent'.tr,
          type: ToastificationType.success,
        );   
        await Future.delayed(const Duration(seconds: 5));
        Get.back();
        reset();
      } catch (e) {
        displayErrorToast(e);
      }
    }
  }

  void reset() {   
    emailController.value.clear();
  }
}