import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetify/features/widgets/profile_screen_list_tile.dart';
import 'package:meetify/utils/colors.dart';
import '../../utils/custom_toast.dart';
import '../auth/auth_method.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isOn = false;
  String selectedLanguage = "English";
  @override
  Widget build(BuildContext context) {
    final colors = ThemeColor(context);
    final size = MediaQuery.of(context).size;
    final user = FirebaseAuth.instance.currentUser;

    final baseText = GoogleFonts.balsamiqSans(
      fontSize: size.width * 0.05,
      fontWeight: .normal,
      color: colors.containerTitle,
      letterSpacing: 1,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: .infinity,
          child: Stack(
            children: [
              // Profile Image
              SizedBox(
                height: size.height * 0.3,
                width: .infinity,
                child: Image.network(
                  "https://t3.ftcdn.net/jpg/16/55/94/76/360_F_1655947679_UzCGrt9FDKeSZNTjALIaZPS7zraJQeTP.png",
                  fit: .cover,
                ),
              ),

              /// Bottom white container
              Positioned(
                top: size.height * 0.2,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.profileContainer,
                    borderRadius: const .only(
                      topLeft: .circular(30),
                      topRight: .circular(30),
                    ),
                    border: Border(
                      top: BorderSide(color: colors.border, width: 6),
                    ),
                  ),
                  child: Padding(
                    padding: const .only(top: 60),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Hello, ",
                            style: baseText,
                            children: [
                              TextSpan(
                                text:
                                    user?.displayName?.toLowerCase() ??
                                    "Buddy !",
                                style: baseText.copyWith(
                                  fontSize: size.width * 0.065,
                                  fontWeight: .w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Notification
                        ProfileScreenListTile(
                          icon: FontAwesomeIcons.bell,
                          text: "Notification",
                          child: Switch(
                            value: isOn,
                            onChanged: (value) {
                              setState(() {
                                isOn = value;
                              });
                            },
                            padding: .zero,
                            activeTrackColor: colors.switchActive,
                            inactiveTrackColor: Colors.transparent,
                            inactiveThumbColor: colors.switchInactiveThumb,
                            activeThumbColor: colors.switchActiveThumb,
                          ),
                        ),
                        // Select Language
                        ProfileScreenListTile(
                          icon: FontAwesomeIcons.language,
                          text: "Language",
                          child: Row(
                            mainAxisSize: .min,
                            children: [
                              Text(
                                selectedLanguage,
                                style: baseText.copyWith(
                                  color: colors.text,
                                  fontSize: size.width * 0.04,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  String? language = await showDialog<String>(
                                    context: context,
                                    builder: (context) => SimpleDialog(
                                      title: const Text("Select Language"),
                                      children: [
                                        SimpleDialogOption(
                                          onPressed: () =>
                                              Navigator.pop(context, "Arabic"),
                                          child: const Text("Arabic"),
                                        ),
                                        SimpleDialogOption(
                                          onPressed: () =>
                                              Navigator.pop(context, "Bengali"),
                                          child: const Text("Bengali"),
                                        ),
                                        SimpleDialogOption(
                                          onPressed: () =>
                                              Navigator.pop(context, "English"),
                                          child: const Text("English"),
                                        ),
                                        SimpleDialogOption(
                                          onPressed: () =>
                                              Navigator.pop(context, "Hindi"),
                                          child: const Text("Hindi"),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (language != null) {
                                    setState(() {
                                      selectedLanguage = language;
                                    });
                                  }
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: colors.border,
                                  size: size.width * 0.07,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Settings
                        ProfileScreenListTile(
                          icon: FontAwesomeIcons.gear,
                          text: "Settings",
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: colors.border,
                            size: size.width * 0.07,
                          ),
                        ),
                        // Help
                        ProfileScreenListTile(
                          icon: FontAwesomeIcons.exclamation,
                          text: "Help",
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: colors.border,
                            size: size.width * 0.07,
                          ),
                        ),
                        // Contact
                        ProfileScreenListTile(
                          icon: FontAwesomeIcons.phone,
                          text: "Contact Us",
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: colors.border,
                            size: size.width * 0.07,
                          ),
                        ),
                        const SizedBox(height: 50),
                        // Logout Button
                        GestureDetector(
                          onTap: () {
                            GoogleSignInService.signOut(context);
                          },
                          child: Container(
                            height: size.width * 0.13,
                            width: size.width * 75,
                            alignment: .center,
                            margin: const .symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: colors.button,
                              borderRadius: const .all(.circular(12)),
                              border: .all(color: colors.border, width: 2),
                            ),
                            child: Row(
                              mainAxisSize: .min,
                              mainAxisAlignment: .center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.arrowRightFromBracket,
                                  color: colors.text,
                                  size: size.width * 0.065,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Sign Out",
                                  style: GoogleFonts.josefinSans(
                                    fontSize: size.width * 0.045,
                                    fontWeight: .w700,
                                    color: colors.text,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// Floating Brand Logo
              Positioned(
                top: size.height * 0.2 - (size.width * 0.125),
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: size.width * 0.25,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      shape: .circle,
                      color: colors.profileContainer,
                      border: .all(color: colors.border, width: 6),
                      image: DecorationImage(
                        image: NetworkImage(user?.photoURL ?? ""),
                        fit: .cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
