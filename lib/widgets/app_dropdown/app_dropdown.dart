import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final List<String>? items;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final double? height;
  final double? width;
  final bool? enabled;
  final String? title;
  final String? hintText;

  const AppDropdown({
    super.key,
    this.items,
    this.selectedValue,
    this.onChanged,
    this.height = 50,
    this.width = ContainerSize.baseDropdownWidth,
    this.enabled = true,
    this.title,
    this.hintText,
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
        IgnorePointer(
          ignoring: !enabled!,
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: hintText != null 
                ? Text(
                  hintText!,
                  style: AppTextStyle.robotoMedium14.copyWith(
                    color: AppColors.disabled,
                  ),
                )
                : null,
              items: items?.map(
                (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: buildTextStyle(),
                      ),
                    ))
                .toList(),
              value: selectedValue,
              onChanged: onChanged,
              buttonStyleData: ButtonStyleData(
                height: height,
                width: width,
                padding: AppPadding.padding16,
                decoration: const BoxDecoration(
                  color: AppColors.light,
                  borderRadius: AppBorderRadius.borderRadius14,
                  boxShadow: [AppBoxShadow.primary25Blur8],
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  size: ContainerSize.iconSizeLarge,
                  color: AppColors.secondary,
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: width,
                decoration: const BoxDecoration(
                  color: AppColors.light,
                  borderRadius: AppBorderRadius.borderRadius14,
                  boxShadow: [AppBoxShadow.primary25Blur8],
                ),
                offset: const Offset(0, 0),
                scrollbarTheme: ScrollbarThemeData( //revisar otra vez
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: AppPadding.padding16,
                overlayColor: MaterialStateProperty.all<Color>(AppColors.background),
              ),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle buildTextStyle() {
    switch (enabled) {
      case true:
        return AppTextStyle.robotoMedium14.copyWith(
          color: AppColors.primary,
        );
      default:
      return AppTextStyle.robotoMedium14;
    }
  }
}