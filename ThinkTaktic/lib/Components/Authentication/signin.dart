import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/Components/my_animated_text_kit.dart';
import 'package:notes/Components/my_button.dart';
import 'package:notes/Components/my_sliding_up_panel.dart';
import 'package:notes/Components/my_textformfield_email.dart';
import 'package:notes/Components/my_textformfield_password.dart';
import 'package:notes/Components/Authentication/signup.dart';
import 'package:notes/Components/Authentication/forgot_password.dart';

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
  Future signIn() async {
    // SHOW DIALOG WHILE SIGNING IN WITH EMAIL AND PASSWORD AND NAVIGATE TO HOME PAGE ON SUCCESS
    // AND SHOW ERROR DIALOG IF ANY ERROR OCCURS WHILE SIGNING IN
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // THE METHOD TAKES EMAIL AND PASSWORD ENTERED IN THE TEXT FORM FIELDS, TRIMS THEM AND PASSES THEM AS ARGUMENTS

    // SIGN IN WITH EMAIL AND PASSWORD
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  // MEMORY MANAGEMENT
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
        body: Stack(
          children: [
            // BOTTOM SHEET
            const MySlidingUpPanel(text: 'or sign in with ...'),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  // ANIMATED TEXT
                  child: SizedBox(
                    height: 80.0,
                    child: MyAnimatedTextKit(
                      firstText: 'welcome back !',
                      secondText: 'sign in to continue ...',
                    ),
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

                const SizedBox(height: 40.0),

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
                          fontSize: 20.0,
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

                const SizedBox(height: 60.0),

                // SIGN IN BUTTON
                MyButton(
                  text: 'sign in',
                  color: Colors.blue,
                  onTap: () {
                    signIn();
                  },
                ),

                const SizedBox(height: 40.0),

                // SIGN UP BUTTON WITH ON TAP METHOD TO NAVIGATE TO SIGN UP PAGE ON TAP OF SIGN UP BUTTON
                // AND SHOW LOADING DIALOG WHILE SIGNING IN AND SHOW ERROR DIALOG IF ANY ERROR OCCURS WHILE SIGNING IN AND NAVIGATE TO HOME PAGE ON SUCCESS
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
        ),
      ),
    );
  }
}
