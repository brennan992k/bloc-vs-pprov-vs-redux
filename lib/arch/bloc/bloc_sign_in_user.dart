import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:bpr/arch/bloc/model/userlogin.dart';
import 'package:bpr/arch/bloc/model/usersession.dart';
import 'package:bpr/arch/bloc/repo/repository_user.dart';

///Bloc handling Sign In procedure
class UserSignInBloc {
  final UserRepository repo;

  ///Sink used to pass login request
  final _userCredentialsStream = BehaviorSubject<UserLogin>();
  late Stream<UserAuthenticationState> userSigned;

  Sink<UserLogin> get login => _userCredentialsStream.sink;

  UserSignInBloc(
    this.repo,
  ) {
    ///userSigned contains results from both login and registration process.
    ///It's instance of broadcastStream to allow multiple listeners attached to it.
    userSigned = _userCredentialsStream.stream.switchMap(_signIn);

    StreamSubscription<UserLogin> sub = _userCredentialsStream.listen((value) {
      print(value);
    });
  }

  void dispose() {
    _userCredentialsStream.close();
  }

  Stream<UserAuthenticationState> _signIn(UserLogin userLogin) async* {
    yield UserAuthenticationLoading();
    try {
      final userSession = await repo.signIn(userLogin);
      yield userSession;
    } catch (e) {
      yield UserUnauthenticated(exception: e as Exception);
    }
  }
}

class TestCustomStreamBuilder<T> extends StatefulWidget {
  const TestCustomStreamBuilder(
      {Key? key, required this.stream, required this.builder})
      : super(key: key);
  final Stream<T> stream;
  final Widget Function(T?) builder;

  @override
  State<TestCustomStreamBuilder<T>> createState() =>
      _TestCustomStreamBuilderState<T>();
}

class _TestCustomStreamBuilderState<T>
    extends State<TestCustomStreamBuilder<T>> {
  late final StreamSubscription<dynamic> sub;
  T? value;

  @override
  void initState() {
    super.initState();
    sub = widget.stream.listen((event) {
      setState(() {
        value = event;
      });
    });
  }

  @override
  void dispose() {
    sub.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(value);
  }
}
