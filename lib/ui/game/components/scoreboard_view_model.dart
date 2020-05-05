import 'package:dominote/model/game.dart';
import 'package:dominote/model/hand.dart';
import 'package:dominote/model/player.dart';
import 'package:flutter/material.dart';

class ScoreboardViewModel extends ChangeNotifier {
  Game _game;

  ScoreboardViewModel({@required Game game})
      : assert(game != null),
        _game = game;

  List<Player> get players => _game.players;

  Game get game => _game;

  int getScoreOnCoordinate(int x, int y) {
    int score;
    _game.hands.forEach((hand) {
      if (hand.containsTeamByNumber(x, y)) {
        score = hand.getTeamScoreByNumber(x, y);
        return;
      }
    });

    return score;
  }

  int getTotalScore(int playerNumber) {
    int totalScore = 0;
    for (int i = 0; i < _game.hands.length; i++) {
      Hand hand = _game.hands[i];
      int teammateIndex = hand.getTeammateNumber(playerNumber);
      if (teammateIndex != null) {
        totalScore = totalScore + getScoreOnCoordinate(playerNumber, teammateIndex);
      }
    }
    return totalScore;
  }
}
