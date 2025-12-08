import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class ProfileScreenListTile extends StatelessWidget {
  final dynamic child;
  final IconData icon;
  final String text;
  const ProfileScreenListTile({
    super.key,
    this.child,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = ThemeColor(context);

    final baseText = GoogleFonts.balsamiqSans(
      fontSize: size.width * 0.05,
      fontWeight: .normal,
      color: colors.containerTitle,
      letterSpacing: 1,
    );

    return Container(
      margin: .only(
        top: size.height * 0.02,
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      decoration: BoxDecoration(
        border: .all(color: colors.border, width: 1),
        borderRadius: const .all(.circular(8)),
      ),
      child: ListTile(
        leading: Container(
          height: size.width * 0.09,
          width: size.width * 0.09,
          alignment: .center,
          decoration: BoxDecoration(
            shape: .circle,
            border: .all(color: colors.border, width: 1),
          ),
          child: FaIcon(icon, color: colors.border, size: size.width * 0.04),
        ),
        title: Text(text),
        titleTextStyle: baseText.copyWith(fontSize: size.width * 0.045),
        trailing: child,
      ),
    );
  }
}
