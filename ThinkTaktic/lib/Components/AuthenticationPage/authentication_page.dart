import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;
import 'package:flutter/material.dart';
import 'package:notes/Components/Authentication/welcome.dart';
import 'package:notes/Presentation/presentation.dart';


class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // IF USER IS LOGGED IN THEN SHOW PRESENTATION PAGE 
          if (snapshot.hasData) {
            return const Prsentation();
          // IF USER IS NOT LOGGED IN THEN SHOW WELCOME PAGE
          } else {
            return const WelcomePage();
          }
        },
      ),
    );
  }
}
