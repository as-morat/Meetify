import 'package:flutter/material.dart';

const secondaryBackgroundColor = Color(0xFF242424);
const primaryBackgroundColor = Color(0xFFF6FFE0);

class ThemeColor {
  final bool isDark;

  ThemeColor(BuildContext context)
    : isDark = Theme.of(context).brightness == Brightness.dark;

  Color get footerBackground =>
      isDark ? const Color(0xFF1A1A1A) : const Color(0xFFECECEC);

  Color get button => isDark ? Colors.grey.shade900 : Colors.orange.shade50;

  Color get border => isDark ? Colors.white54 : Colors.orange;

  Color get title =>
      isDark ? Colors.orange.shade200 : Colors.deepOrange.shade300;

  Color get subTitle => isDark ? Colors.grey.shade300 : Colors.blueGrey;

  Color get text => isDark ? Colors.white70 : Colors.deepOrange;

  Color get shadow => isDark ? Colors.white38 : Colors.black38;

  Color get imageColor => isDark
      ? Colors.orange.withValues(alpha: 0.6)
      : Colors.deepOrange.withValues(alpha: 0.6);

  Color get bottomNavBackground =>
      isDark ? const Color(0xFF242424) : const Color(0xFFF6FFE0);

  Color get bottomNavSelectedItem =>
      isDark ? Colors.orange.shade300 : Colors.deepOrange;

  Color get bottomNavUnselectedItem =>
      isDark ? Colors.grey.shade400 : Colors.black54;

  Color get meetFeature =>
      isDark ? Colors.deepOrange.shade700 : Colors.orangeAccent;

  Color get joinFeature => isDark ? Colors.blue.shade700 : Colors.blueAccent;

  Color get scheduleFeature => isDark ? Colors.green.shade700 : Colors.green;

  Color get shareFeature =>
      isDark ? Colors.purple.shade700 : Colors.purpleAccent;

  Color get containerColor => isDark
      ? Colors.deepOrange.shade700.withValues(alpha: 0.6)
      : Colors.orangeAccent.withValues(alpha: 0.6);

  Color get containerBorder =>
      isDark ? Colors.orange.shade300 : Colors.deepOrange.shade700;

  Color get containerTitle =>
      isDark ? Colors.white : Colors.deepOrange.shade900;

  static ThemeColor of(BuildContext context) => ThemeColor(context);
}
