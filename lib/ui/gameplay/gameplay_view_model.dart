import 'package:dominote/controller/navigation/app_navigator/app_navigator.dart';
import 'package:dominote/model/hand.dart';
import 'package:flutter/material.dart';

class GamePlayViewModel extends ChangeNotifier {
  final AppNavigator _navigator;
  final Hand _hand;

  GamePlayViewModel({@required AppNavigator navigator, @required Hand hand})
      : assert(navigator != null),
        assert(hand != null),
        _navigator = navigator,
        _hand = hand;

  Hand get hand => _hand;
}
