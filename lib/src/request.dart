import 'dart:convert';
import 'dart:html';

import 'package:blt_ext/src/data.dart';
import 'package:meta/meta.dart';

Data sendRequest({@required String email}) {
  var encodedEmail = Uri.encodeFull(email);
  var rankingRequest = new HttpRequest();
  var remainingTokensRequest = new HttpRequest();
  const baseRankingUrl = 'https://maitreapp.co/widget_data';
  const remainingTokensURL = 'https://api.etherscan.io/api?module=account&action=tokenbalance&contractaddress=0x107c4504cd79c5d2696ea0030a8dd4e92601b82e&address=0xb547cc51ce58293e6945ba08d664ce051563d9ac&tag=latest&apikey=WER66U87EXYZ3R5XER57XM8QYNEFKWIRTQ';
  var rankingData = {};
  var tokenData = {};

  rankingRequest.onReadyStateChange.listen((_) {
    if (rankingRequest.readyState == 4) {
      rankingData.addAll(JSON.decode(rankingRequest.responseText));
    }
  });

  remainingTokensRequest.onReadyStateChange.listen((_) {
    if (remainingTokensRequest.readyState == 4) {
      tokenData.addAll(JSON.decode(remainingTokensRequest.responseText));
    }
  });

  rankingRequest
    ..open('GET', '$baseRankingUrl?check_status=false&name=&email=$encodedEmail&extra_field=&widget_id=MF467059b065&view_id=16390361&require_leaderboard=true&one_click_signup=false&host=https%3A%2F%2Fhellobloom.io%2F', async: false)
    ..send();

  remainingTokensRequest
    ..open('GET', remainingTokensURL, async: false)
    ..send();

  var peopleAhead = rankingData['people_behind'];
  var peopleBehind = rankingData['people_ahead'];
  var referralLink = rankingData['referral_link'];
  var leaderboardItems = <LeaderboardItem>[];

  // For some reason the token count comes back many orders of magnitudes off
  var remainingTokens = ((int.parse(tokenData['result'])) / 1000000000000000000).toString().replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  var decimalIndex = remainingTokens.indexOf('.');

  // Pull of the decimals as no one cares about fractions of BLT
  remainingTokens = remainingTokens.substring(0, decimalIndex);

  print(remainingTokens);

  for (var rank in rankingData['leaderboard']['ranking']) {
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
    remainingTokens: remainingTokens
  );
}
