import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

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
    // final meetingState = ref.read(meetingProvider);

    // meetingIdController = TextEditingController(text: meetingState.roomID);
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
    final playfair = GoogleFonts.playfair(
      fontSize: 20, // need to customize
      fontWeight: FontWeight.w700,
      color: Colors.deepOrange.shade600, // need to customize
    );

    // final meetingState = ref.watch(meetingProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber, // need to customize
        title: Text(
          "Start a Meeting",
          style: playfair.copyWith(fontSize: 26, color: Colors.black), // need to customize
        ),
        centerTitle: true,
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
                  fillColor: Colors.deepOrange.withAlpha(30),
                  border: .none,
                  // hintText: "Meeting ID: ${meetingState.roomID}",
                  hintStyle: playfair,
                ),
              ),
            ),

            SizedBox(
              height: 60, // need to customize
              child: TextField(
                controller: nameController,
                textAlign: .center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.green.withAlpha(30), // need to customize
                  border: .none,
                  hintText: "Name",
                  hintStyle: playfair.copyWith(color: Colors.green.shade600), // need to customize
                ),
                style: playfair.copyWith(color: Colors.green.shade600), // need to customize
              ),
            ),
          ],
        ),
      ),
    );
  }
}