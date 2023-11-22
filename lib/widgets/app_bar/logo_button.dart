import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/spacing/container_sizes.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:fitlifebuddy/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LogoButton extends StatelessWidget {
  final String icon;
  final String text;
  final void Function()? onTap;

  const LogoButton({
    super.key, 
    required this.icon, 
    required this.text, 
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: onTap,
        child: SizedBox(
          width: expanded.value 
            ? ContainerSizes.logoButtonWitdthExpanded
            : ContainerSizes.logoButtonWitdth,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: ContainerSizes.logoButtonWitdth,
                height: ContainerSizes.logoButtonWitdth,
              ),
              if (expanded.value) ...[
                AppSpacing.spacingHorizontalLg,
                Text(
                  text,
                  style: AppTextStyle.robotoSemibold20.copyWith(
                    color: AppColors.secondary
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}