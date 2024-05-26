import 'package:fitlifebuddy/domain/model/patient.dart';
import 'package:get/get.dart';

class PatientService {
  final patient = Patient().obs;
  
  int get patientId => patient.value.id ?? -1;

  void setPatient(Patient patient) {
    this.patient.value = patient;
  }
}