import 'package:flutter/material.dart';

class MyTextFormFieldPassword extends StatefulWidget {
  const MyTextFormFieldPassword({super.key, required this.controller});

  // CONTROLLER
  final TextEditingController controller;

  @override
  State<MyTextFormFieldPassword> createState() =>
      _MyTextFormFieldPasswordState();
}

class _MyTextFormFieldPasswordState extends State<MyTextFormFieldPassword> {
  // TOGGLE PASSWORD VISIBILITY
  late bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            color: Colors.black,
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(
              () {
                _obscureText = !_obscureText;
              },
            );
          },
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
