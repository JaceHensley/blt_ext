import 'package:over_react/over_react.dart';

@Factory()
UiFactory<EmailProps> Email;

@Props()
class EmailProps extends UiProps {

}

@Component()
class EmailComponent extends UiComponent<EmailProps> {
  @override
  Map getDefaultProps() => (newProps());

  @override
  render() { }
}
