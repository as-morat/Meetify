import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .start,
          children: [
            HomeScreenAvatar(),
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}