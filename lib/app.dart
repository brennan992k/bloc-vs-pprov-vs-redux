import 'package:flutter/material.dart';
import 'package:bpr/arch/provider/provider_examp.dart';
import 'package:bpr/arch/bloc/bloc_examp.dart';
import 'package:bpr/arch/redux/page/page_redux.dart';
import 'package:bpr/arch/redux/middleware/store_login_middleware.dart';
import 'package:bpr/arch/redux/model/app_state.dart';
import 'package:bpr/arch/redux/reducer/reducer_app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

///
/// Uncomment
/// a) 'ProviderExamplePage'
/// b) 'BlocExamplePage'
/// c) 'ReduxExamplePage'
///
/// to showcase specific architecture example
///
class ArchApp extends StatelessWidget {
  // 'store' is used ONLY in REDUX sample
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.noLoggedUser(),
    middleware: createStoreLoginMiddleware(),
  );

  ArchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Architecture Comparison Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:
            // const ProviderExamplePage(
            //     title: 'Provider: Architecture Comparison Demo'),
            const BlocExamplePage(title: 'Bloc: Architecture Comparison Demo'),
        //ReduxExamplePage(title: 'Redux: Architecture Comparison Demo'),
      ),
    );
  }
}
