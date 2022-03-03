import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;

  RegistrationTextField({required this.hintText, required this.inputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.grey.shade200),
      child: TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
