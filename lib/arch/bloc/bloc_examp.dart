import 'package:flutter/material.dart';
import 'package:bpr/arch/bloc/bloc_sign_in_user.dart';
import 'package:bpr/arch/bloc/model/userlogin.dart';
import 'package:bpr/arch/bloc/repo/repository_user.dart';
import 'package:bpr/arch/bloc/widget/widget_result.dart';
import 'package:bpr/common/widget/widget_form_login.dart';

class BlocExamplePage extends StatefulWidget {
  const BlocExamplePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _BlocExamplePageState createState() => _BlocExamplePageState();
}

class _BlocExamplePageState extends State<BlocExamplePage> {
  // WARN: use proper initialization for BLOC ! This is just for demonstration
  final UserSignInBloc _userSignInBloc = UserSignInBloc(UserRepository());

  @override
  Widget build(BuildContext context) {
    // 1: provide state
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LoginFormWidget(onSignIn),
            ResultWidget(_userSignInBloc.userSigned),
          ],
        ),
      ),
    );
  }

  void onSignIn(String user, String password, BuildContext context) {
    _userSignInBloc.login.add(UserLogin(user, password));
    print("Sign-in clicked");
  }
}
