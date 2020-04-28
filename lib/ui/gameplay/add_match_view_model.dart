import 'package:dominote/model/hand.dart';
import 'package:dominote/model/player.dart';
import 'package:dominote/ui/game/game_view_model.dart';
import 'package:flutter/material.dart';

class AddMatchViewModel extends ChangeNotifier {
  final Hand _hand;
  final GameViewModel _gameViewModel;

  AddMatchViewModel({@required GameViewModel gameViewModel, @required Hand hand})
      : assert(hand != null),
        assert(gameViewModel != null),
        _hand = hand,
        _gameViewModel = gameViewModel;

  Hand get hand => _hand;

  List<Player> get players => _hand.players;

  TextEditingController controller = TextEditingController();

  String _radioValue;

  String get radioValue => _radioValue;

  set radioValue(String value) {
    _radioValue = value;
    notifyListeners();
  }

  void addScore() {
    if (_radioValue == "one") {
      _hand.matchesTeam1.add(int.parse(controller.text));
    } else {
      _hand.matchesTeam2.add(int.parse(controller.text));
    }

    _gameViewModel.notifyListeners();
  }
}
