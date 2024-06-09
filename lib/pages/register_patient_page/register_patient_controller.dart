import 'dart:math';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fitlifebuddy/domain/enum/health_conditions_cases.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
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
  final birthday = ''.obs;
  final birthdayController = TextEditingController().obs;
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
  final surgeries = Surgery.values.map((e) => e.label).toList();
  final illnesses = Illness.values.map((e) => e.label).toList();
  final preferences = FoodCategory.values.map((e) => e.label).toList();
  final restrictions = FoodCategory.values.map((e) => e.label).toList();
  final allergies = FoodCategory.values.map((e) => e.label).toList();

  final currentPatient = Patient().obs;
  var _selectedGender = Gender.values.first.label;
  var patientHistory = PatientHistory();
  var healthConditions = <HealthCondition>[];
  var foodConditions= <FoodCondition>[];

  final loading = false.obs;

  void onChangedPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex, 
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    currentPage(pageIndex);
  } 

  void onChangedGender(String value) {
    _selectedGender = value;
  }

  void onTapDateTime() async {
    var selectedDate = DateTime.now();
    if (birthdayController.value.text.isNotEmpty) {
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
        birthday.value = fromDateToInitial(selectedDate);
        birthdayController.value.text = fromStringToBirthday(birthday.value);
    });
  }

  void savePersonalInfo() {
    if (_formValidationService.validateForm(personalInfoFormKey)) {
      _savePerson();
      _savePatient();
      _savePatientHistory();
      _appToast.showToast(
        message: 'personal_info_saved'.tr,
        type: ToastificationType.success,
      );
      onChangedPage(1);
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
    if (birthdayController.value.text.isNotEmpty) {
      currentPatient.value.birthDate = birthday.value;
      patientHistory.age = _calculateAge(birthday.value);
    }
  }

  int _calculateAge(String birthDate) {
    final date = DateTime.parse(birthDate);
    final now = DateTime.now();
    var age = now.year - date.year;
    if (now.month < date.month || (now.month == date.month && now.day < date.day)) {
      age--;
    }
    return age;
  }

  void _savePatientHistory() {
    patientHistory.gender = EnumExtension.getLabel(Gender.values, _selectedGender);
    patientHistory.height = num.parse(heightController.value.text);
    patientHistory.weight = num.parse(weightController.value.text);
    patientHistory.abdominalCircumference = num.parse(absPerimeterController.value.text);
  }

  void saveHealthConditions() {
    saveAsHealthConditionList(surgeriesController.value.value, HealthConditionType.surgery);
    saveAsHealthConditionList(illnessesController.value.value, HealthConditionType.illness);
    _appToast.showToast(
      message: 'health_conditions_saved'.tr,
      type: ToastificationType.success,
    );
    onChangedPage(2);
  }

  Future<void> saveFoodConditions() async {
    saveAsFoodConditionList(preferencesController.value.value, FoodConditionType.preference);
    saveAsFoodConditionList(restrictionsController.value.value, FoodConditionType.restriction);
    saveAsFoodConditionList(allergiesController.value.value, FoodConditionType.allergy);
    _appToast.showToast(
      message: 'food_conditions_saved'.tr,
      type: ToastificationType.success,
    );
    await register();
  }

  void saveAsHealthConditionList(List<String> items, HealthConditionType type) {
    final list = (type == HealthConditionType.surgery) ? Surgery.values : Illness.values;
    healthConditions.addAll(
      items.map((item) {
        dynamic e = EnumExtension.getLabel(list, item);
        var value = e.value;
        return HealthCondition(
          id: 0,
          name: value, 
          description: '',
          type: type,
        );
      }),
    );
  }

  void saveAsFoodConditionList(List<String> items, FoodConditionType type) {
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
      await registerPatient();
      await registerHealthConditions();
      await registerFoodConditions();
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

  Future<void> registerHealthConditions() async {
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

  Future<void> registerFoodConditions() async {
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
            patientHistory.patient = currentPatient.value;
            patientHistory.dietType = DietType.omnivore;
            patientHistory.physicalActivity = PhysicalActivity.no;
            patientHistory.typeHealthCondition = HealthConditionType.no;
            await _patientHistoryApi.createPatientHistory(patientHistory, patientHistory.patient!.id!);
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

  void copyEmail() {
    Clipboard.setData(ClipboardData(
      text: currentPatient.value.person?.emailAddress ?? '',
    ),);
    _appToast.showToast(
      message: 'email_copied'.tr,
      type: ToastificationType.success,
    );
  }

  void copyPassword() {
    Clipboard.setData(ClipboardData(
      text: currentPatient.value.person?.password ?? '',
    ),);
    _appToast.showToast(
      message: 'password_copied'.tr,
      type: ToastificationType.success,
    );
  }
}