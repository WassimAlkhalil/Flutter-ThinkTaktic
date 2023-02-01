import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:notes/Home/home_page.dart';

class FirstLevel extends StatefulWidget {
  const FirstLevel({super.key});

  @override
  State<FirstLevel> createState() => _FirstLevelState();
}

class _FirstLevelState extends State<FirstLevel> {
  final String _riddle =
      "What starts with an E, ends with an E, but only contains one letter?";
  final String _answer = "envelope";
  String _userAnswer = "";
  String _result = "";

  // CONTROLL FLOW
  void _onAnswerChanged(String value) {
    setState(() {
      _userAnswer = value;
      if (_userAnswer == _answer) {
        _result = "Correct!";
      } else {
        _result = "Wrong!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 60.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 150.0),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Guess the Riddle',
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              isRepeatingAnimation: false,
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(_riddle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue[50],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: TextField(
                      onChanged: _onAnswerChanged,
                      decoration: const InputDecoration(
                        hintText: "Enter your answer",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(_result, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
