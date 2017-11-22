import 'package:over_react/over_react.dart';

import 'package:blt_ext/src/data.dart';

import '../leaderboard.dart';

@Factory()
UiFactory<LoggedInProps> LoggedIn;

@Props()
class LoggedInProps extends UiProps {
  Data data;
}

@Component()
class LoggedInComponent extends UiComponent<LoggedInProps> {
  @override
  render() {
    return (Dom.div()..className = 'view--logged-in')(
      _renderStats(),
      (Leaderboard()
        ..leaderboardItems = props.data.leaderboardItems
      )()
    );
  }

  ReactElement _renderStats() {
    var rewardMessage = 'Your current prize is:';

    if (props.data.peopleBehind == 0) {
      rewardMessage = '$rewardMessage \$5,000 in BLT. ...I\'m speechless...';
    } else if (props.data.peopleBehind == 1) {
      rewardMessage = '$rewardMessage \$3,000 in BLT. If you\'re not first, you\'re last! JK, really amazing work!!!';
    } else if (props.data.peopleBehind == 2) {
      rewardMessage = '$rewardMessage \$2,000 in BLT. OMG!!!';
    } else if (props.data.peopleBehind == 3) {
      rewardMessage = '$rewardMessage \$1,000 in BLT. Incredible!';
    } else if (props.data.peopleBehind == 4) {
      rewardMessage = '$rewardMessage \$500 in BLT. WOOOW!';
    } else if (props.data.peopleBehind <= 25) {
      rewardMessage = '$rewardMessage Early Access to BloomCard. Working hard!';
    } else if (props.data.peopleBehind <= 50) {
      rewardMessage = '$rewardMessage Bloom T-Shirt. Lucky lucky!';
    } else if (props.data.peopleBehind <= 249) {
      rewardMessage = '$rewardMessage Chance to win \$2,500 in BLT. Congrats!';
    } else if (props.data.peopleBehind <= 2499) {
      rewardMessage = '$rewardMessage Chance to win \$1,000 in BLT. Awesome!';
    } else {
      rewardMessage = 'Looks like you haven\'t contributed enough, yet. Keep going!';
    }

    return (Dom.div()..className = 'card')(
      (Dom.div()..className = 'card-header')(
        (Dom.div()..className = 'card-title h5')('Current Ranking')
      ),
      (Dom.div()..className = 'card-body')(
        Dom.p()(
          'There are ',
          (Dom.strong()..className = 'text-success')(props.data.peopleBehind),
          ' people ahead of you. And ',
          (Dom.strong()..className = 'text-warning')(props.data.peopleAhead),
          ' people behind you.'
        ),
        Dom.p()(
          rewardMessage
        ),
      )
    );
  }
}
