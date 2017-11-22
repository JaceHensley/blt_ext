import 'dart:html';
import 'package:over_react/over_react.dart';

@Factory()
UiFactory<NeedsEmailProps> NeedsEmail;

@Props()
class NeedsEmailProps extends UiProps {
  _EmailSubmitCallback onEmailSubmit;
}

@Component()
class NeedsEmailComponent extends UiComponent<NeedsEmailProps> {
  InputElement _emailInputRef;

  @override
  render() {
    return (Dom.div()..className = 'view--needs-email empty')(
      (Dom.div()..className = 'empty-icon')(
        (Dom.i()..className = 'icon icon-3x icon-mail')()
      ),
      (Dom.p()..className = 'empty-title h5')(
        'You are not logged in'
      ),
      (Dom.p()..className = 'empty-subtitle')(
        'Please enter the email used to register for the whitelist.'
      ),
      (Dom.div()..className = 'empty-action')(
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
        ),
      )
    );
  }

  void _handleSubmitEmail(e) {
    e.preventDefault();
    props.onEmailSubmit(_emailInputRef.value);
  }
}

typedef _EmailSubmitCallback(String value);
