import 'package:flutter/material.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  final TextEditingController controller;

  const InputFieldArea(
      {required this.hint,
      required this.obscure,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return (Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.deepPurpleAccent,
          ),
        ),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.purple,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.purple,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.purple, fontSize: 15.0),
          contentPadding: const EdgeInsets.only(
              top: 30.0, right: 30.0, bottom: 30.0, left: 5.0),
        ),
      ),
    ));
  }
}
