import 'package:fitlifebuddy/core/utils/date_format.dart';
import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/patient_history_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/enum/enum_extensions.dart';
import 'package:fitlifebuddy/domain/enum/gender.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
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

  var genderSelectedValue  = Gender.values.first.label.obs;
  List<String> genders = Gender.values.map((e) => e.label).toList();

  final isPersonalInfoEditing = false.obs;
  final isHealthConditionsEditing = false.obs;
  final isFoodConditionsEditing = false.obs;

  final currentPatient = Patient().obs;
  final currentPatientHistory = PatientHistory().obs;

  bool get isEditing => isPersonalInfoEditing.isTrue || isHealthConditionsEditing.isTrue || isFoodConditionsEditing.isTrue;

  var currentPatientSaved = Patient();
  var currentPatientHistorySaved = PatientHistory();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getPatientById(1);
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

  void onEditPersonalInfoPressed() {
    isPersonalInfoEditing.value = true;
    currentPatientSaved = currentPatient.value;
    currentPatientHistorySaved = currentPatientHistory.value;
  }

  void onEditHealthConditionsPressed() {
    isHealthConditionsEditing.value = true;
  }

  void onEditFoodConditionsPressed() {
    isFoodConditionsEditing.value = true;
  }

  void onChangedGender(String? value) {
    if (value != null && value != '') {
      genderSelectedValue.value = value;
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
        _appToast.showToast(
          message: 'health_conditions_updated',
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
        _appToast.showToast(
          message: 'food_conditions_updated',
          type: ToastificationType.success,
        );
      }
      isFoodConditionsEditing.value = false;
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
    } else if (isFoodConditionsEditing.isTrue) {
      isFoodConditionsEditing.value = false;
    }
  }
}