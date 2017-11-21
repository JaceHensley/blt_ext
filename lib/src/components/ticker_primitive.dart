import 'package:over_react/over_react.dart';

@Factory()
UiFactory<TickerPrimitiveProps> TickerPrimitive;

@Props()
class TickerPrimitiveProps extends UiProps {
  DateTime currentTime;
}

@Component()
class TickerPrimitiveComponent extends UiComponent<TickerPrimitiveProps> {
  @override
  Map getDefaultProps() => (newProps()
    ..currentTime = new DateTime.now()
  );

  @override
  render() {
    var timeLeft = DateTime.parse('2017-11-30').difference(props.currentTime);

    return (Dom.div()..className = 'ticker text-center')(
      'Time till ICO: '
      '${timeLeft.inDays}:'
      '${timeLeft.inHours.remainder(Duration.HOURS_PER_DAY)}:'
      '${timeLeft.inMinutes.remainder(Duration.MINUTES_PER_HOUR)}:'
      '${timeLeft.inSeconds.remainder(Duration.SECONDS_PER_MINUTE)}'
    );
  }
}
