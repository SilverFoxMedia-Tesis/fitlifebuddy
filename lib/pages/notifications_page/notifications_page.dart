import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/domain/enum/notification_type.dart';
import 'package:fitlifebuddy/pages/notifications_page/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 496,
      height: 960,
      padding: AppPadding.paddingXxxl,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusWrapper.borderRadiusXl,
        boxShadow: [AppBoxShadows.secondary25Blur8],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Mis notificaciones',
            style: AppTextStyle.robotoSemibold32,
          ),
          AppSpacing.spacingVerticalXxl,
          ListView(
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
          )
        ],
      ),
    );
  }
}