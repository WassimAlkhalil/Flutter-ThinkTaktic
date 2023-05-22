/*
[TODO] 1. Email Validator (https://emailregex.com/) 
       2. Password Validator regarding to the NIST recommendations(https://pages.nist.gov/800-63-3/sp800-63b.html#sec5)
       3. Firebase Authentication (Email & Password) 
       4. Firebase Cloud Firestore (CRUD)
       5. game API integration (https://api.rawg.io/docs/)
       6. GDPR (https://gdpr.eu/)
*/ 

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/Authentication/welcome.dart';

void main() async {
  // INITIALIZE FIREBASE APP WITH DEFAULT FIREBASE OPTIONS 
  WidgetsFlutterBinding.ensureInitialized(); // ensure that the app is initialized
  await Firebase.initializeApp(); // initialize the app with the default firebase options 
   
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
