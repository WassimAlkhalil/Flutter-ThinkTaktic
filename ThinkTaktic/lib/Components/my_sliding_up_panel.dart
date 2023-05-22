import 'package:flutter/material.dart';
import 'package:notes/components/google_apple_button.dart';
import 'package:notes/services/apple_service.dart';
import 'package:notes/services/google_service.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MySlidingUpPanel extends StatelessWidget {
  const MySlidingUpPanel({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.08,
        maxHeight: MediaQuery.of(context).size.height * 0.22,
        renderPanelSheet: false,
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),
      ),
    );
  }

  Widget _floatingCollapsed() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _floatingPanel() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]),
      margin: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // GOOGLE SIGN IN BUTTON
          MySignInButton(
            key: const Key('googleSignInButton'),
            onPressed: GoogleService().signInWithGoogle,
            assetName: 'assets/Google.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 20),
          // APPLE SIGN IN BUTTON
          MySignInButton(
            key: const Key('appleSignInButton'),
            onPressed: AppleService().signInWithApple,
            assetName: 'assets/Apple.png',
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}
