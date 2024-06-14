import 'package:fitlifebuddy/core/utils/error_utils.dart';
import 'package:fitlifebuddy/domain/api/person_api.dart';
import 'package:fitlifebuddy/domain/model/person.dart';
import 'package:fitlifebuddy/domain/service/person_service.dart';
import 'package:fitlifebuddy/domain/service/shared_preferences.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class SettingsController extends GetxController {
  final _personApi = Get.find<PersonApi>();

  final _appToast = Get.find<AppToast>();
  final _personService = Get.find<PersonService>();

  var _currentPerson = Person();
  
  final loading = false.obs;
  final emailNotificationEnabled = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await loadData();
  }

  Future<void> loadData() async {
    try {
      _currentPerson = _personService.currentPerson.value;
      if (_currentPerson.acceptNotifications != null) {
        emailNotificationEnabled.value = _currentPerson.acceptNotifications!;
        return;
      } 
      if (UserPreferences.getPersonId() != null) {
        final id = UserPreferences.getPersonId()!;
        _currentPerson = await _personApi.getPersonById(int.parse(id));
        if (_currentPerson.acceptNotifications != null) {
          emailNotificationEnabled.value = _currentPerson.acceptNotifications!;
        }
      }
    } catch (e) {
      displayErrorToast(e);
    }
  }

  void setEmailNotificationEnabled(bool? value) {
    if (value != null) {
      emailNotificationEnabled.value = value;
    }
  }

  Future<void> saveSettings() async {
    try {
      loading(true);
      if (_currentPerson.id != null) {
        _currentPerson.acceptNotifications = emailNotificationEnabled.value;
        final updated = await _personApi.updatePerson(_currentPerson.id!, _currentPerson);
        _appToast.showToast(
          message: 'settings_saved'.tr,
          type: ToastificationType.success,
        );
        _personService.setPerson(updated);
      }
    } catch (e) {
      displayErrorToast(e);
    } finally {
      loading(false);
    }
  }
}