import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetify/utils/colors.dart';

class HomeScreenAvatar extends StatelessWidget {
  const HomeScreenAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = ThemeColor(context);

    // Responsive measurements
    final double containerHeight = size.height * 0.14;
    final double avatarSize = size.height * 0.082;
    final double titleSize = size.width * 0.068;
    final double horizontalPadding = size.width * 0.05;

    return Container(
      height: containerHeight,
      width: .infinity,
      padding: .symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        color: theme.containerColor.withValues(alpha: 0.5),
      ),

      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Column(
            mainAxisSize: .min,
            crossAxisAlignment: .start,
            children: [
              Text(
                "Home",
                style: GoogleFonts.merriweather(
                  fontSize: titleSize,
                  fontWeight: .w700,
                  color: theme.containerTitle,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Welcome Buddy !!",
                style: GoogleFonts.saira(
                  fontSize: titleSize * 0.6,
                  fontWeight: .w600,
                  color: theme.containerTitle,
                  letterSpacing: 1,
                  height: 1.2,
                ),
              ),
            ],
          ),

          Container(
            height: avatarSize,
            width: avatarSize,
            decoration: BoxDecoration(
              borderRadius: .circular(avatarSize * 0.35),
              border: .all(color: theme.containerBorder, width: 2.4),
              image: DecorationImage(
                image: NetworkImage(
                  FirebaseAuth.instance.currentUser?.photoURL ?? "",
                ),
                fit: .cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
