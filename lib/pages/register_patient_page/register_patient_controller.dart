import 'dart:math';

import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/food_condition_api.dart';
import 'package:fitlifebuddy/domain/api/health_condition_api.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/patient_history_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/gender.dart';
import 'package:fitlifebuddy/domain/enum/type_food_condition.dart';
import 'package:fitlifebuddy/domain/enum/type_health_condition.dart';
import 'package:fitlifebuddy/domain/model/food_condition.dart';
import 'package:fitlifebuddy/domain/model/health_condition.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class RegisterPatientController extends GetxController{
  final _personApi = Get.find<PersonApi>();
  final _patientApi = Get.find<PatientApi>();
  final _patientHistoryApi = Get.find<PatientHistoryApi>();
  final _foodConditionApi = Get.find<FoodConditionApi>();
  final _healthConditionApi = Get.find<HealthConditionApi>();

  final _formValidationService = Get.find<FormValidationService>();
  final _appToast = Get.find<AppToast>();

  final PageController pageController = PageController();

  final personalInfoFormKey = GlobalKey<FormState>();
  final healthConditionsFormKey = GlobalKey<FormState>();
  final foodConditionsFormKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController().obs;
  final lastnameController = TextEditingController().obs;
  final birthdateController = TextEditingController().obs;
  final heightController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final emailController = TextEditingController().obs;

  List<String> genders = Gender.values.map((e) => e.label).toList();
  List<String> foodConditionTypes = TypeFoodCondition.values.map((e) => e.label).toList();
  List<String> healthConditionTypes = TypeHealthCondition.values.map((e) => e.label).toList();

  final genderSelectedValue  = Gender.values.first.label.obs;
  final foodConditionTypeSelectedValues = <int, String>{}.obs;
  final healthConditionTypeSelectedValues = <int, String>{}.obs;
  final foodConditionTypeSelectedControllers = <int, TextEditingController>{}.obs;
  final healthConditionTypeSelectedControllers = <int, TextEditingController>{}.obs;

  final currentPatient = Patient().obs;
  final currentPatientHistory = PatientHistory().obs;
  final currentFoodConditions = <FoodCondition>[].obs;
  final currentHealthConditions = <HealthCondition>[].obs;

  bool get hasFoodConditions => currentFoodConditions.isNotEmpty;
  bool get hasHealthConditions => currentHealthConditions.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void onChangedPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void onChangedGender(String? value) {
    if (value != null && value != '') {
      genderSelectedValue.value = value;
    }
  }

  void onChangedFoodCondition(int index, String? value) {
    if (value != null && value != '') {
      foodConditionTypeSelectedValues[index] = value;
    }
  }

  void onChangedHealthCondition(int index, String? value) {
    if (value != null && value != '') {
      healthConditionTypeSelectedValues[index] = value;
    }
  }

  void onTapDateTime() async {
    var selectedDate = DateTime.now();
    if (birthdateController.value.text.isNotEmpty) {
      selectedDate = DateTime.parse(currentPatient.value.birthDate!);
    }
    await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
        selectedDate = pickedDate;
        birthdateController.value.text = fromDateToInitial(selectedDate);
    });
  }

  Future<void> savePersonalInfo() async {
    try {
      if (_formValidationService.validateForm(personalInfoFormKey)) {
        savePerson();
        savePatient();
        savePatientHistory();
        _appToast.showToast(
          message: 'personal_info_saved'.tr,
          type: ToastificationType.success,
        );
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> savePatient() async {
    try {
      var patient = currentPatient.value;
      if (birthdateController.value.text.isNotEmpty) {
        patient.birthDate = birthdateController.value.text;
        currentPatient.value = patient;
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> savePerson() async {
    try {
      var person = currentPatient.value.person;
      person?.fullname = firstnameController.value.text;
      person?.lastname = lastnameController.value.text;
      person?.emailAddress = emailController.value.text;
      currentPatient.value.person = person;
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> savePatientHistory() async {
    try {
      var patientHistory = currentPatientHistory.value;
      patientHistory.gender = EnumExtension.getLabel(Gender.values, genderSelectedValue.value);
      patientHistory.height = num.parse(heightController.value.text);
      patientHistory.weight = num.parse(weightController.value.text);
      patientHistory.patient = currentPatient.value;
      currentPatientHistory.value = patientHistory;
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> saveHealthConditions() async {
    try {
      if (_formValidationService.validateForm(healthConditionsFormKey)) {
        for (var i = 0; i < currentHealthConditions.length; i++) {
          var hCondition = currentHealthConditions[i];
          hCondition.type = EnumExtension.getLabel(TypeHealthCondition.values, healthConditionTypeSelectedValues[i]);
          hCondition.name = healthConditionTypeSelectedControllers[i]?.text;
          hCondition.patient = currentPatient.value;
          currentHealthConditions[i] = hCondition;
        }
        _appToast.showToast(
          message: 'health_conditions_saved',
          type: ToastificationType.success,
        );
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> saveFoodConditions() async {
    try {
      if (_formValidationService.validateForm(foodConditionsFormKey)) {
        for (var i = 0; i < currentFoodConditions.length; i++) {
          var fCondition = currentFoodConditions[i];
          fCondition.type = EnumExtension.getLabel(TypeFoodCondition.values, foodConditionTypeSelectedValues[i]);
          fCondition.name = foodConditionTypeSelectedControllers[i]?.text;
          fCondition.patient = currentPatient.value;
          currentFoodConditions[i] = fCondition;
        }
        _appToast.showToast(
          message: 'food_conditions_saved',
          type: ToastificationType.success,
        );
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> registerPatient() async {
    try {
      if (currentPatient.value.person != null) {
        currentPatient.value.person?.password = generatePassword();
        final newPerson = await _personApi.createPerson(currentPatient.value.person!);
        if (newPerson.id != null) {
          currentPatient.value.person = newPerson;
          final newPatient = await _patientApi.createPatient(currentPatient.value, newPerson.id!, 1);
          if (newPatient.id != null) {
            currentPatient.value = newPatient;
            await _patientHistoryApi.createPatientHistory(currentPatientHistory.value, newPatient.id!);
            for (var i = 0; i < currentHealthConditions.length; i++) {
              currentHealthConditions[i].patient = currentPatient.value;
              await _healthConditionApi.createHealthCondition(currentHealthConditions[i], newPatient.id!);
            }
            for (var i = 0; i < currentFoodConditions.length; i++) {
              currentFoodConditions[i].patient = currentPatient.value;
              await _foodConditionApi.createFoodCondition(currentFoodConditions[i], newPatient.id!);
            }
          }
        }
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  String generatePassword() {
    const caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+';
    final random = Random();
    final buffer = StringBuffer();
    for (var i = 0; i < 8; i++) {
      final indice = random.nextInt(caracteres.length);
      buffer.write(caracteres[indice]);
    }
    return buffer.toString();
  }
}