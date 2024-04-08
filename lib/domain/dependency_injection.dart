import 'package:fitlifebuddy/domain/service/form_validation_service.dart';
import 'package:fitlifebuddy/pages/login_page/login_controller.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static Future<void> init() async {
    ///Persisted controllers
    Get.lazyPut(() => LoginController(), fenix: true);

    //Services
    Get.lazyPut(() => FormValidationService(), fenix: true);

    Get.lazyPut(() => AppToast(), fenix: true);
  }
}