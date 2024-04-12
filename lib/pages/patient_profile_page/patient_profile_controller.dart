import 'package:fitlifebuddy/domain/api/patient_api.dart';
import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:get/get.dart';

class PatientProfileController extends GetxController{
  final _patientApi = Get.find<PatientApi>();
  final currentPatient = Patient().obs;

  Future<void> getPatientById(String patientId) async{
    currentPatient.value = await _patientApi.getPatientById(patientId);
  }
  
}