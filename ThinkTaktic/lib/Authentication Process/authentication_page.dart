import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;
import 'package:flutter/material.dart';
import 'package:notes/Authentication/welcome.dart';
import 'package:notes/Presentation/presentation.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            if (user == null) {
              return const WelcomePage();
            }
            return const PrsentationPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
