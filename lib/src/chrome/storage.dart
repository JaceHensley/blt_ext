import 'dart:async';

import 'package:chrome/chrome_ext.dart' as chrome;

Future<Null> setEmail(String email) async {
  await chrome.storage.sync.set({'email': email});
}

Future<String> getEmail() async {
  var data = await chrome.storage.sync.get('email');
  if (data == null || data['email'] == null) return '';

  return data['email'];
}
