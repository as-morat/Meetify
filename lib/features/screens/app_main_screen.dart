import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meetify/features/screens/profile_screen.dart';

import '../../utils/colors.dart';
import 'home_screen.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int currentIndex = 0;
  final List<Widget> pages = [
    HomeScreen(),
    Center(child: Text("Chats")),
    Center(child: Text("Settings")),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = ThemeColor.of(context);

    return Scaffold(
      backgroundColor: theme.bottomNavBackground,
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: .fixed,
        selectedItemColor: theme.bottomNavSelectedItem,
        unselectedItemColor: theme.bottomNavUnselectedItem,
        backgroundColor: theme.bottomNavBackground,
        iconSize: MediaQuery.of(context).size.width * 0.055,
        currentIndex: currentIndex,

        onTap: (value) {
          setState(() => currentIndex = value);
        },

        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseChimney),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidMessage),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.gear),
            label: "Settings",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
