import 'dart:html';

import 'package:over_react/over_react.dart';

import 'package:blt_ext/src/data.dart';

import 'chrome/storage.dart';
import 'components/leaderboard.dart';
import 'components/ticker.dart';
import 'request.dart';

@Factory()
UiFactory<AppProps> App;

@Props()
class AppProps extends UiProps {

}

@State()
class AppState extends UiState {
  LoginState loginState;

  Data data;
}

@Component()
class AppComponent extends UiStatefulComponent<AppProps, AppState> {
  InputElement _emailInputRef;

  @override
  Map getInitialState() => (newState()
    ..loginState = LoginState.loading
  );

  @override
  void componentWillMount() {
    super.componentWillMount();

    getEmail().then((email) {
      if (email.isEmpty) {
        setState(newState()..loginState = LoginState.needsEmail);
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
        view = _renderNeedsEmailView();
        break;
      case LoginState.loggedIn:
        view = _renderLoggedInView();
        break;
    }

    return (Dom.div()..className = 'app')(view);
  }

  ReactElement _renderLoadingView() {
    return (Dom.div()..className = 'loading loading-lg')();
  }

  ReactElement _renderNeedsEmailView() {
    return Dom.div()(
      Dom.h3()(
        'Please enter the email you used to register for the whitelist'
      ),
      (Dom.form()
        ..className = 'form-group'
        ..onSubmit = _handleSubmitEmail
      )(
        (Dom.div()..className = 'input-group')(
          (Dom.label()
            ..htmlFor = 'emailinput'
            ..className = 'text-assistive form-label'
          )('Email'),
          (Dom.input()
            ..id = 'emailinput'
            ..type = 'email'
            ..className = 'form-input'
            ..placeholder = 'johndoe@gmail.com'
            ..ref = (ref) { _emailInputRef = ref; }
          )(),
          (Dom.button()
            ..className = 'btn btn-primary input-group-btn'
          )('Submit'),
        ),
      )
    );
  }

  ReactElement _renderLoggedInView() {
    return Dom.div()(
      _renderStats(),
      _renderDivider(),
      (Leaderboard()
        ..leaderboardItems = state.data.leaderboardItems
      )(),
      Ticker()(),
    );
  }

  ReactElement _renderStats() {
    return (Dom.div()..className = 'text-center')(
      (Dom.div()..className = 'text-large text-success')(state.data.peopleBehind),
      Dom.div()('People in front of you'),
      Dom.div()(state.data.peopleAhead),
      Dom.div()('People behind you'),
    );
  }

  ReactElement _renderDivider() {
    return (Dom.div()
      ..className = 'divider'
    )();
  }

  void _handleSubmitEmail(e) {
    e.preventDefault();
    setEmail(_emailInputRef.value).then((_) {
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
