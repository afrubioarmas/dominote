import 'package:dominote/model/game.dart';
import 'package:dominote/model/player.dart';
import 'package:flutter/material.dart';

class GameViewModel extends ChangeNotifier {
  final Game _game;

  GameViewModel({@required Game game})
      : assert(game != null),
        _game = game;

  Game get game => _game;

  List<Player> get players => _game.players;
}
