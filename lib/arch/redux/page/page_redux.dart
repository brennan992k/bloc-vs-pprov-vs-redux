import 'package:flutter/material.dart';
import 'package:bpr/arch/redux/actions/actions.dart';
import 'package:bpr/arch/redux/model/app_state.dart';
import 'package:bpr/arch/redux/widget/widget_result.dart';
import 'package:bpr/common/widget/widget_form_login.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ReduxExamplePage extends StatefulWidget {
  const ReduxExamplePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ReduxExamplePageState createState() => _ReduxExamplePageState();
}

class _ReduxExamplePageState extends State<ReduxExamplePage> {
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
            ResultWidget(),
          ],
        ),
      ),
    );
  }

  void onSignIn(String user, String password, BuildContext context) {
    setState(() {
      StoreProvider.of<AppState>(context)
          .dispatch(LoginRequestAction(user, password));
    });
  }
}
