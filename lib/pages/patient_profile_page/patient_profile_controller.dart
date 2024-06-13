// ignore_for_file: invalid_use_of_protected_member

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/datetime_utils.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/patient_history_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/enum/diet_type.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/food_category.dart';
import 'package:fitlifebuddy/domain/enum/gender.dart';
import 'package:fitlifebuddy/domain/enum/health_condition_type.dart';
import 'package:fitlifebuddy/domain/enum/health_conditions_cases.dart';
import 'package:fitlifebuddy/domain/enum/physical_activity.dart';
import 'package:fitlifebuddy/domain/model/food_condition.dart';
import 'package:fitlifebuddy/domain/model/health_condition.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/domain/service/shared_preferences.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/widgets/edit_food_conditions_dialog.dart';
import 'package:fitlifebuddy/pages/patient_profile_page/widgets/edit_health_conditions_dialog.dart';
import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
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
  final _getXDialog = Get.find<GetXDialog>();

  final personalInfoFormKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController().obs;
  final lastnameController = TextEditingController().obs;
  final birthdateController = TextEditingController().obs;
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

  final currentGender = ''.obs;
  final currentBirthDate = DateTime.now().obs;
  final currentDietType = ''.obs;
  final currentPhysicalActivity = ''.obs;

  var currentPatient = Patient();
  var currentPatientHistory = PatientHistory();
  final currentHealthConditions = <HealthCondition>[].obs;
  final currentFoodConditions = <FoodCondition>[].obs;

  final loading = false.obs;
  final isPersonalInfoEditing = false.obs;
  final isPersonalInfoUpdating = false.obs;
  final isHealthCUpdating = false.obs;
  final isFoodCUpdating = false.obs;

  bool get isEditing => isPersonalInfoEditing.isTrue || isPersonalInfoUpdating.isTrue;
  bool get hasFoodConditions => currentFoodConditions.isNotEmpty;
  bool get hasHealthConditions => currentHealthConditions.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProfileInfo();
  }

  Future<void> getProfileInfo() async {
    try {
      loading(true);
      final patientId = UserPreferences.getPatientId();
      if (patientId != null) {
        currentPatient.id = int.parse(patientId);
        await _getPatient();
        await _getHealthConditions();
        await _getFoodConditions();
      }
    } finally {
      loading(false);
    }
  }

  Future<void> _getPatient() async{
    try {
      final patientId = currentPatient.id;
      if (patientId != null) {
        currentPatient  = await _patientApi.getPatientById(patientId);
        _savePatientInfo();
        if (currentPatient.person != null) {
          _savePersonInfo();
        }
        var histories = await _patientApi.getPatientHistoriesByPatientId(patientId);
        if (histories.isNotEmpty) {
          currentPatientHistory = histories.first;
          _savePatientHistoryInfo();
        }
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void _savePatientInfo(){
    if (currentPatient.birthDate != null || currentPatient.birthDate != '') {
      var date = currentPatient.birthDate!;
      currentBirthDate.value = DateTime.parse(date);
      birthdateController.value.text = fromStringToBirthdate(date);
    }
  }

  void _savePersonInfo() {
    firstnameController.value.text = currentPatient.person?.fullname ?? '';
    lastnameController.value.text = currentPatient.person?.lastname ?? '';
    emailController.value.text = currentPatient.person?.emailAddress ?? '';
  }

  void _savePatientHistoryInfo(){
    currentGender.value = currentPatientHistory.gender?.label ?? '';
    heightController.value.text = currentPatientHistory.height.toString();
    weightController.value.text = currentPatientHistory.weight.toString();
    absPerimeterController.value.text = currentPatientHistory.abdominalCircumference.toString();
    currentDietType.value = currentPatientHistory.dietType?.label ?? '';
    currentPhysicalActivity.value = currentPatientHistory.physicalActivity?.label ?? '';
  }

  Future<void> _getHealthConditions() async{
    try {
      if (currentPatient.id != null) {
        currentHealthConditions.value = await _patientApi.getHealthConditionsByPatientId(currentPatient.id!);
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> _getFoodConditions() async{
    try {
      if (currentPatient.id != null) {
        currentFoodConditions.value = await _patientApi.getFoodConditionsByPatientId(currentPatient.id!);
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void onEditPersonalInfoPressed() => isPersonalInfoEditing(true);

  Future<void> openEditHealthConditionsDialog() async {
    await _getXDialog.showDialog(const EditHealthConditionsDialog(), onClose: onDialogClose);
  }

  Future<void> openEditFoodConditionsDialog() async {
    await _getXDialog.showDialog(const EditFoodConditionsDialog(), onClose: onDialogClose);
  }

  void onChangedGender(String? value) {
    if (value != null && value != '') {
      currentGender.value = value;
    }
  }

  void onChangeBirthDate(DateTime? value) {
    if (value != null) {
      currentBirthDate.value = value;
    }
  }

  void onChangedDietType(String? value) {
    if (value != null && value != '') {
      currentDietType.value = value;
    }
  }

  void onChangedPhysicalActivity(String? value) {
    if (value != null && value != '') {
      currentPhysicalActivity.value = value;
    }
  }

  Future<void> updatePersonalInfo() async {
    try {
      if (_formValidationService.validateForm(personalInfoFormKey)) {
        await _updatePerson();
        await _updatePatient();
        await _updatePatientHistory();
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

  Future<void> _updatePerson() async {
    try {
      var person = currentPatient.person;
      if (person != null && person.id != null) {
        person.fullname = firstnameController.value.text;
        person.lastname = lastnameController.value.text;
        person.emailAddress = emailController.value.text;
        final updated = await _personApi.updatePerson(person.id!, person);
        currentPatient.person = updated;
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> _updatePatient() async {
    try {
      var patient = currentPatient;
      if (patient.id != null) {
        patient.birthDate = fromDateToInitial(currentBirthDate.value);
        final updated = await _patientApi.updatePatient(patient.id!, patient);
        currentPatient = updated;
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> _updatePatientHistory() async {
    try {
      var patientHistory = currentPatientHistory;
      if (patientHistory.id != null) {
        patientHistory.gender = EnumExtension.getLabel(Gender.values, currentGender.value);
        patientHistory.height = num.parse(heightController.value.text);
        patientHistory.weight = num.parse(weightController.value.text);
        patientHistory.abdominalCircumference = num.parse(absPerimeterController.value.text);
        patientHistory.age = calculateAge(currentBirthDate.value);
        patientHistory.dietType = EnumExtension.getLabel(DietType.values, currentDietType.value);
        patientHistory.physicalActivity = EnumExtension.getLabel(PhysicalActivity.values, currentPhysicalActivity.value);
        final updated = await _patientHistoryApi.updatePatientHistory(patientHistory.id!, patientHistory);
        currentPatientHistory = updated;
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> updateHealthConditions() async {
    try {
      isHealthCUpdating(true);
      for (var i = 0; i < currentHealthConditions.length; i++) {
        //final result = await _healthConditionApi.updateHealthCondition(hCondition.id!, hCondition);
        //currentHealthConditions[i] = result;
      }
      _appToast.showToast(
        message: 'health_conditions_updated'.tr,
        type: ToastificationType.success,
      );
    } catch (e) {
      displayErrorToast(e);
    } finally {
      isHealthCUpdating(false);
    }
  }

  Future<void> updateFoodConditions() async {
    try {
      isFoodCUpdating(false);
      for (var i = 0; i < currentFoodConditions.length; i++) {
        //final result = await _foodConditionApi.updateFoodCondition(foodConditions.id!, foodConditions);
        // currentFoodConditions[i] = result;
      }
      _appToast.showToast(
        message: 'food_conditions_updated'.tr,
        type: ToastificationType.success,
      );
      isFoodCUpdating(false);
    } catch (e) {
      displayErrorToast(e);
    }
  }

  String getHealthConditionName(HealthCondition condition) {
    if (condition.name == null) return '';
    switch (condition.type) {
      case HealthConditionType.illness:
        return EnumExtension.getValue(Illness.values, condition.name)?.label ?? condition.name!;
      default:
        return EnumExtension.getValue(Surgery.values, condition.name)?.label ?? condition.name!;
    }
  }

  String getFoodConditionName(FoodCondition condition) {
    if (condition.name == null) return '';
    return EnumExtension.getValue(FoodCategory.values, condition.name)?.label ?? condition.name!;
  }

  void cancel() {
    if (isPersonalInfoEditing.isTrue) {
      isPersonalInfoEditing.value = false;
      _savePersonInfo();
      _savePatientInfo();
      _savePatientHistoryInfo();
    } 
  } 

  bool onDialogClose() {
    Get.back();
    return true;
  }
}