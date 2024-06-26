import 'package:fitlifebuddy/core/theme/style/box_decoration.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/domain/enum/notification_type.dart';
import 'package:fitlifebuddy/pages/notifications_page/notifications_controller.dart';
import 'package:fitlifebuddy/pages/notifications_page/widgets/notification_card.dart';
import 'package:fitlifebuddy/widgets/empty_result/empty_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NotificationsController>();
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 496,
        height: 560,
        padding: AppPadding.padding32,
        decoration: AppBoxDecoration.lightRadius14,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'notifications'.tr,
              style: AppTextStyle.robotoSemibold20,
            ),
            AppSpacing.spacingVertical20,
            if (controller.hasNotifications)
              buildNotifications(),
            if (!controller.hasNotifications)
              EmptyResult(
                message: 'no_notifications'.tr,
              ),
          ],
        ),
      ),
    );
  }

  Widget buildNotifications() {
    return ListView(
      children: const [
        NotificationCard(
          type: NotificationType.breakfastReminder, 
          description: '¡Hola! Es hora de comenzar el día con un desayuno saludable. Consulta tu plan de alimentación para ver qué deliciosa opción te espera hoy', 
          date: 'Hace 8 horas',
        ),
        NotificationCard(
          type: NotificationType.lunchReminder, 
          description: '¡No olvides alimentarte bien al mediodía! Revisa tu plan de alimentación para ver qué delicioso almuerzo te hemos preparado', 
          date: 'Hace 4 horas',
        ),
        NotificationCard(
          type: NotificationType.breakfastReminder, 
          description: '¡Es momento de moverte! Recuerda completar tu rutina de ejercicio programada para hoy.', 
          date: 'Hace 3 horas',
        ),
      ],
    );
  }
}