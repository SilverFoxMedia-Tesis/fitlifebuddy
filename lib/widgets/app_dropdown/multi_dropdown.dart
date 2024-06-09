import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';

class MultiDropdown extends StatelessWidget {
  final MultiSelectController<dynamic>? controller;
  final String? title;
  final String? hintText;
  final List<dynamic> items;
  final void Function(dynamic)? onListChanged;
  final bool enabled;
  final double? width;

  const MultiDropdown({
    super.key,
    this.controller,
    this.title,
    this.hintText,
    required this.items,
    this.onListChanged,
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
          child: CustomDropdown<dynamic>.multiSelect(
            multiSelectController: controller,
            hintText: hintText,
            items: items,
            onListChanged: onListChanged,
            decoration: CustomDropdownDecoration(
              closedFillColor: AppColors.light,
              expandedFillColor: AppColors.light,
              closedShadow: [AppBoxShadow.primary25Blur8],
              expandedShadow: [AppBoxShadow.primary25Blur8],
              hintStyle: buildTextStyle(),
              headerStyle: buildTextStyle(),
              listItemStyle: buildTextStyle(),
              listItemDecoration: const ListItemDecoration(
                selectedIconColor: AppColors.primary,
                selectedIconBorder: BorderSide(
                  color: AppColors.secondary,
                  width: 1,
                ),
              ),
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
      overflow: TextOverflow.ellipsis,
    );
  }
}