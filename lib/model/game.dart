import 'package:dominote/model/hand.dart';

import 'player.dart';

class Game {
  List<Hand> hands = List();
  List<Player> players = List();

  Game(List<Player> players) {
    this.players = players;

    switch (players.length) {
      case 4:
        createHandsFor4();
        break;
      case 5:
        createHandsFor5();
        break;
      default:
    }
  }

  createHandsFor4() {
    var combinations = [
      [0, 1, 2, 3],
      [0, 2, 1, 3],
      [0, 3, 1, 2]
    ];
    for (int i = 0; i < combinations.length; i++) {
      List<Player> playersAux = List<Player>();
      for (int j = 0; j < combinations[i].length; j++) {
        playersAux.add(players[combinations[i][j]]);
      }
      hands.add(Hand.fromPlayers(playersAux, 100));
    }
  }

  createHandsFor5() {
    var combinations = [
      [0, 1, 2, 4],
      [0, 2, 3, 4],
      [0, 3, 1, 2],
      [0, 4, 1, 3],
      [1, 4, 2, 3]
    ];
    for (int i = 0; i < combinations.length; i++) {
      List<Player> playersAux = List<Player>();
      for (int j = 0; j < combinations[i].length; j++) {
        playersAux.add(players[combinations[i][j]]);
      }
      hands.add(Hand.fromPlayers(playersAux, 100));
    }
  }
}
