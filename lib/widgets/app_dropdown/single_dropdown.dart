import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleDropdown extends StatelessWidget {
  final String? title;
  final String? hintText;
  final List<String> items;
  final void Function(dynamic)? onChanged;
  final bool enabled;
  final double? width;

  const SingleDropdown({
    super.key,
    this.title,
    this.hintText,
    required this.items,
    this.onChanged,
    this.enabled = true,
    this.width,
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
            style: buildTextStyle(),
          ),
          AppSpacing.spacingVertical8,
        ],
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width ?? double.infinity,
          ),
          child: CustomDropdown<String>(
            hintText: hintText,
            items: items,
            validator: (value) {
              if (value == null || value.isEmpty) return "select_an_option".tr;
              return null;
            },
            onChanged: onChanged,
            decoration: CustomDropdownDecoration(
              closedFillColor: AppColors.light,
              expandedFillColor: AppColors.light,
              closedShadow: [AppBoxShadow.primary25Blur8],
              expandedShadow: [AppBoxShadow.primary25Blur8],
              hintStyle: buildTextStyle(),
              headerStyle: buildTextStyle(),
              //TODO: corregir
              //closedErrorBorder:
              errorStyle: AppTextStyle.robotoRegular14.copyWith(
                color: AppColors.danger,
              ),
              listItemStyle: buildTextStyle(),
            ),
            enabled: enabled,
            disabledDecoration: CustomDropdownDisabledDecoration(
              fillColor: AppColors.light,
              shadow: [AppBoxShadow.primary25Blur8],
              hintStyle: buildTextStyle(),
              headerStyle: buildTextStyle(),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle buildTextStyle() {
    switch (enabled) {
      case true:
        return AppTextStyle.robotoRegular14.copyWith(
          color: AppColors.primary,
        );
      default:
      return AppTextStyle.robotoRegular14;
    }
  }
}