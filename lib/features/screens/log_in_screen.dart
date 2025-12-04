import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../widgets/login_button.dart';
import '../widgets/login_title.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const LoginTitle(),
            Image.asset(
              "images/onboarding.png",
              color: ThemeColor(context).imageColor,
              fit: .cover,
            ),
            const SizedBox(height: 40,),
            LoginButton()
          ],
        ),
      ),
    );
  }
}
