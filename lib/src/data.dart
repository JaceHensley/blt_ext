class Data {
  final String email;
  final int peopleAhead;
  final int peopleBehind;
  final String referralLink;
  final List<LeaderboardItem> leaderboardItems;

  Data({this.email, this.peopleAhead, this.peopleBehind, this.referralLink, this.leaderboardItems});
}

class LeaderboardItem {
  final int position;
  final String email;
  final int points;
  final bool isSelf;

  LeaderboardItem({this.position, this.email, this.points, this.isSelf});
}
