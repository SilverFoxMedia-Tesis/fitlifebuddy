import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';

class SingleDropdown extends StatelessWidget {
  final String? title;
  final String? hintText;
  final List<dynamic> items;
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
        SizedBox(
          width: width,
          child: CustomDropdown<dynamic>(
            hintText: hintText,
            items: items,
            initialItem: items.first,
            onChanged: onChanged,
            decoration: CustomDropdownDecoration(
              closedFillColor: AppColors.light,
              expandedFillColor: AppColors.light,
              closedShadow: [AppBoxShadow.primary25Blur8],
              expandedShadow: [AppBoxShadow.primary25Blur8],
              hintStyle: buildTextStyle(),
              headerStyle: buildTextStyle(),
              listItemStyle: buildTextStyle(),
            ),
            enabled: enabled,
          ),
        ),
      ],
    );
  }

  TextStyle buildTextStyle() {
    return AppTextStyle.robotoMedium14.copyWith(
      color: AppColors.primary,
    );
  }
}