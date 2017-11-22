import 'dart:html';

import 'package:over_react/over_react.dart';

import 'package:blt_ext/src/data.dart';

import 'chrome/storage.dart';
import 'components/ticker.dart';
import 'components/views/logged_in.dart';
import 'components/views/needs_email.dart';
import 'request.dart';

@Factory()
UiFactory<AppProps> App;

@Props()
class AppProps extends UiProps {}

@State()
class AppState extends UiState {
  LoginState loginState;

  Data data;
}

@Component()
class AppComponent extends UiStatefulComponent<AppProps, AppState> {
  @override
  Map getInitialState() => (newState()
    ..loginState = LoginState.loading
  );

  @override
  void componentWillMount() {
    super.componentWillMount();

    getEmail().then((email) {
      if (email.isEmpty) {
        // setState(newState()..loginState = LoginState.needsEmail);
      } else {

        setState(newState()
          ..loginState = LoginState.loggedIn
          ..data = sendRequest(email: email)
        );
      }
    });
  }

  @override
  void componentWillUpdate(Map nextProps, Map nextState) {
    var tNextState = typedStateFactory(nextState);

    if (state.loginState != LoginState.loggingIn && tNextState.loginState == LoginState.loggingIn) {
      getEmail().then((email) {
        setState(newState()..data = sendRequest(email: email), () {
          setState(newState()..loginState = LoginState.loggedIn);
        });
      });
    }
  }

  @override
  render() {
    var view;

    switch (state.loginState) {
      case LoginState.loggingIn:
      case LoginState.loading:
        view = _renderLoadingView();
        break;
      case LoginState.needsEmail:
        view = (NeedsEmail()..onEmailSubmit = _handleEmailSubmit)();
        break;
      case LoginState.loggedIn:
        view = (LoggedIn()..data = state.data)();
        break;
    }

    return (Dom.div()..className = 'app')(
      view,
      Ticker()(),
    );
  }

  ReactElement _renderLoadingView() {
    return (Dom.div()..className = 'loading loading-lg')();
  }

  void _handleEmailSubmit(String value) {
    setEmail(value).then((_) {
      setState(newState()
        ..loginState = LoginState.loggingIn
      );
    });

    setState(newState()
      ..loginState = LoginState.loading
    );
  }
}

enum LoginState {
  loading,
  needsEmail,
  loggedIn,
  loggingIn,
}
