import 'dart:math';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/datetime_utils.dart';
import 'package:fitlifebuddy/domain/enum/health_conditions_cases.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/food_condition_api.dart';
import 'package:fitlifebuddy/domain/api/health_condition_api.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/patient_history_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/enum/diet_type.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/food_category.dart';
import 'package:fitlifebuddy/domain/enum/food_condition_type.dart';
import 'package:fitlifebuddy/domain/enum/gender.dart';
import 'package:fitlifebuddy/domain/enum/physical_activity.dart';
import 'package:fitlifebuddy/domain/enum/health_condition_type.dart';
import 'package:fitlifebuddy/domain/model/food_condition.dart';
import 'package:fitlifebuddy/domain/model/health_condition.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';
import 'package:fitlifebuddy/domain/model/person.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/routes/app_routes.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  final firstnameController = TextEditingController().obs;
  final lastnameController = TextEditingController().obs;
  final birtdateController = TextEditingController().obs;
  final heightController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final absPerimeterController = TextEditingController().obs;
  final emailController = TextEditingController().obs;

  final surgeriesController = MultiSelectController<String>([]).obs;
  final illnessesController = MultiSelectController<String>([]).obs;
  final preferencesController = MultiSelectController<String>([]).obs;
  final restrictionsController = MultiSelectController<String>([]).obs;
  final allergiesController = MultiSelectController<String>([]).obs;

  final genders = Gender.values.map((e) => e.label).toList();
  final diettypes = DietType.values.map((e) => e.label).toList();
  final physicalactivities = PhysicalActivity.values.map((e) => e.label).toList();
  final surgeries = Surgery.values.map((e) => e.label).toList();
  final illnesses = Illness.values.map((e) => e.label).toList();
  final preferences = FoodCategory.values.map((e) => e.label).toList();
  final restrictions = FoodCategory.values.map((e) => e.label).toList();
  final allergies = FoodCategory.values.map((e) => e.label).toList();

  final currentPatient = Patient().obs;
  var _selectedBirthdate = DateTime.now();
  var _selectedGender = '';
  var _selectedDietType = '';
  var _selectedPhysicalActivity = '';
  var patientHistory = PatientHistory();
  var healthConditions = <HealthCondition>[];
  var foodConditions= <FoodCondition>[];
  var _hasDiabetes = false;

  final loading = false.obs;

  Future<void> onChangedPage(int pageIndex) async {
    await pageController.animateToPage(
      pageIndex, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    currentPage(pageIndex);
  } 

  void onChangedGender(String value) {
    _selectedGender = value;
  }

  void onChangeBirthDate(DateTime? value) {
    if (value != null) {
      _selectedBirthdate = value;
    }
  }
  
  void onChangedDietType(String value) {
    _selectedDietType = value;
  }

  void onChangedPhysicalActivity(String value) {
    _selectedPhysicalActivity = value;
  }

  Future<void> savePersonalInfo() async {
    if (_formValidationService.validateForm(personalInfoFormKey)) {
      _savePerson();
      _savePatient();
      _savePatientHistory();
      _appToast.showToast(
        message: 'personal_info_saved'.tr,
        type: ToastificationType.success,
      );
      await onChangedPage(1);
    }
  }

  void _savePerson() {
    currentPatient.value.person = Person(
      fullname: firstnameController.value.text,
      lastname: lastnameController.value.text,
      emailAddress: emailController.value.text,
    );
  }

  void _savePatient() {
    if (birtdateController.value.text.isNotEmpty) {
      currentPatient.value.birthDate = fromDateToInitial(_selectedBirthdate);
      patientHistory.age = calculateAge(_selectedBirthdate);
    }
  }

  void _savePatientHistory() {
    patientHistory.gender = EnumExtension.getLabel(Gender.values, _selectedGender);
    patientHistory.height = num.parse(heightController.value.text);
    patientHistory.weight = num.parse(weightController.value.text);
    patientHistory.abdominalCircumference = num.parse(absPerimeterController.value.text);
    patientHistory.dietType = EnumExtension.getLabel(DietType.values, _selectedDietType);
    patientHistory.physicalActivity = EnumExtension.getLabel(PhysicalActivity.values, _selectedPhysicalActivity);
  }

  Future<void> saveHealthConditions() async {
    _saveAsHealthConditionList(surgeriesController.value.value, HealthConditionType.surgery);
    _saveAsHealthConditionList(illnessesController.value.value, HealthConditionType.illness);
    _savePatientHistoryHealthConditionType();
    _appToast.showToast(
      message: 'health_conditions_saved'.tr,
      type: ToastificationType.success,
    );
    await onChangedPage(2);
  }

  void _saveAsHealthConditionList(List<String> items, HealthConditionType type) {
    final list = (type == HealthConditionType.surgery) ? Surgery.values : Illness.values;
    healthConditions.addAll(
      items.map((item) {
        dynamic e = EnumExtension.getLabel(list, item);
        var value = e.value;
        if(value.contains('diabetes')) _hasDiabetes = true;
        return HealthCondition(
          id: 0,
          name: value, 
          description: '',
          type: type,
        );
      }),
    );
  }

  void _savePatientHistoryHealthConditionType() {
    if (healthConditions.isEmpty) {
      patientHistory.typeHealthCondition = HealthConditionType.no;
      return;
    }
    if (_hasDiabetes == true) {
      patientHistory.typeHealthCondition = HealthConditionType.diabetes;
      return;
    }
    patientHistory.typeHealthCondition = HealthConditionType.no;
  }

  Future<void> saveFoodConditions() async {
    _saveAsFoodConditionList(preferencesController.value.value, FoodConditionType.preference);
    _saveAsFoodConditionList(restrictionsController.value.value, FoodConditionType.restriction);
    _saveAsFoodConditionList(allergiesController.value.value, FoodConditionType.allergy);
    _appToast.showToast(
      message: 'food_conditions_saved'.tr,
      type: ToastificationType.success,
    );
    await register();
  }

  void _saveAsFoodConditionList(List<String> items, FoodConditionType type) {
    foodConditions.addAll(
      items.map((item) {
        dynamic e = EnumExtension.getLabel(FoodCategory.values, item);
        var value = e.value;
        if (value == "Fats_Oils_Shortenings") value = 'Fats_Oils_Shortening';
        if (value == "Breads_cereals_fastfood_grains") value = 'Breads_cereals';
        return FoodCondition(
          id: 0,
          name: value, 
          description: '',
          type: type,
        );
      }),
    );
  }

  Future<void> register() async {
    try {
      loading(true);
      await _registerPatient();
      await _registerHealthConditions();
      await _registerFoodConditions();
      Get.toNamed(AppRoutes.successfulRegister);
      _appToast.showToast(
        message: 'successful_registration'.tr,
        type: ToastificationType.success,
      );
    } catch (e) {
      displayErrorToast(e);
    } finally {
      loading(false);
    }
  }

  Future<void> _registerHealthConditions() async {
    try {
      for (var i = 0; i < healthConditions.length; i++) {
        var condition = healthConditions[i];
        condition.patient = currentPatient.value;
        await _healthConditionApi.createHealthCondition(condition, currentPatient.value.id!);
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> _registerFoodConditions() async {
    try {
      for (var i = 0; i < foodConditions.length; i++) {
        var condition = foodConditions[i];
        condition.patient = currentPatient.value;
        await _foodConditionApi.createFoodCondition(condition, currentPatient.value.id!);
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> _registerPatient() async {
    try {
      if (currentPatient.value.person != null) {
        currentPatient.value.person?.password = _generatePassword();
        final newPerson = await _personApi.createPerson(currentPatient.value.person!);
        if (newPerson.id != null) {
          currentPatient.value.person = newPerson;
          final newPatient = await _patientApi.createPatient(currentPatient.value, newPerson.id!, 1);
          if (newPatient.id != null) {
            currentPatient.value = newPatient;
            patientHistory.patient = currentPatient.value;
            await _patientHistoryApi.createPatientHistory(patientHistory, patientHistory.patient!.id!);
          }
        }
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  String _generatePassword() {
    const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+';
    final random = Random();
    final buffer = StringBuffer();
    for (var i = 0; i < 8; i++) {
      final index = random.nextInt(characters.length);
      buffer.write(characters[index]);
    }
    return buffer.toString();
  }

  void copy(String value) {
    Clipboard.setData(
      ClipboardData(
        text: value,
      ),
    );
    _appToast.showToast(
      message: 'copied'.tr,
      type: ToastificationType.success,
    );
  }
}