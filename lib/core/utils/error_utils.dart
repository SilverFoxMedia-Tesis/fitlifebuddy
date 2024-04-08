import 'package:fitlifebuddy/domain/rest/exceptions/app_exception.dart';
import 'package:fitlifebuddy/widgets/app_toast/app_toast.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

String getErrorMessage(Object e) {
  String message = 'unknownDefaultError'.tr;
  if (e is AppException) message = e.uiMessage;
  return message;
}

void displayErrorToast(Object e) async {
  String errorMessage = e is String ? e : getErrorMessage(e);
  Get.find<AppToast>().showToast(
    message: errorMessage,
    type: ToastificationType.error,
  );
}
