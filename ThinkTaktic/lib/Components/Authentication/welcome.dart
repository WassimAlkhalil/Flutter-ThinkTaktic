import 'package:flutter/material.dart';
import 'package:notes/Components/Authentication/signin.dart';
import 'package:notes/Components/Authentication/signup.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // WELCOME IMAGE (300x300)
            Image.asset(
              "assets/welcome.jpg",
              height: 300,
              width: 300,
            ),

            const SizedBox(height: 60),

            // SIGN IN BUTTON (390x70)
            // ON TAP NAVIGATE TO SIGN IN PAGE
            Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child: const Center(
                    child: Text(
                      'sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // SIGN UP BUTTON (390x70)
            // ON TAP NAVIGATE TO SIGN UP PAGE
            Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Center(
                    child: Text(
                      'sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
