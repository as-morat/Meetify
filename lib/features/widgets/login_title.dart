import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final colors = ThemeColor(context);

    return Container(
      margin: const .symmetric(horizontal: 16),
      alignment: .center,
      child: Column(
        crossAxisAlignment: .center,
        children: [
          Text(
            "Welcome to Meetify",
            textAlign: .center,
            style: GoogleFonts.dmSerifDisplay(
              fontSize: width * 0.14,
              fontWeight: .bold,
              color: colors.title,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: colors.shadow,
                  offset: const Offset(2, 2),
                ),
              ],
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const .all(8.0),
            child: Text(
              "Join your meetings instantly and stay connected",
              textAlign: .center,
              style: GoogleFonts.balsamiqSans(
                fontSize: width * 0.045,
                color: colors.subTitle,
                fontWeight: .w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
