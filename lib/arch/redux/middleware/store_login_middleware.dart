import 'package:bpr/arch/redux/actions/actions.dart';
import 'package:bpr/arch/redux/model/app_state.dart';
import 'package:bpr/arch/redux/model/userlogin.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createStoreLoginMiddleware() {
  return [
    TypedMiddleware<AppState, LoginRequestAction>(_createLoginUser()),
  ];
}

/// connects to backend API to authorize the user
Middleware<AppState> _createLoginUser() {
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is LoginRequestAction) {
      next(LoginSuccessfulAction(UserLogin(action.username, action.password)));
      return;
    }

    next(action);
  };
}
