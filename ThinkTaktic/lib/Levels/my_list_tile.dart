import 'package:flutter/material.dart';

class MyListTail extends StatelessWidget {
  const MyListTail({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: Icon(icon, color: Colors.black),
        title: Text(text,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.left),
        onTap: onTap,
      ),
    );
  }
}
