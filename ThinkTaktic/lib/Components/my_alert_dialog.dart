import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyAlertDialog extends StatelessWidget {
  final String assetName;
  final String textMessage;

  const MyAlertDialog({super.key, 
    required this.assetName,
    required this.textMessage,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CLOSE BUTTON WIDGET
            InkWell(
              child: const Icon(Icons.close),
              onTap: () {
                // POP NAVIGATOR WIDGET
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 60),
            Lottie.asset(
              assetName,
              height: 100,
              width: 100,
              repeat: false,
            ),
            const SizedBox(height: 10),
            Text(
              textMessage,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
