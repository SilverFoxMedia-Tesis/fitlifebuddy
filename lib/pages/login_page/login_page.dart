import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/login_page/widgets/login_form.dart';
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      isLogged: false,
      child: Row(
        children: [
          const Expanded(
            flex: 5,
            child: LoginForm(),
          ),
          if (ResponsiveBreakpoints.of(context).largerThan(TABLET))
            const Cover(),
        ],
      ),
    );
  }
}