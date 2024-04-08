import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class AppToast {
  Color _buildColor(ToastificationType? type) {
    switch (type) {
      case ToastificationType.success:
        return AppColors.success;
      case ToastificationType.warning:
        return AppColors.warning;
      case ToastificationType.error:
        return AppColors.danger;
      default:
        return AppColors.secondary;
    }
  }

  IconData _buildIcon(ToastificationType? type) {
    switch (type) {
      case ToastificationType.success:
        return Icons.check_circle_outline_rounded;
      case ToastificationType.warning:
        return Icons.error_outline_rounded;
      case ToastificationType.error:
        return Icons.cancel_outlined;
      default:
        return Icons.info_outline_rounded;
    }
  }

  void showToast({
    String? title,
    required String message,
    ToastificationType? type,
  }) {
    final context = Get.overlayContext;
    if (context == null) {
      return;
    }
    toastification.dismissAll();
    toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 3),
      alignment: Alignment.topCenter,
      builder: (context, cancel) {
        return Container(
          padding: AppPadding.padding16,
          margin: AppPadding.padding16,
          constraints: const BoxConstraints(
            maxWidth: ContainerSize.snackBarMaxWidth,
          ),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.borderRadius14,
            boxShadow: [AppBoxShadow.primary25Blur8],
          ),
          child: Row(
            children: [
              Icon(
                _buildIcon(type),
                size: ContainerSize.iconSize,
                color: _buildColor(type),
              ),
              AppSpacing.spacingHorizontal14,
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null) ...[
                      Text(
                          title,
                          style: AppTextStyle.robotoMedium12,
                        ),
                      AppSpacing.spacingVertical14,
                    ],
                    Text(
                      message,
                      style: AppTextStyle.robotoRegular12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}