import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetify/utils/colors.dart';

class HomeScreenFeatures extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String name;
  final VoidCallback onTap;

  const HomeScreenFeatures({
    super.key,
    required this.icon,
    required this.color,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double containerSize = screenWidth * 0.15;
    final double iconSize = screenWidth * 0.07;
    final double fontSize = screenWidth * 0.035;
    final double spacing = screenHeight * 0.01;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: .min,
        children: [
          Container(
            height: containerSize,
            width: containerSize,
            alignment: .center,
            decoration: BoxDecoration(
              color: color,
              borderRadius: .circular(containerSize * 0.3),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 6,
                  color: ThemeColor(context).shadow.withValues(alpha: 0.15),
                ),
              ],
            ),
            child: FaIcon(icon, size: iconSize, color: Colors.white),
          ),
          SizedBox(height: spacing),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
