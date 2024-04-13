import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:fitlifebuddy/domain/model/patient_history.dart';
import 'package:fitlifebuddy/domain/model/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PatientProfileController extends GetxController{
  final _personApi = Get.find<PersonApi>();
  final _patientApi = Get.find<PatientApi>();

  final firstnameController = TextEditingController().obs;
  final lastnameController = TextEditingController().obs;
  final genderController = TextEditingController().obs;
  final birthdateController = TextEditingController().obs;
  final heightController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final emailController = TextEditingController().obs;

  final isEditable = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getPatientById('1');
  }

  Future<void> getPatientById(String patientId) async{
    try {
      var patient = await _patientApi.getPatientById(patientId);
      getPatientInfo(patient);
      if (patient.personId != null){
        var person = await _personApi.getPersonById(patient.personId!);
        getPersonInfo(person);
      }
      var histories = await _patientApi.getPatientHistoriesByPatientId(patientId);
      if (histories.isNotEmpty) {
        getPatientHistoryInfo(histories.first);
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void getPatientInfo(Patient patient){
    birthdateController.value.text = patient.birthDate ?? '';
  }

  void getPersonInfo(Person person) {
    firstnameController.value.text = person.fullname ?? '';
    lastnameController.value.text = person.lastname ?? '';
    emailController.value.text = person.emailAddress ?? '';
  }

  void getPatientHistoryInfo(PatientHistory patientHistory){
    genderController.value.text = patientHistory.gender.toString();
    heightController.value.text = patientHistory.height.toString();
    weightController.value.text = patientHistory.weight.toString();
  }

  void editProfile(){
    isEditable.value = true;
  }
}