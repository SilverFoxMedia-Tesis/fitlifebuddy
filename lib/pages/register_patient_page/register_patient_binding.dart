import 'package:fitlifebuddy/pages/register_patient_page/register_patient_controller.dart';
import 'package:get/get.dart';

class RegisterPatientBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPatientController());
  }
}