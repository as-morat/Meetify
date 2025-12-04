import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meetify/features/screens/log_in_screen.dart';

import '../screens/app_main_screen.dart';

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return authState.when(
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Colors.deepOrange),
        ),
      ),
      error: (e, _) => Scaffold(
        body: Center(child: Text('Auth Error: $e')),
      ),
      data: (user) => user != null ? const AppMainScreen() : const LogInScreen(),
    );

  }
}