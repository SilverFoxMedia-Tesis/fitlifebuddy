import 'package:get/get.dart';

class SettingsController extends GetxController {
  final loading = false.obs;
  final emailNotificationEnabled = false.obs;

  void setEmailNotificationEnabled(bool? value) {
    if (value != null) {
      emailNotificationEnabled.value = value;
    }
  }

  Future<void> saveSettings() async {
    try {
      loading(true);
      await Future.delayed(const Duration(seconds: 5));
      loading.value = false;
    } catch (e) {
      loading(false);
    }
  }
}