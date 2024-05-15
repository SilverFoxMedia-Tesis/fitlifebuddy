// ignore_for_file: invalid_use_of_protected_member

import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
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
import 'package:fitlifebuddy/domain/service/shared_preferences.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class PatientProfileController extends GetxController{
  final _personApi = Get.find<PersonApi>();
  final _patientApi = Get.find<PatientApi>();
  final _patientHistoryApi = Get.find<PatientHistoryApi>();

  final _formValidationService = Get.find<FormValidationService>();
  final _appToast = Get.find<AppToast>();

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

  final loading = false.obs;
  final isPersonalInfoEditing = false.obs;
  final isHealthConditionsEditing = false.obs;
  final isFoodConditionsEditing = false.obs;

  final currentPatient = Patient().obs;
  final currentPatientHistory = PatientHistory().obs;
  final currentFoodConditions = <FoodCondition>[].obs;
  final currentHealthConditions = <HealthCondition>[].obs;

  bool get isEditing => isPersonalInfoEditing.isTrue || isHealthConditionsEditing.isTrue || isFoodConditionsEditing.isTrue;

  bool get hasFoodConditions => currentFoodConditions.isNotEmpty;
  bool get hasHealthConditions => currentHealthConditions.isNotEmpty;

  var currentPatientSaved = Patient();
  var currentPatientHistorySaved = PatientHistory();
  var currentFoodConditionsSaved = <FoodCondition>[];
  var currentHealthConditionsSaved = <HealthCondition>[];

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProfileInfo();
  }

  Future<void> getProfileInfo() async {
    try {
      loading(true);
      var id = UserPreferences.getPatientId();
      await getPatientById(int.parse(id!));
      await getFoodConditions(int.parse(id));
      await getHealthConditions(int.parse(id));
    } finally {
      loading(false);
    }
  }

  Future<void> getPatientById(int patientId) async{
    try {
      currentPatient.value = await _patientApi.getPatientById(patientId);
      getPatientInfo();
      if (currentPatient.value.person != null) {
        getPersonInfo();
      }
      var histories = await _patientApi.getPatientHistoriesByPatientId(patientId);
      if (histories.isNotEmpty) {
        currentPatientHistory.value = histories.first;
        getPatientHistoryInfo();
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> getFoodConditions(int patientId) async{
    try {
      currentFoodConditions.value = await _patientApi.getFoodConditionsByPatientId(patientId);
      // currentFoodConditions.value = [
      //   FoodCondition(
      //     id: 1,
      //     name: 'Ejemplo 1',
      //     type: TypeFoodCondition.allergy,
      //     patient: currentPatient.value
      //   ),
      //   FoodCondition(
      //     id: 2,
      //     name: 'Ejemplo 2',
      //     type: TypeFoodCondition.preference,
      //     patient: currentPatient.value
      //   ),
      // ];
      getFoodConditionsValues();
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> getHealthConditions(int patientId) async{
    try {
      currentHealthConditions.value = await _patientApi.getHealthConditionsByPatientId(patientId);
      // currentHealthConditions.value = [
      //   HealthCondition(
      //     id: 1,
      //     name: 'Ejemplo 3',
      //     type: TypeHealthCondition.surgery,
      //     patient: currentPatient.value
      //   ),
      //   HealthCondition(
      //     id: 2,
      //     name: 'Ejemplo 4',
      //     type: TypeHealthCondition.illness,
      //     patient: currentPatient.value
      //   ),
      // ];
      getHealthConditionValues();
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void getPatientInfo(){
    birthdateController.value.text = currentPatient.value.birthDate ?? '';
  }

  void getPersonInfo() {
    firstnameController.value.text = currentPatient.value.person?.fullname ?? '';
    lastnameController.value.text = currentPatient.value.person?.lastname ?? '';
    emailController.value.text = currentPatient.value.person?.emailAddress ?? '';
  }

  void getPatientHistoryInfo(){
    onChangedGender(currentPatientHistory.value.gender?.label);
    heightController.value.text = currentPatientHistory.value.height.toString();
    weightController.value.text = currentPatientHistory.value.weight.toString();
  }

  void getFoodConditionsValues() {
    if (currentFoodConditions.isNotEmpty) {
      for (var i = 0; i < currentFoodConditions.length; i++) {
        var foodCondition = currentFoodConditions[i];
        if (foodCondition.type?.label != null) {
          foodConditionTypeSelectedValues[i] = foodCondition.type!.label;
          foodConditionTypeSelectedControllers[i] = TextEditingController(text: foodCondition.name);
        }
      }
    }
  }

  void getHealthConditionValues() {
    if (currentHealthConditions.isNotEmpty) {
      for (var i = 0; i < currentHealthConditions.length; i++) {
        var healthCondition = currentHealthConditions[i];
        if (healthCondition.type?.label != null) {
          healthConditionTypeSelectedValues[i] = healthCondition.type!.label;
          healthConditionTypeSelectedControllers[i] = TextEditingController(text: healthCondition.name);
        }
      }
    }
  }

  void onEditPersonalInfoPressed() {
    isPersonalInfoEditing.value = true;
    currentPatientSaved = currentPatient.value;
    currentPatientHistorySaved = currentPatientHistory.value;
  }

  void onEditHealthConditionsPressed() {
    isHealthConditionsEditing.value = true;
    currentHealthConditionsSaved = currentHealthConditions.value;
  }

  void onEditFoodConditionsPressed() {
    isFoodConditionsEditing.value = true;
    currentFoodConditionsSaved = currentFoodConditions.value;
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

  Future<void> handleProfileUpdate() async {
    if (isPersonalInfoEditing.isTrue) {
      await updatePersonalInfo();
    } else if (isHealthConditionsEditing.isTrue) {
      await updateHealthConditions();
    } else if (isFoodConditionsEditing.isTrue) {
      await updateFoodConditions();
    }
  }

  Future<void> updatePersonalInfo() async {
    try {
      if (_formValidationService.validateForm(personalInfoFormKey)) {
        updatePerson();
        updatePatient();
        updatePatientHistory();
        _appToast.showToast(
          message: 'personal_info_updated'.tr,
          type: ToastificationType.success,
        );
        isPersonalInfoEditing.value = false;
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> updatePatient() async {
    try {
      var patient = currentPatient.value;
      if (birthdateController.value.text.isNotEmpty) {
        patient.birthDate = birthdateController.value.text;
        final result = await _patientApi.updatePatient(patient.id!, patient);
        currentPatient.value = result;
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> updatePerson() async {
    try {
      var person = currentPatient.value.person;
      person?.fullname = firstnameController.value.text;
      person?.lastname = lastnameController.value.text;
      person?.emailAddress = emailController.value.text;
      final result = await _personApi.updatePerson(person!.id!, person);
      currentPatient.value.person = result;
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> updatePatientHistory() async {
    try {
      var patientHistory = currentPatientHistory.value;
      patientHistory.gender = EnumExtension.getLabel(Gender.values, genderSelectedValue.value);
      patientHistory.height = num.parse(heightController.value.text);
      patientHistory.weight = num.parse(weightController.value.text);
      final result = await _patientHistoryApi.updatePatientHistory(patientHistory.id!, patientHistory);
      currentPatientHistory.value = result;
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> updateHealthConditions() async {
    try {
      if (_formValidationService.validateForm(healthConditionsFormKey)) {
        for (var i = 0; i < currentHealthConditions.length; i++) {
          var hCondition = currentHealthConditions[i];
          hCondition.type = EnumExtension.getLabel(TypeHealthCondition.values, healthConditionTypeSelectedValues[i]);
          hCondition.name = healthConditionTypeSelectedControllers[i]?.text;
          //final result = await _healthConditionApi.updateHealthCondition(hCondition.id!, hCondition);
          //currentHealthConditions[i] = result;
          currentHealthConditions[i] = hCondition;
        }
        _appToast.showToast(
          message: 'health_conditions_updated'.tr,
          type: ToastificationType.success,
        );
        isHealthConditionsEditing.value = false;
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> updateFoodConditions() async {
    try {
      if (_formValidationService.validateForm(foodConditionsFormKey)) {
        for (var i = 0; i < currentFoodConditions.length; i++) {
          var foodConditions = currentFoodConditions[i];
          foodConditions.type = EnumExtension.getLabel(TypeFoodCondition.values, foodConditionTypeSelectedValues[i]);
          foodConditions.name = foodConditionTypeSelectedControllers[i]?.text;
          //final result = await _foodConditionApi.updateFoodCondition(foodConditions.id!, foodConditions);
          // currentFoodConditions[i] = result;
          currentFoodConditions[i] = foodConditions;
        }
        _appToast.showToast(
          message: 'food_conditions_updated'.tr,
          type: ToastificationType.success,
        );
        isFoodConditionsEditing.value = false;
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void cancel() {
    if (isPersonalInfoEditing.isTrue) {
      isPersonalInfoEditing.value = false;
      currentPatient.value = currentPatientSaved;
      currentPatientHistory.value = currentPatientHistorySaved;
      getPersonInfo();
      getPatientInfo();
      getPatientHistoryInfo();
    } else if (isHealthConditionsEditing.isTrue) {
      isHealthConditionsEditing.value = false;
      currentHealthConditions.value = currentHealthConditionsSaved;
      getHealthConditionValues();
    } else if (isFoodConditionsEditing.isTrue) {
      isFoodConditionsEditing.value = false;
      currentFoodConditions.value = currentFoodConditionsSaved;
      getFoodConditionsValues();
    }
  }
}