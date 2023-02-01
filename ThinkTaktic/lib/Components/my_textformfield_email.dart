import 'package:flutter/material.dart';

class MyTextFormFieldEmail extends StatelessWidget {
  const MyTextFormFieldEmail({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Email',
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        // ICON STYLE 
        prefixIcon: Icon(
          Icons.email,
          color: Colors.black,
        ),
        // BORDER STYLE 
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      // TEXT STYLE 
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
