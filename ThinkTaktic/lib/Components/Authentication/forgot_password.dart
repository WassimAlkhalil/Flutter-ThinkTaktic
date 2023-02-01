import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/Components/Authentication/signin.dart';
import 'package:notes/Components/my_alert_dialog.dart';
import 'package:notes/Components/my_animated_text_kit.dart';
import 'package:notes/Components/my_textformfield_email.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // CONTROLLERS
  final _emailController = TextEditingController();

  void passwordReset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: _emailController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(height: 80.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 150.0),
            // ANIMATED TEXTS WIDGET
            const SizedBox(
              height: 80.0,
              child: MyAnimatedTextKit(
                firstText: 'forgot password?',
                secondText: 'no worries, we got you !',
              ),
            ),
            const SizedBox(height: 80.0),
            // EMAIL TEXT FORM FIELD WIDGET WITH CONTROLLER
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MyTextFormFieldEmail(
                controller: _emailController,
              ),
            ),
            const SizedBox(height: 80.0),
            // RESET PASSWORD BUTTON WIDGET WITH ON TAP METHOD AND DIALOG BOX WIDGET
            Container(
              width: 390,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () async {
                  passwordReset();
                  // IF EMAIL IS EMPTY SHOW DIALOG BOX WIDGET
                  if (_emailController.text.isEmpty) {
                    // DIALOG BOX WIDGET
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // DIALOG BOX WIDGET
                        return const MyAlertDialog(
                          assetName: 'assets/email_verification.json',
                          textMessage: 'Enter a valid email',
                        );
                      },
                    );
                    // IF EMAIL IS NOT EMPTY SHOW DIALOG BOX WIDGET
                  } else {
                    // DIALOG BOX WIDGET
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // DIALOG BOX WIDGET
                        return const MyAlertDialog(
                          assetName: 'assets/email_sent.json',
                          textMessage: 'Check your email to verify',
                        );
                      },
                    );
                  }
                },
                child: const Center(
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
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
