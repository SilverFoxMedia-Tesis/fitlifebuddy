import 'package:fitlifebuddy/core/utils/error_utils.dart';
//import 'package:fitlifebuddy/domain/api/email_api.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class RecoverPasswordController extends GetxController {
  //final _emailApi = Get.find<EmailApi>();
  final _formValidationService = Get.find<FormValidationService>();
  final _toastification = Get.find<AppToast>();

  final recoverFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController().obs;

  final loading = false.obs;

  Future<void> sendRecoverLink() async {
    try {
      if (_formValidationService.validateForm(recoverFormKey)) {
        loading(true);
        //final message = await _emailApi.recoverPassword(emailController.value.text);
        final message = 'Enviado'; //TODO: corregir
        if (message.contains('No encontrado')) {
          _toastification.showToast(
            message: 'email_is_not_associated'.tr,
            type: ToastificationType.error,
          ); 
          return;
        }
        if (message.contains('Enviado')) {
          _toastification.showToast(
            message: 'password_recovery_request_sent'.tr,
            type: ToastificationType.success,
          );
        }
        await Future.delayed(const Duration(seconds: 5));
        Get.back();
        _reset();
      }
    } catch (e) {
      displayErrorToast(e);
    } finally {
      loading(false);
    }
  }

  void _reset() {   
    emailController.value.clear();
  }
}