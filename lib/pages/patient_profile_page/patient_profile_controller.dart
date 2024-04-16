import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/patient_history_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/enum/gender.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';
import 'package:fitlifebuddy/domain/model/person.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:flutter/cupertino.dart';
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
  final genderController = TextEditingController().obs;
  final birthdateController = TextEditingController().obs;
  final heightController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final emailController = TextEditingController().obs;

  final isPersonalInfoEditing = false.obs;
  final isHealthConditionsEditing = false.obs;
  final isFoodConditionsEditing = false.obs;

  final currentPatient = Patient().obs;
  final currentPatientHistory = PatientHistory().obs;

  bool get isEditing => isPersonalInfoEditing.isTrue || isHealthConditionsEditing.isTrue || isFoodConditionsEditing.isTrue;

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
    birthdateController.value.text = currentPatient.value.birthDate.toString();
  }

  void getPersonInfo() {
    firstnameController.value.text = currentPatient.value.person?.fullname ?? '';
    lastnameController.value.text = currentPatient.value.person?.lastname ?? '';
    emailController.value.text = currentPatient.value.person?.emailAddress ?? '';
  }

  void getPatientHistoryInfo(){
    genderController.value.text = currentPatientHistory.value.gender?.label ?? '';
    heightController.value.text = currentPatientHistory.value.height.toString();
    weightController.value.text = currentPatientHistory.value.weight.toString();
  }

  void onEditPersonalInfoPressed() {
    isPersonalInfoEditing.value = true;
  }

  void onEditHealthConditionsPressed() {
    isHealthConditionsEditing.value = true;
  }

  void onEditFoodConditionsPressed() {
    isFoodConditionsEditing.value = true;
  }

  void resetIsEditing() {
    isPersonalInfoEditing.value = false;
    isHealthConditionsEditing.value = false;
    isPersonalInfoEditing.value = false;
  }

  Future<void> handleProfileUpdate() async {
    if (isPersonalInfoEditing.isTrue) {
      await updatePersonalInfo();
    } else if (isHealthConditionsEditing.isTrue) {
      await updateHealthConditions();
    } else if (isFoodConditionsEditing.isTrue) {
      await updateFoodConditions();
    }
    resetIsEditing();
  }

  Future<void> updatePersonalInfo() async {
    try {
      if (_formValidationService.validateForm(personalInfoFormKey)) {
        updatePerson();
        updatePatient();
        //updatePatientHistory();
        _appToast.showToast(
          message: 'personal_info_updated',
          type: ToastificationType.success,
        );
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  Future<void> updatePatient() async {
    try {
      var patient = currentPatient.value;
      patient.birthDate = birthdateController.value.text;
      final result = await _patientApi.updatePatient(patient.id!, patient);
      currentPatient.value = result;
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
      patientHistory.gender = Gender.fromLabel(genderController.value.text);
      patientHistory.height = double.parse(heightController.value.text);
      patientHistory.weight = double.parse(weightController.value.text);
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
    } catch (e) {
      displayErrorToast(e);
    }
  }
}