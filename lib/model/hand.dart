import 'dart:math';

import 'package:dominote/model/player.dart';

enum Team { team1, team2 }

class Hand {
  List<Player> players;
  List<int> matchesTeam1;
  List<int> matchesTeam2;
  int scoreToWin;
  int indexFirstOpening;

  Hand(
      {this.players,
      this.matchesTeam1,
      this.matchesTeam2,
      this.scoreToWin,
      this.indexFirstOpening});

  Hand.fromPlayers(List<Player> players, int scoreToWin) {
    this.players = players;
    this.scoreToWin = scoreToWin;
    this.matchesTeam1 = [];
    this.matchesTeam2 = [];
    this.indexFirstOpening = null;
  }

  Hand.fromPlayersRandom(List<Player> players, int scoreToWin) {
    this.players = players;
    this.scoreToWin = scoreToWin;
    this.indexFirstOpening = null;

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

  bool containsTeamByNumber(int x, int y) {
    return _containTeamOnByNumberTeam1(x, y) || _containTeamOnByNumberTeam2(x, y);
  }

  bool _containTeamOnByNumberTeam1(int x, int y) {
    return (players[0].number == x && players[1].number == y) ||
        (players[0].number == y && players[1].number == x);
  }

  bool _containTeamOnByNumberTeam2(int x, int y) {
    return (players[2].number == x && players[3].number == y) ||
        (players[2].number == y && players[3].number == x);
  }

  int getTeamScoreByNumber(int x, int y) {
    if (_containTeamOnByNumberTeam1(x, y)) {
      return getTeamScoreByTeam(Team.team1);
    } else if (_containTeamOnByNumberTeam2(x, y)) {
      return getTeamScoreByTeam(Team.team2);
    }
    return 0;
  }

  void addMatch(int score, Team team) {
    if (team == Team.team1) {
      matchesTeam1.add(score);
    } else {
      matchesTeam2.add(score);
    }
  }

  int getCurrentOpening() {
    int amountOfMatches = matchesTeam1.length + matchesTeam2.length;
    return indexFirstOpening + (amountOfMatches % 4);
  }

  int getTeamScoreByTeam(Team team) {
    int score = 0;
    List<int> toCalculate = List<int>();
    if (team == Team.team1) {
      toCalculate = matchesTeam1;
    } else {
      toCalculate = matchesTeam2;
    }
    toCalculate.forEach((match) {
      score = match + score;
    });
    return score;
  }

  bool handFinished() {
    return !(getTeamScoreByTeam(Team.team1) >= scoreToWin ||
        getTeamScoreByTeam(Team.team2) >= scoreToWin);
  }

  int getTeammateNumber(int x) {
    for (int i = 0; i < players.length; i++) {
      if (containsTeamByNumber(x, players[i].number)) {
        return players[i].number;
      }
    }
    return null;
  }
}
