import 'dart:math';

import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/food_condition_api.dart';
import 'package:fitlifebuddy/domain/api/health_condition_api.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/patient_history_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/enum/diet_type.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/frecuently.dart';
import 'package:fitlifebuddy/domain/enum/gender.dart';
import 'package:fitlifebuddy/domain/enum/physical_activity.dart';
import 'package:fitlifebuddy/domain/enum/type_food_condition.dart';
import 'package:fitlifebuddy/domain/enum/type_health_condition.dart';
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
    bool allFormsValid = true;

    if (pageIndex == 1) {
      savePersonalInfo();
      allFormsValid = _formValidationService.validateForm(personalInfoFormKey);
    } else if (pageIndex == 2) {
      allFormsValid = _formValidationService.validateForm(healthConditionsFormKey);
    }

    if (allFormsValid) {
      pageController.animateToPage(
        pageIndex, 
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  } 

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
    currentPatient.value.person = Person(
      fullname: firstnameController.value.text,
      lastname: lastnameController.value.text,
      emailAddress: emailController.value.text,
    );
  }

  void savePatientHistory() {
    currentPatientHistory.value.gender = EnumExtension.getLabel(Gender.values, genderSelected.value);
    currentPatientHistory.value.height = num.parse(heightController.value.text);
    currentPatientHistory.value.weight = num.parse(weightController.value.text);
  }

  void saveFCondition() {
    if (newFConditionController.value.text.isNotEmpty) {
      var index = fConditionTypes.length;
      fConditionTypes[index] = newfConditionType.value;
      fConditionsControllers[index] = TextEditingController();
      fConditionsControllers[index]?.text = newFConditionController.value.text;
      
      //reset
      newfConditionType.value = TypeFoodCondition.values.first.label;
      newFConditionController.value.clear();
    } else {
      _appToast.showToast(
        message: "Completa el campo para agregar una condición"
      );
    }
  }

  void saveHCondition() {
    if (newHConditionController.value.text.isNotEmpty) {
      var index = hConditionTypes.length;
      hConditionTypes[index] = newhConditionType.value;
      hConditionsControllers[index] = TextEditingController();
      hConditionsControllers[index]?.text = newHConditionController.value.text;
      
      //reset
      newhConditionType.value = TypeHealthCondition.values.first.label;
      newHConditionController.value.clear();
    } else {
      _appToast.showToast(
        message: "Completa el campo para agregar una condición"
      );
    }
  }

  Future<void> register() async {
    try {
      if (_formValidationService.validateForm(foodConditionsFormKey)) {
        await registerPatient();
        await registerHConditions();
        await registerFConditions();
        Get.toNamed(AppRoutes.successfulRegister);
        _appToast.showToast(
          message: 'successful_registration'.tr,
          type: ToastificationType.success,
        );
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> registerHConditions() async {
    try {
      for (var i = 0; i < hConditionTypes.length; i++) {
        var hCondition = HealthCondition(
          name: hConditionsControllers[i]?.text,
          description: '',
          type: EnumExtension.getLabel(TypeHealthCondition.values, hConditionTypes[i]),
          patient: currentPatient.value
        );
        await _healthConditionApi.createHealthCondition(hCondition, currentPatient.value.id!);
      }
      _appToast.showToast(
        message: 'health_conditions_saved'.tr,
        type: ToastificationType.success,
      );
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> registerFConditions() async {
    try {
      for (var i = 0; i < hConditionTypes.length; i++) {
        var fCondition = FoodCondition(
          name: fConditionsControllers[i]?.text,
          description: '',
          type: EnumExtension.getLabel(TypeFoodCondition.values, fConditionTypes[i]),
          patient: currentPatient.value,
        );
        await _foodConditionApi.createFoodCondition(fCondition, currentPatient.value.id!);
      }
      _appToast.showToast(
        message: 'food_conditions_saved'.tr,
        type: ToastificationType.success,
      );
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
            currentPatientHistory.value.patient = newPatient;
            currentPatientHistory.value.age = 0;
            currentPatientHistory.value.abdominalCircumference = 0;
            currentPatientHistory.value.dietType = DietType.omnivore;
            currentPatientHistory.value.frecuently = Frecuently.monthly;
            currentPatientHistory.value.physicalActivity = PhysicalActivity.no;
            await _patientHistoryApi.createPatientHistory(currentPatientHistory.value, newPatient.id!);
            _appToast.showToast(
              message: 'personal_info_saved'.tr,
              type: ToastificationType.success,
            );
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

  void goToLogin() {
    Get.toNamed(AppRoutes.login);
  }

  void copyEmail() {
    Clipboard.setData(ClipboardData(
      text: currentPatient.value.person?.emailAddress ?? '',
    ));
    _appToast.showToast(
      message: 'email_copied'.tr,
      type: ToastificationType.success,
    );
  }

  void copyPassword() {
    Clipboard.setData(ClipboardData(
      text: currentPatient.value.person?.password ?? '',
    ));
    _appToast.showToast(
      message: 'password_copied'.tr,
      type: ToastificationType.success,
    );
  }
}