import 'package:meta/meta.dart';

import 'package:blt_ext/src/data.dart';

Data sendRequest({@required String email}) {
  return new Data(
    email: email,
  );
}
