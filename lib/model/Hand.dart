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

  Hand.fromPlayers(List<Player> players, int scoreToWin){
    this.players = players;
    this.scoreTeam1 = 0;
    this.scoreTeam2 = 0;
    this.scoreToWin = scoreToWin;
    this.indexFirstOpenning = null;
    this.indexCurrentOpenning = null;
  }
}
