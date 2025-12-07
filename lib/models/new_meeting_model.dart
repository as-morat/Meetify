class MeetingState {
  final bool isMicOff;
  final bool isCameraOff;
  final String roomID;

  MeetingState({
    required this.isMicOff,
    required this.isCameraOff,
    required this.roomID,
  });

  MeetingState copyWith({bool? isMicOff, bool? isCameraOff, String? roomID}) {
    return MeetingState(
      isMicOff: isMicOff ?? this.isMicOff,
      isCameraOff: isCameraOff ?? this.isCameraOff,
      roomID: roomID ?? this.roomID,
    );
  }
}