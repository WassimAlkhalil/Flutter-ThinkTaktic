import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth * 0.8,
          height: 60.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
