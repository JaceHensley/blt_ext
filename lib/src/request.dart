import 'dart:convert';
import 'dart:html';

import 'package:blt_ext/src/data.dart';
import 'package:meta/meta.dart';

Data sendRequest({@required String email}) {
  var encodedEmail = Uri.encodeFull(email);
  var httpRequest = new HttpRequest();
  const baseUrl = 'https://maitreapp.co/widget_data';
  var json = {};

  httpRequest.onReadyStateChange.listen((_) {
    if (httpRequest.readyState == 4) {
      json.addAll(JSON.decode(httpRequest.responseText));
    }
  });

  httpRequest
    ..open('GET', '$baseUrl?check_status=false&name=&email=$encodedEmail&extra_field=&widget_id=MF467059b065&view_id=16390361&require_leaderboard=true&one_click_signup=false&host=https%3A%2F%2Fhellobloom.io%2F', async: false)
    ..send();

  var peopleAhead = json['people_behind'];
  var peopleBehind = json['people_ahead'];
  var referralLink = json['referral_link'];
  var leaderboardItems = <LeaderboardItem>[];

  for (var rank in json['leaderboard']['ranking']) {
    var position = rank['position'];
    var rankEmail = rank['email'];
    var points = rank['points'];
    var peopleReferred = rank['people_referred'];

    leaderboardItems.add(new LeaderboardItem(
      position: position,
      email: rankEmail,
      points: points,
      peopleReferred: peopleReferred,
      isSelf: rankEmail == email
    ));
  }

  return new Data(
    email: email,
    peopleAhead: peopleAhead,
    peopleBehind: peopleBehind,
    referralLink: referralLink,
    leaderboardItems: leaderboardItems,
  );
}
