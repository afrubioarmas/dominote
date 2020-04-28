import 'package:dominote/model/hand.dart';
import 'package:flutter/material.dart';

class GamePlayViewModel extends ChangeNotifier {
  final Hand _hand;

  GamePlayViewModel({@required Hand hand})
      : assert(hand != null),
        _hand = hand;

  Hand get hand => _hand;
}
