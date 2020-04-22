import 'package:dominote/model/match.dart';
import 'package:dominote/model/player.dart';

class Hand {
  List<Player> players;
  List<Match> matches;
  int scoreToWin;
  int indexFirstOpening;
  int indexCurrentOpening;

  Hand({this.players, this.matches, this.scoreToWin, this.indexFirstOpening, this.indexCurrentOpening});

  Hand.fromPlayers(List<Player> players, int scoreToWin) {
    this.players = players;
    this.matches = List<Match>();
    this.scoreToWin = scoreToWin;
    this.indexFirstOpening = null;
    this.indexCurrentOpening = null;
  }

  Hand.fromPlayersRandom(List<Player> players, int scoreToWin) {
    this.players = players;
    this.matches = List<Match>();
    this.scoreToWin = scoreToWin;
    this.indexFirstOpening = null;
    this.indexCurrentOpening = null;

    this.matches = _buildRandomMatches();
  }

  List<Match> _buildRandomMatches() {
    List<Match> output = List<Match>();
    for (int i = 0; i < 10; i++) {
      output.add(Match.random());
    }
    return output;
  }
}
