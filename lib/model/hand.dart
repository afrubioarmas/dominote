import 'dart:math';

import 'package:dominote/model/player.dart';

class Hand {
  List<Player> players;
  List<int> matchesTeam1;
  List<int> matchesTeam2;
  int scoreToWin;
  int indexFirstOpening;
  int indexCurrentOpening;

  Hand(
      {this.players,
      this.matchesTeam1,
      this.matchesTeam2,
      this.scoreToWin,
      this.indexFirstOpening,
      this.indexCurrentOpening});

  Hand.fromPlayers(List<Player> players, int scoreToWin) {
    this.players = players;
    this.scoreToWin = scoreToWin;
    this.matchesTeam1 = [];
    this.matchesTeam2 = [];
    this.indexFirstOpening = null;
    this.indexCurrentOpening = null;
  }

  Hand.fromPlayersRandom(List<Player> players, int scoreToWin) {
    this.players = players;
    this.scoreToWin = scoreToWin;
    this.indexFirstOpening = null;
    this.indexCurrentOpening = null;

    this.matchesTeam1 = _buildRandomMatches();
    this.matchesTeam2 = _buildRandomMatches();
  }

  List<int> _buildRandomMatches() {
    List<int> output = List<int>();
    for (int i = 0; i < Random().nextInt(10); i++) {
      output.add(Random().nextInt(50));
    }
    return output;
  }
}
