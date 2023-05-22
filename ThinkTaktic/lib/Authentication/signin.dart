import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/Components/my_animated_text_kit.dart';
import 'package:notes/Components/my_button.dart';
import 'package:notes/Components/my_sliding_up_panel.dart';
import 'package:notes/Components/my_textformfield_email.dart';
import 'package:notes/Components/my_textformfield_password.dart';
import 'package:notes/Authentication/signup.dart';
import 'package:notes/Authentication/forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // CONTROLLERS
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // SIGN IN METHOD
  Future<void> signIn() async {
    setState(() {});

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      // IF ANY ERROR OCCURS WHILE SIGNING IN THEN SHOW ERROR DIALOG
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('${e.message}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // MEMORY MANAGEMENT
  @override
  void dispose() {
    //
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose(); // call the dispose method of the parent class
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
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // BOTTOM SHEET
                const MySlidingUpPanel(text: 'sign in with ...'),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80.0,
                      child: MyAnimatedTextKit(
                        firstText: 'welcome back!',
                        secondText: 'sign in to continue...',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    // EMAIL TEXT FIELD
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyTextFormFieldEmail(
                        controller: _emailController,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    // PASSWORD TEXT FIELD WITH TOGGLE VISIBILITY BUTTON
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MyTextFormFieldPassword(
                        controller: _passwordController,
                      ),
                    ),
                    const SizedBox(height: 80.0),
                    // FORGOT PASSWORD
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPassword()),
                            );
                          },
                          child: const Text(
                            'forgot password',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Icon(
                          Icons.password,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    // SIGN IN BUTTON
                    MyButton(
                      text: 'sign in',
                      color: Colors.blue,
                      onTap: () {
                        signIn();
                      },
                    ),
                    const SizedBox(height: 40.0),
                    // SIGN UP BUTTON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const SignUp(),
                              ),
                            );
                          },
                          child: const Text(
                            'sign up',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        const Icon(
                          Icons.app_registration,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
