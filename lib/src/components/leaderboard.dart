import 'package:over_react/over_react.dart';

import 'package:blt_ext/src/data.dart';

@Factory()
UiFactory<LeaderboardProps> Leaderboard;

@Props()
class LeaderboardProps extends UiProps {
  List<LeaderboardItem> leaderboardItems;
}

@Component()
class LeaderboardComponent extends UiComponent<LeaderboardProps> {
  @override
  Map getDefaultProps() => (newProps()
    ..leaderboardItems = const []
  );

  @override
  render() {
    if (props.leaderboardItems.isEmpty) return false;

    var children = []
      ..add((Dom.h3()..className = 'text-center')('Leaderboard'))
      ..add(_renderHeader())
      ..addAll(props.leaderboardItems.map(_renderRow));

    return Dom.div()(
      children
    );
  }
  ReactElement _renderHeader() {
    return (Dom.div()
      ..className = 'columns'
      ..key = 'header'
    )(
      (Dom.div()..className = 'column col-3')(
        'Position'
      ),
      (Dom.div()..className = 'column col-6')(
        'Email'
      ),
      (Dom.div()..className = 'column col-3')(
        'Points'
      ),
    );
  }

  ReactElement _renderRow(LeaderboardItem item) {
    var classes = new ClassNameBuilder()
      ..add('columns')
      ..add('highlight', item.isSelf);

    return (Dom.div()
      ..className = classes.toClassName()
      ..key = item.position
    )(
      (Dom.div()..className = 'column col-3')(
        item.position
      ),
      (Dom.div()..className = 'column col-6 clip-text')(
        item.email
      ),
      (Dom.div()..className = 'column col-3')(
        item.points
      ),
    );
  }
}
