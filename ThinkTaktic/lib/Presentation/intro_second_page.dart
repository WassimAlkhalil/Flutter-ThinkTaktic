import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroSecondPage extends StatelessWidget {
  const IntroSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'think outside the box',
                  textStyle: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          const SizedBox(height: 10),
          Lottie.asset('assets/intro_second_page.json', repeat: false, height: 400, width: 400),
        ],
      ),
    );
  }
}
