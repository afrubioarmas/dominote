import 'package:dominote/model/Player.dart';

class Hand {
  List<Player> players = List();
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
