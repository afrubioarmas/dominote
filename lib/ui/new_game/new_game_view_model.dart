import 'package:dominote/controller/navigation/app_navigator.dart';
import 'package:dominote/model/Game.dart';
import 'package:dominote/model/Player.dart';
import 'package:flutter/material.dart';

class NewGameViewModel extends ChangeNotifier {
  final AppNavigator _navigator;

  NewGameViewModel({
    @required AppNavigator navigator,
  })  : assert(navigator != null),
        _navigator = navigator;

  final List<Player> _players = List<Player>();
  final TextEditingController nameTextController = TextEditingController();

  List<Player> get players => _players;

  void onViewStarted() {
    _players.add(Player("Andres"));
    _players.add(Player("Oscar"));
    _players.add(Player("Dani"));
    _players.add(Player("Felo"));
  }

  void onStartGame() {
    _navigator.navigateToGame(Game(_players));
  }

  void onPlayerSubmit() {
    _players.add(Player(nameTextController.text));
  }

  void onPlayerDelete(int index) {
    _players.removeAt(index);
  }

  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
  }
}
