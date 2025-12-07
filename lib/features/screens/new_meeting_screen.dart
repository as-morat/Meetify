import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    final baseText = GoogleFonts.merriweather(
      fontSize: rs(context, 14),
      fontWeight: .w500,
      color: colors.containerTitle,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Start a Meeting",
          style: baseText.copyWith(
            fontSize: rs(context, 23),
            color: colors.appBarTitle,
          ),
        ),
      ),

      body: Padding(
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
            ),

            const SizedBox(height: 10),

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
            ),
          ],
        ),
      ),
    );
  }
}

double rs(BuildContext context, double size) {
  final width = MediaQuery.of(context).size.width;
  return (size / 375) * width;
}
