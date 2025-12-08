import 'package:flutter/material.dart';

const secondaryBackgroundColor = Color(0xFF242424); // Dark mode body background
const primaryBackgroundColor = Color(0xFFF6FFE0); // Light mode body background

class ThemeColor {
  final bool isDark;

  ThemeColor(BuildContext context)
    : isDark = Theme.of(context).brightness == .dark;

  // profileContainer
  Color get profileContainer =>
      isDark ? const Color(0xFF242424) : const Color(0xFFF6FFE0);

  // Footer section background
  Color get footerBackground =>
      isDark ? const Color(0xFF1A1A1A) : const Color(0xFFECECEC);

  // General buttons background
  Color get button => isDark ? Colors.grey.shade900 : Colors.orange.shade50;

  // Borders around widgets
  Color get border => isDark ? Colors.white54 : Colors.orange;

  // Page titles
  Color get title =>
      isDark ? Colors.orange.shade200 : Colors.deepOrange.shade300;

  // Subtitles
  Color get subTitle => isDark ? Colors.grey.shade300 : Colors.blueGrey;

  // General text color
  Color get text => isDark ? Colors.white70 : Colors.deepOrange;

  // Shadows
  Color get shadow => isDark ? Colors.white38 : Colors.black38;

  // Image overlay
  Color get imageColor => isDark
      ? Colors.orange.withValues(alpha: 0.6)
      : Colors.deepOrange.withValues(alpha: 0.6);

  // Bottom navigation bar background
  Color get bottomNavBackground =>
      isDark ? const Color(0xFF242424) : const Color(0xFFF6FFE0);

  // Bottom navigation selected item
  Color get bottomNavSelectedItem =>
      isDark ? Colors.orange.shade300 : Colors.deepOrange;

  // Bottom navigation unselected item
  Color get bottomNavUnselectedItem =>
      isDark ? Colors.grey.shade400 : Colors.black54;

  // "Meet" feature button
  Color get meetFeature =>
      isDark ? Colors.deepOrange.shade700 : Colors.orangeAccent;

  // "Join" feature button
  Color get joinFeature => isDark ? Colors.blue.shade700 : Colors.blueAccent;

  // "Schedule" feature button
  Color get scheduleFeature => isDark ? Colors.green.shade700 : Colors.green;

  // "Share" feature button
  Color get shareFeature =>
      isDark ? Colors.purple.shade700 : Colors.purpleAccent;

  // Custom container background
  Color get containerColor => isDark
      ? Colors.deepOrange.shade700.withValues(alpha: 0.6)
      : Colors.orangeAccent.withValues(alpha: 0.6);

  // Container border color
  Color get containerBorder =>
      isDark ? Colors.orange.shade300 : Colors.deepOrange.shade700;

  // Container title text
  Color get containerTitle =>
      isDark ? Colors.white : Colors.deepOrange.shade900;

  // AppBar title text
  Color get appBarTitle => isDark ? Colors.white : Colors.black;

  // Input field primary fill
  Color get inputFill => isDark
      ? Colors.orange.withValues(alpha: .15)
      : Colors.deepOrange.withValues(alpha: .12);

  // Secondary input fill
  Color get inputFill2 => isDark
      ? Colors.blueGrey.withValues(alpha: .20)
      : Colors.orangeAccent.withValues(alpha: .20);

  // Switch Active
  Color get switchActive =>
      isDark ? Colors.grey.shade300 : Colors.amberAccent.withValues(alpha: 0.5);

  // Switch ActiveThumb
  Color get switchActiveThumb =>
      isDark ? Colors.blueGrey.shade300 : Colors.orange.shade300;

  // Switch InactiveThumb
  Color get switchInactiveThumb => isDark ? Colors.grey : Colors.amberAccent;

  static ThemeColor of(BuildContext context) => ThemeColor(context);
}
