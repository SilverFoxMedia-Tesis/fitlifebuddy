import 'package:fitlifebuddy/core/theme/size/container_size.dart';
import 'package:fitlifebuddy/core/theme/style/spacing.dart';
import 'package:fitlifebuddy/core/theme/style/text_style.dart';
import 'package:fitlifebuddy/core/utils/input_validator.dart';
import 'package:fitlifebuddy/pages/recover_password_page/recover_password_controller.dart';
import 'package:fitlifebuddy/widgets/app_textfield.dart/app_textfield.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPasswordForm extends GetView<RecoverPasswordController> {
  const RecoverPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.recoverFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: ContainerSize.baseContainerdWidth,
            child: Text(
              'recover_password'.tr,
              style: AppTextStyle.robotoSemibold20,
            ),
          ),
          AppSpacing.spacingVertical24,
          SizedBox(
            width: ContainerSize.baseContainerdWidth,
            child: Text(
              'recover_password_description'.tr,
              style: AppTextStyle.robotoMedium14,
            ),
          ),
          AppSpacing.spacingVertical24,
          AppTextfield(
            title: 'email'.tr,
            controller: controller.emailController.value,
            validator: validateRequiredEmail,
            inputType: TextInputType.emailAddress,
          ),
          AppSpacing.spacingVertical24,
          BaseButton(
            text: 'recover_password'.tr,
            onTap: controller.sendRecoverLink,
          ),
        ],
      ),
    );
  }
}