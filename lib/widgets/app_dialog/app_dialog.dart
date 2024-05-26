import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/base_button/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog extends StatelessWidget {
  final double? width;
  final String? title;
  final String? description;
  final VoidCallback? onClose;
  final String? cancelButtonTitle;
  final Widget? extraContent;
  final List<Widget> actions;

  const AppDialog({
    this.width = ContainerSize.confirmationDialogWidth,
    this.title,
    this.description,
    this.actions = const [],
    this.onClose,
    this.cancelButtonTitle,
    this.extraContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(48),
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.borderRadius14,
      ),
      content: SizedBox(
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (title != null)
              Text(
                title!,
                style: AppTextStyle.robotoSemibold20,
              ),
            if (description != null) ...[
              AppSpacing.spacingVertical24,
              Text(
                description!,
                style: AppTextStyle.robotoRegular16,
              ),
            ],
            if (extraContent != null) ...[
              AppSpacing.spacingVertical24,
              extraContent!,
            ],
            AppSpacing.spacingVertical24,
            Row(
              //mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BaseButton(
                  text: cancelButtonTitle ?? "cancel".tr,
                  onTap: onClose ?? Get.back,
                  textColor: AppColors.danger,
                  backgroundColor: Colors.transparent,
                ),
                const Spacer(),
                ...actions,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
