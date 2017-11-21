import 'dart:async';
import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart' as react_dom;

import 'package:blt_ext/blt_ext.dart';

Future<Null> main() async {
  setClientConfiguration();

  react_dom.render((App())(), querySelector('#entry-point'));
}
