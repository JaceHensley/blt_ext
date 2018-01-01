import 'package:over_react/over_react.dart';

import 'package:blt_ext/src/data.dart';

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
      _renderNewsCard(),
      _renderSocialCard(),
    );
  }

  ReactElement _renderNewsCard() {
    return _renderCard('Latest News', Dom.p()('Bloom\'s token sale has successfully ended!'));
  }

  ReactElement _renderSocialCard() {
    return _renderCard('Follow Bloom Online', _renderSocialContent());
  }

  ReactElement _renderSocialContent() {
    return (Dom.div()..className = 'columns')(
      (Dom.div()..className = 'column col-2 col-ml-auto text-center')(
        (Dom.a()
          ..href = 'https://hellobloom.io'
          ..target = '_blank'
          ..rel = 'noopener noreferrer'
          ..title = 'Homepage'
        )(
          (Dom.i()..className = 'fas fa-home fa-2x')(),
        ),
      ),
      (Dom.div()..className = 'column col-2 text-center')(
        (Dom.a()
          ..href = 'https://slack.hellobloom.io'
          ..target = '_blank'
          ..rel = 'noopener noreferrer'
          ..title = 'Slack'
        )(
          (Dom.i()..className = 'fab fa-slack-hash fa-2x')(),
        ),
      ),
      (Dom.div()..className = 'column col-2 text-center')(
        (Dom.a()
          ..href = 'https://www.reddit.com/BloomToken'
          ..target = '_blank'
          ..rel = 'noopener noreferrer'
          ..title = 'Reddit'
        )(
          (Dom.i()..className = 'fab fa-reddit-alien fa-2x')(),
        ),
      ),
      (Dom.div()..className = 'column col-2 text-center')(
        (Dom.a()
          ..href = 'https://twitter.com/bloomtoken'
          ..target = '_blank'
          ..rel = 'noopener noreferrer'
          ..title = 'Twitter'
        )(
          (Dom.i()..className = 'fab fa-twitter fa-2x')(),
        ),
      ),
      (Dom.div()..className = 'column col-2 col-mr-auto text-center')(
        (Dom.a()
          ..href = 'https://blog.hellobloom.io'
          ..target = '_blank'
          ..rel = 'noopener noreferrer'
          ..title = 'Blog'
        )(
          (Dom.i()..className = 'fab fa-medium-m fa-2x')(),
        ),
      ),
    );
  }

  ReactElement _renderCard(String title, dynamic content) {
    return (Dom.div()..className = 'card')(
      (Dom.div()..className = 'card-header')(
        (Dom.div()..className = 'card-title h5')(title)
      ),
      (Dom.div()..className = 'card-body')(
        content
      ),
    );
  }
}
