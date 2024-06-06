import 'package:fitlifebuddy/core/theme/style/padding.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/questions_page/widgets/questions_view.dart';
import 'package:fitlifebuddy/widgets/custom_bar/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionsPage extends StatelessWidget {
  const QuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      child: Padding(
        padding: AppPadding.paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSpacing.spacingVertical24,
            buildCustomBar(),
            AppSpacing.spacingVertical24,
            const Expanded(
              child: QuestionsView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomBar() {
    return CustomBar(
      title: 'faq'.tr,
    );
  }
}