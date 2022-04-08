import 'package:flutter/material.dart';
import 'package:flutter_arch/common/widget/widget_inputform.dart';

class FormContainer extends StatelessWidget {
  final TextEditingController userTxtController;
  final TextEditingController passTxtController;

  FormContainer(this.userTxtController, this.passTxtController);

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InputFieldArea(
                  hint: "Username",
                  obscure: false,
                  icon: Icons.person_outline,
                  controller: userTxtController),
              InputFieldArea(
                  hint: "Password",
                  obscure: true,
                  icon: Icons.lock_outline,
                  controller: passTxtController),
            ],
          )),
        ],
      ),
    ));
  }
}
