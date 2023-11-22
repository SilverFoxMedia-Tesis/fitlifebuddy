import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/style/box_shadows.dart';
import 'package:fitlifebuddy/core/theme/wrapper/padding.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AppButton extends StatelessWidget {
  final String icon;
  final String text;
  final num? colorNumber;
  final void Function()? onTap;

  const AppButton({
    super.key, 
    required this.icon, 
    required this.text, 
    this.colorNumber, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: Container(
          padding: AppPadding.paddingLg,
          width: expanded.value ? 176 : 56,
          decoration: BoxDecoration(
            color: _getColor(colorNumber),
            borderRadius: expanded.value ? BorderRadius.circular(32) : null,
            boxShadow: const [AppBoxShadows.secondary25Blur8],
            shape: expanded.value ? BoxShape.rectangle : BoxShape.circle,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: ContainerSizes.appBarButtonWitdth,
                height: ContainerSizes.appBarButtonWitdth,
              ),
              if (expanded.value) ...[
                AppSpacing.spacingHorizontalLg,
                Text(
                  text,
                  style: AppTextStyle.robotoSemibold14.copyWith(
                    color: AppColors.white,
                  )
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(num? colorNumber) {
    switch (colorNumber) {
      case 1:
        return AppColors.secondary;
      default:
        return AppColors.primary;
    }
  }
}