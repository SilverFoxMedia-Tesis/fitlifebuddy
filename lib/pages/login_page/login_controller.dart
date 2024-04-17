import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class LoginController extends GetxController {
  final _personApi = Get.find<PersonApi>();

  final _formValidationService = Get.find<FormValidationService>();
  final _appToast = Get.find<AppToast>();

  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  
  final obscurePassword = true.obs;
  final isloading = false.obs;

  void setObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    if (_formValidationService.validateForm(loginFormKey)) {
      try {
        isloading.value = true;
        var person = await _personApi.getPersonByEmailAddress(emailController.value.text);
        if (person == null || person.password != passwordController.value.text) {
          _appToast.showToast(
            message: 'invalid_credentials'.tr,
            type: ToastificationType.error,
          );
          return;
        }
        _appToast.showToast(
          message: 'successful_login'.tr,
          type: ToastificationType.success,
        );
        Get.toNamed(AppRoutes.home);
      } catch (e) {
        displayErrorToast(e);
      } finally {
        isloading.value = false;
      }
    }
  }

  void forgotPassword() {
    Get.toNamed(AppRoutes.recoverPassword);
  }

  void register() {
    Get.toNamed(AppRoutes.registerPatient);
  }

  void reset() {
    obscurePassword(true);
    emailController.value.clear();
    passwordController.value.clear();
  }
}