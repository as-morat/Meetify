import 'package:flutter/material.dart';
import 'package:meetify/features/screens/log_in_screen.dart';

import '../../route.dart';
import '../../utils/custom_toast.dart';
import '../auth/auth_method.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber, // need to customize
      body: Center(
        child: IconButton.outlined(
          onPressed: () {
            GoogleSignInService.signOut();
            NavigationHelper.pushReplacement(context, LogInScreen());
            showAppSnackBar(
              context: context,
              type: .success,
              description: "See you soon! You’re now logged out.",
            );
          },
          icon: const Icon(Icons.logout, color: Colors.deepOrange, size: 50), // need to customize
          style: ButtonStyle(
            padding: .all(const .all(20)),
            side: .all(const BorderSide(color: Colors.deepOrange, width: 3)), // need to customize
            shape: .all(RoundedRectangleBorder(borderRadius: .circular(16))),
            overlayColor: .all(Colors.deepOrangeAccent.withAlpha(15)), // need to customize
          ),
        ),
      ),
    );
  }
}