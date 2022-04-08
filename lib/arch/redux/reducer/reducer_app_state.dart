import 'package:bpr/arch/redux/model/userlogin.dart';
import 'package:bpr/arch/redux/model/app_state.dart';
import 'package:bpr/arch/redux/reducer/reducer_login.dart';

/// combine many reducers into one
AppState appReducer(AppState state, action) {
  return AppState(
    loggedUser: loginReducer(state.loggedUser as UserLogin, action),
    // hint: other reducers go here
  );
}
