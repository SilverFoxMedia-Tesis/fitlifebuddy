import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> list = getinfo();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var item in list)
            ListTile(
              contentPadding: AppPadding.padding16,
              title: item['title'] != null
                ? Text(
                    item['title']!.tr,
                    style: AppTextStyle.robotoSemibold20.copyWith(
                      color: AppColors.secondary,
                    ),
                  )
                : null,
              subtitle: item['description'] != null
                ? Text(
                    item['description']!.tr,
                    style: AppTextStyle.robotoRegular16.copyWith(
                      color: AppColors.secondary,
                    ),
                  )
                : null,
              leading: item['image'] != null
                ? Image.asset('image')
                : null,
            ),
        ],
      ),
    );
  }

  List<Map<String, String>> getinfo() {
    return [
      {'title': 'patientRegistration', 'description': 'newAccount'},
      {'title': 'patientLogin', 'description': 'loginInstructions'},
      {'title': 'patientProfileView', 'description': 'profileViewInstructions'},
      {'title': 'dietaryConditionsRegistration', 'description': 'registerDietaryConditionInstructions'},
      {'title': 'planGeneration', 'description': 'planGenerationInstructions'},
      {'title': 'planView', 'description': 'planViewInstructions'},
      {'title': 'mealInfoView', 'description': 'mealInfoViewInstructions'},
      {'title': 'routineView', 'description': 'routineViewInstructions'},
      {'title': 'mealChange', 'description': 'mealChangeInstructions'},
      {'title': 'exerciseChange', 'description': 'exerciseChangeInstructions'},
      {'title': 'mealStatusUpdate', 'description': 'mealStatusUpdateInstructions'},
      {'title': 'routineStatusUpdate', 'description': 'routineStatusUpdateInstructions'},
      {'title': 'personalInfoUpdate', 'description': 'personalInfoUpdateInstructions'},
      {'title': 'dietaryConditionsUpdate', 'description': 'dietaryConditionsUpdateInstructions'},
      {'title': 'healthConditionsUpdate', 'description': 'healthConditionsUpdateInstructions'},
    ];
  }
}