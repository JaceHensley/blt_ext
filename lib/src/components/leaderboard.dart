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

    return (Dom.div()..className = 'card')(
      (Dom.div()..className = 'card-header')(
        (Dom.div()..className = 'card-title h5')('Leaderboard')
      ),
      (Dom.div()..className = 'card-body')(
        _renderTable()
      )
    );
  }

  ReactElement _renderTable() {
    return (Dom.table()..className = 'table table-scroll')(
      Dom.thead()(
        Dom.tr()(
          Dom.th()('Position'),
          Dom.th()('Email'),
          Dom.th()('Points'),
          Dom.th()('Referrals'),
        )
      ),
      Dom.tbody()(
        props.leaderboardItems.map(_renderRow)
      )
    );
  }

  ReactElement _renderRow(LeaderboardItem item) {
    var classes = new ClassNameBuilder()
      ..add('active', item.isSelf);

    return (Dom.tr()
      ..className = classes.toClassName()
      ..key = item.position
    )(
      Dom.td()(item.position),
      Dom.td()(item.email),
      Dom.td()(item.points),
      Dom.td()(item.peopleReferred),
    );
  }
}
