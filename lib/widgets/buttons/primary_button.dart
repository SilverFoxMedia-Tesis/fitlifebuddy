import 'package:fitlifebuddy/core/theme/colors/colors.dart';
import 'package:fitlifebuddy/widgets/buttons/action_severity.dart';
import 'package:fitlifebuddy/widgets/buttons/base_button.dart';
import 'package:fitlifebuddy/widgets/buttons/button_size.dart';

class PrimaryButton extends BaseButton {
  const PrimaryButton({
    super.key,
    required String text,
    ButtonSize? buttonSize = ButtonSize.medium,
    ActionSeverity? actionSeverity = ActionSeverity.primary,
    void Function()? onTap,
    bool enabled = true,
  }) : super(
        text: text,
        textColor: AppColors.white,
        size: buttonSize,
        actionSeverity: actionSeverity,
        onTap: onTap,
        enabled: enabled,
      );
}