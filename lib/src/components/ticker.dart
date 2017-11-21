import 'dart:async';
import 'package:over_react/over_react.dart';

import 'ticker_primitive.dart';

@Factory()
UiFactory<TickerProps> Ticker;

@Props()
class TickerProps extends UiProps {

}

@State()
class TickerState extends UiState {
 DateTime currentTime;
}

@Component()
class TickerComponent extends UiStatefulComponent<TickerProps, TickerState> {
  Timer _timer;

  @override
  Map getDefaultProps() => (newProps());

  @override
  Map getInitialState() => (newState()
    ..currentTime = new DateTime.now()
  );

  @override
  void componentWillMount() {
    super.componentWillMount();

    _timer = new Timer.periodic(const Duration(seconds: 1), (_) {
      setState(newState()..currentTime = new DateTime.now());
    });
  }

  @override
  void componentWillUnmount() {
    super.componentWillUnmount();

    _timer.cancel();
    _timer = null;
  }

  @override
  render() {
    return (TickerPrimitive()
      ..currentTime = state.currentTime
    )();
  }
}
