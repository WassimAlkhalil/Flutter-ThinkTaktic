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
    var deviceWidth = MediaQuery.of(context).size.width;
    var fontSize = deviceWidth * 0.05;

    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
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
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}
