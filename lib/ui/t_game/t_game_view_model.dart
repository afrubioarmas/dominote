import 'package:dominote/controller/navigation/game_navigator/game_navigator.dart';
import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/game/game_view_model.dart';
import 'package:flutter/material.dart';

class TGameViewModel extends ChangeNotifier {
  final GameNavigator _navigator;
  final Hand _hand;
  final GameViewModel _gameViewModel;

  TGameViewModel({@required GameNavigator navigator, @required GameViewModel gameViewModel, @required Hand hand})
      : assert(navigator != null),
        assert(hand != null),
        assert(gameViewModel != null),
        _navigator = navigator,
        _hand = hand,
        _gameViewModel = gameViewModel;

  Hand get hand => _hand;

  void onTap() {
    _navigator.navigateToGamePlay(_hand);
  }
}
