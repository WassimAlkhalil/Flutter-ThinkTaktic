import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/Components/my_animated_text_kit.dart';
import 'package:notes/Components/my_button.dart';
import 'package:notes/Components/my_sliding_up_panel.dart';
import 'package:notes/Components/my_textformfield_email.dart';
import 'package:notes/Components/my_textformfield_password.dart';
import 'package:notes/Components/Authentication/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // CONTROLLERS
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // SIGN IN METHOD
  Future _signUp() async {
    // SIGN IN WITH EMAIL AND PASSWORD
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
            const MySlidingUpPanel(text: 'or sign up with ...'),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  // ANIMATED TEXT
                  child: SizedBox(
                    height: 80.0,
                    child: MyAnimatedTextKit(
                      firstText: 'good decision !',
                      secondText: 'sign up to play ...',
                    ),
                  ),
                ),

                const SizedBox(height: 20.0),

                // EMAIL TEXT FIELD WITH ICON BUTTON AND NAVIGATION TO SIGN UP PAGE
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

                const SizedBox(height: 120.0),

                // SIGN IN BUTTON
                MyButton(
                  text: 'sign up',
                  color: Colors.blue,
                  onTap: () {
                    _signUp();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 40.0),

                // SIGN IN TEXT WITH INK WELL EFFECT AND NAVIGATION TO SIGN IN PAGE
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                        );
                      },
                      child: const Text(
                        'sign in',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Icon(
                      Icons.login,
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
