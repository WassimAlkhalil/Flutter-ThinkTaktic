import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyAnimatedTextKit extends StatelessWidget {
  const MyAnimatedTextKit(
      {super.key, required this.firstText, required this.secondText});

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double maxWidth = constraints.maxWidth;
        double fontSize = maxWidth * 0.05;
        return AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              firstText,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
              speed: const Duration(milliseconds: 100),
            ),
            TypewriterAnimatedText(
              secondText,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
              speed: const Duration(
                milliseconds: 100,
              ),
            ),
          ],
          isRepeatingAnimation: false,
        );
      },
    );
  }
}
