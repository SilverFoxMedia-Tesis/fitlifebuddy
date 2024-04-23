import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/icons/app_icons.dart';
import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/border_radius.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
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
        constraints: const BoxConstraints(
          maxWidth: ContainerSize.basePlanItemCardWidth,
          maxHeight: ContainerSize.basePlanItemCardHeight,
        ),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: AppBorderRadius.borderRadius14,
          boxShadow: [AppBoxShadow.secondary25Blur8],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      text,
                      style: AppTextStyle.robotoSemibold16.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  if (description != null) ...[
                    AppSpacing.spacingVertical4,
                    Text(
                      description!,
                      style: AppTextStyle.robotoRegular16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            image != '' 
              ? Image.network(
                  image,
                  width: 152,
                  fit: BoxFit.cover,
                  height: double.infinity,
                )
              : Image.asset(
                  AppIcons.notFound,
                  width: 152,
                  fit: BoxFit.cover,
                  height: double.infinity,
                )
          ],
        ),
      ),
    );
  }
}