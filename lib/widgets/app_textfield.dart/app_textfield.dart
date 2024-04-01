import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/input_border.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';

class AppTextfield extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType inputType;
  final String? suffixText;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final bool obscureText;
  final bool readOnly;
  final double width;

  const AppTextfield({
    super.key,
    this.title,
    this.hintText,
    this.controller,
    this.inputType = TextInputType.text,
    this.suffixText,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.obscureText = false,
    this.readOnly = false,
    this.width = ContainerSizes.baseTextfieldWidth,
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
            borderRadius: BorderRadiusWrapper.borderRadius14,
            boxShadow: [AppBoxShadows.primary25Blur8],
          ),
          child: TextField(
            controller: controller,
            keyboardType: inputType,
            style: AppTextStyle.robotoRegular14.copyWith(
              color: AppColors.secondary,
            ),
            cursorColor: AppColors.secondary,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintText != null ? buildTextStyle() : null,
              suffixIconConstraints: const BoxConstraints(),
              suffixIcon: buildSuffixIcon(),
              suffixIconColor: AppColors.primary,
              suffixText: suffixText,
              suffixStyle: suffixText != null ? buildTextStyle(): null,
              contentPadding: AppPadding.paddingHorizontalLg,
              border: InputBorder.none,
              enabledBorder: AppInputBorder.hiddenBorder,
              focusedBorder: AppInputBorder.focusedBorder,
              errorBorder: AppInputBorder.errorBorder,
            ),
            readOnly: readOnly,
            obscureText: obscureText,
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

  Widget buildSuffixIcon() {
    return InkWell(
      onTap: onSuffixIconPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Icon(
          suffixIcon,
          size: 18,
        ),
      ),
    );
  }
}