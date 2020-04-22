import 'package:dominote/controller/navigation/app_navigator.dart';
import 'package:dominote/model/game.dart';
import 'package:dominote/model/player.dart';
import 'package:flutter/material.dart';

class GameViewModel extends ChangeNotifier {
  final AppNavigator _navigator;
  final Game _game;

  GameViewModel({@required AppNavigator navigator, @required Game game})
      : assert(navigator != null),
        assert(game != null),
        _navigator = navigator,
        _game = game;

  Game get game => _game;

  List<Player> get players => _game.players;
}
