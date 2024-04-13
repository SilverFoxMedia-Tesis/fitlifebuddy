import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/enum/gender.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';
import 'package:fitlifebuddy/domain/model/person.dart';
import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PatientProfileController extends GetxController{
  final _personApi = Get.find<PersonApi>();
  final _patientApi = Get.find<PatientApi>();

  final _formValidationService = Get.find<FormValidationService>();

  final personalInfoFormKey = GlobalKey<FormState>();
  final conditionsFormKey = GlobalKey<FormState>();

  final firstnameController = TextEditingController().obs;
  final lastnameController = TextEditingController().obs;
  final genderController = TextEditingController().obs;
  final birthdateController = TextEditingController().obs;
  final heightController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final emailController = TextEditingController().obs;

  final isPersonalInfoEditable = false.obs;

  final currentPatient = Patient().obs;
  final currentPerson = Person().obs;
  final currentPatientHistory = PatientHistory().obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getPatientById(1);
  }

  Future<void> getPatientById(int patientId) async{
    try {
      currentPatient.value = await _patientApi.getPatientById(patientId);
      getPatientInfo();
      if (currentPatient.value.personId != null){
        currentPerson.value = await _personApi.getPersonById(currentPatient.value.personId!);
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
    firstnameController.value.text = currentPerson.value.fullname ?? '';
    lastnameController.value.text = currentPerson.value.lastname ?? '';
    emailController.value.text = currentPerson.value.emailAddress ?? '';
  }

  void getPatientHistoryInfo(){
    genderController.value.text = currentPatientHistory.value.gender?.value ?? '';
    heightController.value.text = currentPatientHistory.value.height.toString();
    weightController.value.text = currentPatientHistory.value.weight.toString();
  }

  void onEditPressed() {
    isPersonalInfoEditable.value = true;
  }

  Future<void> updatePatient() async {
    if (_formValidationService.validateForm(personalInfoFormKey)) {
      currentPatient.value.birthDate = birthdateController.value.text;
      currentPerson.value.fullname = firstnameController.value.text;
      currentPerson.value.lastname = lastnameController.value.text;
      currentPerson.value.emailAddress = emailController.value.text;
      currentPatientHistory.value.gender = Gender.fromString(genderController.value.text);
      currentPatientHistory.value.height = double.parse(heightController.value.text);
      currentPatientHistory.value.weight = double.parse(weightController.value.text);
      await _patientApi.updatePatient(currentPatient.value.id!, currentPatient.value);
      await _personApi.updatePerson(currentPerson.value.id!, currentPerson.value);
      try {
      } catch (e) {
        displayErrorToast(e);
      }
    }
  }
}