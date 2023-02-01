import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyAnimatedTextKit extends StatelessWidget {
  const MyAnimatedTextKit({super.key, required this.firstText, required this.secondText});

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          firstText,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          secondText,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
          speed: const Duration(
            milliseconds: 100,
          ),
        ),
      ],
      isRepeatingAnimation: false,
    );
  }
}
