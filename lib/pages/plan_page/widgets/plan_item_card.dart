import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/wrapper/border_radius_wrapper.dart';
import 'package:fitlifebuddy/core/theme/wrapper/spacing.dart';
import 'package:fitlifebuddy/core/theme/wrapper/text_style.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/style/box_shadows.dart';

class PlanItemCard extends StatelessWidget {
  final String text;
  final String? description;
  final String image;
  final void Function()? onTap;

  const PlanItemCard({
    super.key,
    required this.text, 
    this.description,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 400,
        height: 160,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusWrapper.borderRadiusLg,
          boxShadow: [AppBoxShadows.secondary25Blur8],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      text,
                      style: AppTextStyle.robotoSemibold24.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  if (description != null) ...[
                    AppSpacing.spacingVerticalXs,
                    Text(
                      description!,
                      style: AppTextStyle.robotoSemibold14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Image.asset(
              image,
              width:152,
              fit: BoxFit.contain,
              height: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}