import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetify/features/screens/app_main_screen.dart';
import 'package:meetify/route.dart';
import 'package:meetify/utils/custom_toast.dart';

import '../../utils/colors.dart';
import '../auth/auth_method.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = ThemeColor(context);

    return SizedBox(
      width: width * 0.8,
      child: InkWell(
        borderRadius: .circular(30),
        onTap: () async {
          try {
            final userCredential = await GoogleSignInService.signInWithGoogle();
            NavigationHelper.pushReplacement(context, AppMainScreen());
            if (userCredential != null) {
              showAppSnackBar(
                context: context,
                type: .success,
                description: "Sign In Successful",
              );
            }
          } catch (_) {
            showAppSnackBar(context: context, type: .error, description: "Sign In Failed");
          }
        },
        child: Container(
          padding: const .symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: .circular(30),
            border: .all(color: colors.border, width: 2),
            color: colors.button,
          ),
          child: Row(
            mainAxisAlignment: .center,
            children: [
              Container(
                height: width * 0.08,
                width: width * 0.08,
                decoration: const BoxDecoration(shape: .circle),
                child: const Image(image: AssetImage("images/google.png")),
              ),
              const SizedBox(width: 10),
              Text(
                "Sign In With Google",
                style: GoogleFonts.josefinSans(
                  fontSize: width * 0.045,
                  fontWeight: .w700,
                  color: colors.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
