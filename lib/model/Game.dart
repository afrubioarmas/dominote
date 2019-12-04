import 'package:dominote/model/Hand.dart';

import 'Player.dart';

class Game {
  List<Hand> hands = List();
  List<Player> players = List();

  Game(List<Player> players) {
    this.players = players;
  }
}
