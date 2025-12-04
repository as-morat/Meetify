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

    final double containerHeight = size.height * 0.17;
    final double avatarSize = size.height * 0.09;
    final double paddingLeft = size.width * 0.05;
    final double paddingTop = size.height * 0.025;
    final double textSize = size.width * 0.07;
    final double spacing = size.width * 0.06;

    return Container(
      height: containerHeight,
      width: .infinity,
      color: theme.containerColor,
      child: Padding(
        padding: .only(left: paddingLeft, top: paddingTop),
        child: Row(
          children: [
            Container(
              height: avatarSize,
              width: avatarSize,
              decoration: BoxDecoration(
                borderRadius: .circular(avatarSize * 0.2),
                border: .all(color: theme.containerBorder, width: 3),
                image: DecorationImage(
                  image: NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL ?? "",
                  ),
                  fit: .cover,
                ),
              ),
            ),
            SizedBox(width: spacing),
            Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              children: [
                Text(
                  "Home",
                  style: GoogleFonts.merriweather(
                    fontSize: textSize,
                    fontWeight: FontWeight.w600,
                    color: theme.containerTitle,
                  ),
                ),
                SizedBox(height: spacing * 0.18),

                Text(
                  "Hey Buddy, Let's start a meeting.",
                  style: GoogleFonts.saira(
                    fontSize: textSize * 0.56,
                    fontWeight: FontWeight.w600,
                    color: theme.containerTitle,
                    letterSpacing: 0.6,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
