import 'package:flutter/material.dart';
import 'package:notes/Home/home_page.dart';
import 'package:notes/Presentation/intro_first_page.dart';
import 'package:notes/Presentation/intro_second_page.dart';
import 'package:notes/Presentation/intro_third_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Prsentation extends StatefulWidget {
  const Prsentation({super.key});

  @override
  State<Prsentation> createState() => _PrsentationState();
}

class _PrsentationState extends State<Prsentation> {
  final _controller = PageController();
  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _isLastPage = index == 2;
              });
            },
            children: const [
              IntroFirstPage(),
              IntroSecondPage(),
              IntroThirdPage(),
            ],
          ),
          Container(
            alignment: const Alignment(0.0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SKIP BUTTON
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // DOT INDICATOR
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
                // NEXT BUTTON
                _isLastPage == true
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
