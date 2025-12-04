import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetify/utils/colors.dart';

import '../../route.dart';
import '../widgets/home_screen_avatar.dart';
import '../widgets/home_screen_features.dart';
import 'new_meeting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColor(context);
    final height = MediaQuery.of(context).size.height * 0.14;
    final double titleSize = MediaQuery.of(context).size.width * 0.043;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: .fromHeight(height),
        child: const HomeScreenAvatar(),
      ),
      body: Padding(
        padding: const .symmetric(vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                HomeScreenFeatures(
                  icon: FontAwesomeIcons.video,
                  color: colors.meetFeature,
                  name: "Meet",
                  onTap: () {
                    try {
                      NavigationHelper.push(context, const NewMeetingScreen());
                    } catch (_) {
                      rethrow;
                    }
                  },
                ),
                HomeScreenFeatures(
                  icon: FontAwesomeIcons.solidSquarePlus,
                  color: colors.joinFeature,
                  name: "Join",
                  onTap: () {},
                ),
                HomeScreenFeatures(
                  icon: FontAwesomeIcons.calendarDay,
                  color: colors.scheduleFeature,
                  name: "Schedule",
                  onTap: () {},
                ),
                HomeScreenFeatures(
                  icon: FontAwesomeIcons.shareNodes,
                  color: colors.shareFeature,
                  name: "Share",
                  onTap: () {},
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisSize: .min,
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "Create/Join meeting with just a click",
                    style: GoogleFonts.poppins(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w700,
                      color: colors.containerTitle,
                      letterSpacing: 0.5,
                    ),
                    textAlign: .center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Let's do it !!",
                    style: GoogleFonts.poppins(
                      fontSize: titleSize * 0.85,
                      fontWeight: FontWeight.w600,
                      color: colors.containerTitle,
                      letterSpacing: 0.5,
                    ),
                    textAlign: .center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
