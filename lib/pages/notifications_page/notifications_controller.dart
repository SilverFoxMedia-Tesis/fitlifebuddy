import 'package:fitlifebuddy/widgets/app_dialog/getx_dialog.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final getXDialog = Get.find<GetXDialog>();

  final notifications = <String>[].obs;

  bool get hasNotifications => notifications.isNotEmpty;
}