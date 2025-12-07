import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/new_meeting_model.dart';

class MeetingNotifier extends Notifier<MeetingState> {
  @override
  MeetingState build() {
    return MeetingState(
      isMicOff: false,
      isCameraOff: false,
      roomID: Random().nextInt(999999).toString(),
    );
  }

  void toggleMic(bool value) {
    state = state.copyWith(isMicOff: value);
  }

  void toggleCamera(bool value) {
    state = state.copyWith(isCameraOff: value);
  }
}

final meetingProvider =
    NotifierProvider.autoDispose<MeetingNotifier, MeetingState>(
      () => MeetingNotifier(),
    );
