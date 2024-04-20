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

  final pageController = PageController(initialPage: 0);
  final currentPage = 0.obs;

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
  List<String> hCTypes = TypeHealthCondition.values.map((e) => e.label).toList();
  List<String> fCTypes = TypeFoodCondition.values.map((e) => e.label).toList();

  final genderSelected  = Gender.values.first.label.obs;

  //new health condition
  final newhConditionType = TypeHealthCondition.values.first.label.obs;
  final newHConditionController = TextEditingController().obs;

  // health conditions
  final hConditionTypes = <int, String>{}.obs;
  final hConditionsControllers = <int, TextEditingController>{}.obs;

  //new food conditions
  final newfConditionType = TypeFoodCondition.values.first.label.obs;
  final newFConditionController = TextEditingController().obs;

  // food conditions
  final fConditionTypes = <int, String>{}.obs;
  final fConditionsControllers = <int, TextEditingController>{}.obs;

  final currentPatient = Patient().obs;
  final currentPatientHistory = PatientHistory().obs;
  final currentFoodConditions = <FoodCondition>[].obs;
  final currentHealthConditions = <HealthCondition>[].obs;

  bool get hasFoodConditions => hConditionTypes.isNotEmpty;
  bool get hasHealthConditions => fConditionTypes.isNotEmpty;

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

  // @override
  // void dispose() {
  //   pageController.dispose();
  //   super.dispose();
  // }

  // void nextPage() {
  //   if (currentPage.value < pages.length - 1) {
  //     pageController.nextPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.ease,
  //     );
  //     currentPage.value++;
  //   }
  // }

  // void previousPage() {
  //   if (currentPage > 0) {
  //     pageController.previousPage(
  //       duration: const Duration(milliseconds: 300),
  //       curve: Curves.ease,
  //     );
  //     currentPage.value--;
  //   }
  // }

  void onChangedGender(String? value) {
    if (value != null && value != '') {
      genderSelected.value = value;
    }
  }

  void onChangedNewFoodCondition(String? value) {
    if (value != null && value != '') {
      newfConditionType.value = value;
    }
  }

  void onChangedFoodCondition(int index, String? value) {
    if (value != null && value != '') {
      fConditionTypes[index] = value;
    }
  }

  void onChangedNewHealthCondition(String? value) {
    if (value != null && value != '') {
      newhConditionType.value = value;
    }
  }

  void onChangedHealthCondition(int index, String? value) {
    if (value != null && value != '') {
      hConditionTypes[index] = value;
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

  void savePersonalInfo() {
    if (_formValidationService.validateForm(personalInfoFormKey)) {
      savePerson();
      savePatient();
      savePatientHistory();
      _appToast.showToast(
        message: 'personal_info_saved'.tr,
        type: ToastificationType.success,
      );
    }
  }

  void savePatient() {
    if (birthdateController.value.text.isNotEmpty) {
      currentPatient.value.birthDate = birthdateController.value.text;
    }
  }

  void savePerson() {
    currentPatient.value.person?.fullname = firstnameController.value.text;
    currentPatient.value.person?.lastname = lastnameController.value.text;
    currentPatient.value.person?.emailAddress = emailController.value.text;
  }

  void savePatientHistory() {
    currentPatientHistory.value.gender = EnumExtension.getLabel(Gender.values, genderSelected.value);
    currentPatientHistory.value.height = num.parse(heightController.value.text);
    currentPatientHistory.value.weight = num.parse(weightController.value.text);
    currentPatientHistory.value.patient = currentPatient.value;
  }

  void saveFCondition() {
    var index = fConditionTypes.length;
    fConditionTypes[index] = newfConditionType.value;
    fConditionsControllers[index] = TextEditingController();
    fConditionsControllers[index]?.text = newFConditionController.value.text;
    
    //reset
    newfConditionType.value = TypeFoodCondition.values.first.label;
    newFConditionController.value.clear();
  }

  void saveHCondition() {
    var index = hConditionTypes.length;
    hConditionTypes[index] = newhConditionType.value;
    hConditionsControllers[index] = TextEditingController();
    hConditionsControllers[index]?.text = newHConditionController.value.text;
    
    //reset
    newhConditionType.value = TypeHealthCondition.values.first.label;
    newHConditionController.value.clear();
  }

  Future<void> register() async {
    try {
      await registerPatient();
      await registerHConditions();
      await registerFConditions();
      _appToast.showToast(
          message: 'successful_registration'.tr,
          type: ToastificationType.success,
        );
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> registerHConditions() async {
    try {
      if (_formValidationService.validateForm(healthConditionsFormKey)) {
        for (var i = 0; i < hConditionTypes.length; i++) {
          var hCondition = HealthCondition(
            type: EnumExtension.getLabel(TypeHealthCondition.values, hConditionTypes[i]),
            name: hConditionsControllers[i]?.text,
            patient: currentPatient.value
          );
          await _healthConditionApi.createHealthCondition(hCondition, currentPatient.value.id!);
        }
        _appToast.showToast(
          message: 'health_conditions_saved'.tr,
          type: ToastificationType.success,
        );
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> registerFConditions() async {
    try {
      if (_formValidationService.validateForm(foodConditionsFormKey)) {
        for (var i = 0; i < hConditionTypes.length; i++) {
          var fCondition = FoodCondition(
            type: EnumExtension.getLabel(TypeFoodCondition.values, fConditionTypes[i]),
            name: fConditionsControllers[i]?.text,
            patient: currentPatient.value,
          );
          await _foodConditionApi.createFoodCondition(fCondition, currentPatient.value.id!);
        }
        _appToast.showToast(
          message: 'food_conditions_saved'.tr,
          type: ToastificationType.success,
        );
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> registerPatient() async {
    try {
      if (_formValidationService.validateForm(personalInfoFormKey)) {
        if (currentPatient.value.person != null) {
          currentPatient.value.person?.password = generatePassword();
          final newPerson = await _personApi.createPerson(currentPatient.value.person!);
          if (newPerson.id != null) {
            currentPatient.value.person = newPerson;
            final newPatient = await _patientApi.createPatient(currentPatient.value, newPerson.id!, 1);
            if (newPatient.id != null) {
              currentPatient.value = newPatient;
              await _patientHistoryApi.createPatientHistory(currentPatientHistory.value, newPatient.id!);
              _appToast.showToast(
                message: 'personal_info_saved'.tr,
                type: ToastificationType.success,
              );
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