import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes/Levels/my_list_tile.dart';

class MyDrawerScreen extends StatefulWidget {
  const MyDrawerScreen({super.key});

  @override
  State<MyDrawerScreen> createState() => _MyDrawerScreenState();
}

class _MyDrawerScreenState extends State<MyDrawerScreen> {
  @override
  Widget build(BuildContext context) {
    // GET CURRENT USER DETAILS FROM FIREBASE AUTHENTICATION SERVICE 
    final User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Column(
                children: [
                  // USER PROFILE DETAILS
                  Center( 
                    child: Text(
                      // DISPLAY USER NAME 
                      'Hello, ${user!.displayName}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                MyListTail(
                  text: 'Settings',
                  icon: Icons.settings,
                  onTap: () {
                    // SETTINGS ACTION
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 20.0),
                MyListTail(
                  text: 'Payment',
                  icon: Icons.credit_card,
                  onTap: () {
                    // PAYMENT ACTION
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 20.0),
                MyListTail(
                  text: 'Delete Account',
                  icon: Icons.delete,
                  onTap: () {
                    // DELETE ACCOUNT ACTION
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 20.0),
                MyListTail(
                  text: 'Sign Out',
                  icon: Icons.logout,
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
