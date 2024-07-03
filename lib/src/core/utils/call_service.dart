// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

// final jitsiProvider = Provider((ref) => JitsiProvider());

// class JitsiProvider {
//   //final Ref _ref;
// //  JitsiProvider(this._ref);

//   void createMeeting({
//     required String roomName,
//     required bool isAudioMuted,
//     required bool isVideoMuted,
//     String username = '',
//     String email = '',
//     bool preJoined = true,
//     bool isVideo = true,
//     bool isGroup = true,
//   }) async {
//     try {
//       Map<String, Object> featureFlag = {};
//       featureFlag['welcomepage.enabled'] = false;
//       featureFlag['prejoinpage.enabled'] = preJoined;
//       featureFlag['add-people.enabled'] = isGroup;

//       var options = JitsiMeetConferenceOptions(
//         room: roomName,
//         serverURL: 'https://meet.codewithbisky.com',
//         configOverrides: {
//           "startWithAudioMuted": isAudioMuted,
//           "startWithVideoMuted": isVideoMuted,
//           "subject": "Jitsi with Flutter",
//         },
//         userInfo: JitsiMeetUserInfo(displayName: username, email: email),
//         featureFlags: featureFlag,
//       );
//       var jitsiMeet = JitsiMeet();
//       await jitsiMeet.join(options);
//     } catch (error) {
//       print("error: $error");
//     }
//   }
// }
