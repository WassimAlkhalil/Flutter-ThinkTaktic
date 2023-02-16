/*
[TODO] 1. Email Validator (https://emailregex.com/) 
      2. NIST Password Validator (https://pages.nist.gov/800-63-3/sp800-63b.html#sec5)
      3. Firebase Authentication (Email & Password) 
      4. Firebase Cloud Firestore (CRUD)
      5. Firebase Storage (Upload & Download)
      6. game API integration (https://api.rawg.io/docs/)
*/ 



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/Components/AuthenticationPage/authentication_page.dart';
import 'package:notes/firebase_options.dart';

void main() async {
  // INITIALIZE FIREBASE APP WITH DEFAULT FIREBASE OPTIONS FOR MY MOBILE APP
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthenticationPage(),
    );
  }
}
