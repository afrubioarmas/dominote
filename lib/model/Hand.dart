import 'package:dominote/model/User.dart';

class Hand {
  List<User> players = List();
  int scoreTeam1;
  int scoreTeam2;
  int scoreToWin;
  int indexFirstOpenning;
  int indexCurrentOpenning;

  Hand(
      {this.players,
      this.scoreTeam1,
      this.scoreTeam2,
      this.scoreToWin,
      this.indexFirstOpenning,
      this.indexCurrentOpenning});
}
