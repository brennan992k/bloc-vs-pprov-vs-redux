import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final void Function() onSingInClickListener;

  const SignInButton(this.onSingInClickListener);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSingInClickListener,
      child: Container(
        width: 320.0,
        height: 60.0,
        alignment: FractionalOffset.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(247, 64, 106, 1.0),
          borderRadius: BorderRadius.all(const Radius.circular(30.0)),
        ),
        child: const Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
