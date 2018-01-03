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
          ..className = 'd-inline-block'
          ..title = 'Homepage'
        )(
          _renderBloomLogoSvg()
        ),
      ),
      (Dom.div()..className = 'column col-2 text-center')(
        (Dom.a()
          ..href = 'https://slack.hellobloom.io'
          ..target = '_blank'
          ..rel = 'noopener noreferrer'
          ..className = 'd-inline-block'
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
          ..className = 'd-inline-block'
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
          ..className = 'd-inline-block'
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
          ..className = 'd-inline-block'
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

  ReactElement _renderBloomLogoSvg() {
    return (Dom.svg()
      ..viewBox = '0 0 710 705'
      ..className = 'fa-2x fa-w-14 svg-inline--fa'
      ..addProp('xmlns', 'http://www.w3.org/2000/svg')
    )(
      Dom.svgTitle()('Bloom Logo'),
      (Dom.g()
        ..stroke = 'none'
        ..strokeWidth = '1'
        ..fill = 'none'
        ..addProp('fill-rule', 'evenodd')
      )(
        (Dom.g()
          ..id = 'Logo'
          ..fill = '#6067F1'
        )(
          (Dom.g()
            ..id = 'Leaf'
            ..transform = 'translate(260.000000, -27.000000)'
          )(
            (Dom.path()
              ..d = 'M194.415739,215.192523 C194.258317,268.684765 150.797287,312 97.2080838,312 C43.6188804,312 0.157850908,268.684765 0.000429008653,215.192523 C2.08166817e-14,215.192523 -3.50299401,197.114019 15.1796407,156.874766 C47.118659,88.0834938 95.9422811,58.317757 95.9422811,58.317757 C95.9422811,58.317757 148.877246,91.5588785 180.404192,156.874766 C196.94399,191.141061 194.416168,215.192523 194.416168,215.192523 Z'
            )()
          ),
          (Dom.g()
            ..id = 'Leaf'
            ..transform = 'translate(357.500000, 576.000000) scale(1, -1) translate(-357.500000, -576.000000) translate(260.000000, 420.000000)'
          )(
            (Dom.path()
              ..d = 'M194.415739,215.192523 C194.258317,268.684765 150.797287,312 97.2080838,312 C43.6188804,312 0.157850908,268.684765 0.000429008653,215.192523 C2.08166817e-14,215.192523 -3.50299401,197.114019 15.1796407,156.874766 C47.118659,88.0834938 95.9422811,58.317757 95.9422811,58.317757 C95.9422811,58.317757 148.877246,91.5588785 180.404192,156.874766 C196.94399,191.141061 194.416168,215.192523 194.416168,215.192523 Z'
            )()
          ),
          (Dom.g()
            ..id = 'Leaf'
            ..transform = 'translate(563.000000, 352.500000) scale(1, -1) rotate(90.000000) translate(-563.000000, -352.500000) translate(465.500000, 196.500000)'
          )(
            (Dom.path()
              ..d = 'M194.415739,215.192523 C194.258317,268.684765 150.797287,312 97.2080838,312 C43.6188804,312 0.157850908,268.684765 0.000429008653,215.192523 C2.08166817e-14,215.192523 -3.50299401,197.114019 15.1796407,156.874766 C47.118659,88.0834938 95.9422811,58.317757 95.9422811,58.317757 C95.9422811,58.317757 148.877246,91.5588785 180.404192,156.874766 C196.94399,191.141061 194.416168,215.192523 194.416168,215.192523 Z'
            )()
          ),
          (Dom.g()
            ..id = 'Leaf'
            ..transform = 'translate(147.000000, 351.500000) scale(-1, -1) rotate(90.000000) translate(-147.000000, -351.500000) translate(49.500000, 195.500000)'
          )(
            (Dom.path()
              ..d = 'M194.415739,215.192523 C194.258317,268.684765 150.797287,312 97.2080838,312 C43.6188804,312 0.157850908,268.684765 0.000429008653,215.192523 C2.08166817e-14,215.192523 -3.50299401,197.114019 15.1796407,156.874766 C47.118659,88.0834938 95.9422811,58.317757 95.9422811,58.317757 C95.9422811,58.317757 148.877246,91.5588785 180.404192,156.874766 C196.94399,191.141061 194.416168,215.192523 194.416168,215.192523 Z'
            )()
          ),
        )
      ),
    );
  }
}
