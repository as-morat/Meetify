import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/custom_toast.dart';

class GoogleSignInService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static bool isInitialize = false;

  /// Sign in with Google
  static Future<UserCredential?> signInWithGoogle() async {
    try {
      // Always disconnect previous session to avoid silent login issues
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) throw "Cancelled";

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      final User? user = userCredential.user;

      // Save user to Firestore if new
      if (user != null) {
        final userDoc = FirebaseFirestore.instance
            .collection("user")
            .doc(user.uid);
        final docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          await userDoc.set({
            "uid": user.uid,
            "name": user.displayName ?? "",
            "email": user.email ?? "",
            "photoUrl": user.photoURL ?? "",
            "credential": FieldValue.serverTimestamp(),
          });
        }
      }

      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  /// Sign out
  static Future<void> signOut(BuildContext context) async {
    try {
      await _googleSignIn.disconnect();
      await _googleSignIn.signOut();
      await _auth.signOut();
      if (context.mounted) {
        showAppSnackBar(
          context: context,
          type: .success,
          description: "See you soon! You’re now logged out.",
        );
      }
    } catch (_) {
      if (context.mounted) {
        showAppSnackBar(
          context: context,
          type: .error,
          description: "Sorry! Something might happen.",
        );
      }
    }
  }

  /// Get current Firebase user
  static User? getCurrentUser() {
    return _auth.currentUser;
  }
}
