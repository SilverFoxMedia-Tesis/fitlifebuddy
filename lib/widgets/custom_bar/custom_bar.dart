import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/widgets/app_icon_button/app_icon_button.dart';
import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget {
  final String title;
  final String? extraTitle;
  final void Function()? onBackPressed;
  final List<Widget>? actions;

  const CustomBar({
    required this.title,
    this.extraTitle,
    this.onBackPressed,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIconButton(
              iconData: Icons.arrow_back_ios_rounded,
              iconColor: AppColors.secondary,
              size: ContainerSize.iconSize,
              onTap: onBackPressed,
              outlined: true,
            ),
            AppSpacing.spacingHorizontal14,
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: AppTextStyle.robotoSemibold24,
                  ),
                  TextSpan(
                    text: extraTitle,
                    style: AppTextStyle.robotoRegular24.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (actions != null)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: actions!,
          ),
      ],
    );
  }
}