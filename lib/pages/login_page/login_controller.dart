import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/domain/service/person_service.dart';
import 'package:fitlifebuddy/domain/service/shared_preferences.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class LoginController extends GetxController {
  final _personApi = Get.find<PersonApi>();
  final _patientApi = Get.find<PatientApi>();

  final _appToast = Get.find<AppToast>();
  final _formValidationService = Get.find<FormValidationService>();
  final _personService = Get.find<PersonService>();

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final obscurePassword = true.obs;
  final loading = false.obs;

  void setObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> login() async {
    if (_formValidationService.validateForm(loginFormKey)) {
      try {
        loading(true);
        final person = await _personApi.getPersonByEmailAddress(emailController.value.text);
        if (person == null || person.password != passwordController.value.text) {
          _appToast.showToast(
            message: 'invalid_credentials'.tr,
            type: ToastificationType.error,
          );
          return;
        }
        UserPreferences.setPersonId(person.id.toString());
        _personService.setPerson(person);
        await setPatient(person.id!);
        _appToast.showToast(
          message: 'successful_login'.tr,
          type: ToastificationType.success,
        );
        Get.toNamed(AppRoutes.home);
      } catch (e) {
        displayErrorToast(e);
      } finally {
        loading(false);
        reset();
      }
    }
  }

  Future<void> setPatient(int personId) async {
    try {
      final patients = await _patientApi.getPatients();
      if (patients.isNotEmpty) {
        final patient = patients.firstWhereOrNull((p) => p.person?.id == personId);
        if (patient != null) {
          UserPreferences.setPatientId(patient.id.toString());
        }
      }
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