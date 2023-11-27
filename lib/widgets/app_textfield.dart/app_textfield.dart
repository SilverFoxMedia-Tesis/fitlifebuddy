import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final String? title;
  final String? hintText;
  final String? suflixText;
  final bool isPassword;
  final bool readOnly;
  final double width;

  const AppTextfield({
    super.key,
    this.title,
    this.hintText,
    this.suflixText,
    this.isPassword = false,
    this.readOnly = false,
    this.width = 348,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: buildTitleTextStyle(),
          ),
          AppSpacing.spacingVerticalSm,
        ],
        Container(
          width: width,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadiusWrapper.borderRadiusMd,
            boxShadow: [AppBoxShadows.primary25Blur8],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintText != null ? buildTextStyle() : null,
              suffixIcon: isPassword
                ? const Icon(
                  Icons.remove_red_eye_rounded,
                  size: 18,
                  color: AppColors.primary,
                )
                : null,
              suffixText: suflixText,
              suffixStyle: suflixText != null ? buildTextStyle(): null,
              contentPadding: AppPadding.paddingHorizontalLg,
              border: InputBorder.none,
            ),
            readOnly:readOnly,
          ),
        ),
      ],
    );
  }

  TextStyle buildTextStyle() {
    switch (readOnly) {
      case true:
        return AppTextStyle.robotoRegular14.copyWith(
          color: AppColors.secondary,
        );
      default:
      return AppTextStyle.robotoRegular14.copyWith(
          color: AppColors.primary,
        );
    }
  }

  TextStyle buildTitleTextStyle() {
    switch (readOnly) {
      case true:
        return AppTextStyle.robotoMedium14.copyWith(
          color: AppColors.secondary,
        );
      default:
      return AppTextStyle.robotoMedium14.copyWith(
          color: AppColors.primary,
        );
    }
  }
}