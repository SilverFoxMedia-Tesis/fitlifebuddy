import 'package:fitlifebuddy/pages/launcher_page.dart';
import 'package:fitlifebuddy/pages/login_page/widgets/login_form.dart';
import 'package:fitlifebuddy/widgets/cover/cover.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LauncherPage(
      isLogged: false,
      child: const Row(
        children: [
          Expanded(
            flex: 5,
            child: LoginForm(),
          ),
          Cover(),
        ],
      ),
    );
  }
}