import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meetify/utils/colors.dart';
import '../provider/new_meeting_provider.dart';

class NewMeetingScreen extends ConsumerStatefulWidget {
  const NewMeetingScreen({super.key});

  @override
  ConsumerState<NewMeetingScreen> createState() => _NewMeetingScreenState();
}

class _NewMeetingScreenState extends ConsumerState<NewMeetingScreen> {
  late TextEditingController meetingIdController;
  late TextEditingController nameController;

  @override
  void initState() {
    final meetingState = ref.read(meetingProvider);

    meetingIdController = TextEditingController(text: meetingState.roomID);
    nameController = TextEditingController(
      text: FirebaseAuth.instance.currentUser?.displayName ?? "",
    );
    super.initState();
  }

  @override
  void dispose() {
    meetingIdController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = ThemeColor(context);
    final meetingState = ref.watch(meetingProvider);
    final width = MediaQuery.of(context).size.width;
    bool isMicOn = meetingState.isMicOff;
    bool isCameraOn = meetingState.isCameraOff;

    final baseText = GoogleFonts.balsamiqSans(
      fontSize: width * 0.045,
      fontWeight: .w500,
      color: colors.containerTitle,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Start a Meeting",
          style: GoogleFonts.merriweather(
            fontSize: width * 0.06,
            fontWeight: .w600,
            color: colors.appBarTitle,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const .all(16),
          child: Column(
            children: [
              SizedBox(
                height: 60,
                child: TextField(
                  readOnly: true,
                  textAlign: .center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colors.inputFill,
                    border: .none,
                    hintText: "Meeting ID: ${meetingState.roomID}",
                    hintStyle: baseText,
                  ),
                ),
              ), //meeting id

              const SizedBox(height: 8),

              SizedBox(
                height: 60,
                child: TextField(
                  controller: nameController,
                  textAlign: .center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colors.inputFill2,
                    border: .none,
                    hintText: "Name",
                    hintStyle: baseText,
                  ),
                  style: baseText,
                ),
              ), //username section

              const SizedBox(height: 12),

              ListTile(
                onTap: () {
                  ref.read(meetingProvider.notifier).toggleMic(!isMicOn);
                },
                leading: FaIcon(
                  isMicOn
                      ? FontAwesomeIcons.microphoneLines
                      : FontAwesomeIcons.microphoneLinesSlash,
                  size: width * 0.045,
                ),
                title: Text(isMicOn ? "Mute Microphone" : "Unmute Microphone"),
                titleTextStyle: GoogleFonts.balsamiqSans(
                  fontSize: width * 0.045,
                  color: colors.appBarTitle,
                ),
                trailing: Switch(
                  value: isMicOn,
                  onChanged: (value) {
                    setState(() {
                      ref.read(meetingProvider.notifier).toggleMic(value);
                    });
                  },
                  padding: .zero,
                  activeTrackColor: colors.switchActive,
                  inactiveTrackColor: Colors.transparent,
                  inactiveThumbColor: colors.switchInactiveThumb,
                  activeThumbColor: colors.switchActiveThumb,
                ),
              ),
              ListTile(
                onTap: () {
                  ref.read(meetingProvider.notifier).toggleCamera(!isCameraOn);
                },
                leading: FaIcon(
                  isCameraOn
                      ? FontAwesomeIcons.video
                      : FontAwesomeIcons.videoSlash,
                  size: width * 0.045,
                ),
                title: Text(isCameraOn ? "Turn Off Camera" : "Turn On Camera"),
                titleTextStyle: GoogleFonts.balsamiqSans(
                  fontSize: width * 0.045,
                  color: colors.appBarTitle,
                ),
                trailing: Switch(
                  value: isCameraOn,
                  onChanged: (value) {
                    setState(() {
                      ref.read(meetingProvider.notifier).toggleCamera(value);
                    });
                  },
                  padding: .zero,
                  activeTrackColor: colors.switchActive,
                  inactiveTrackColor: Colors.transparent,
                  inactiveThumbColor: colors.switchInactiveThumb,
                  activeThumbColor: colors.switchActiveThumb,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
