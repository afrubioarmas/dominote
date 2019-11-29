import 'package:dominote/model/Hand.dart';

import 'User.dart';

class Game {
  List<Hand> hands = List();
  List<User> players = List();

  Game({this.hands, this.players});
}
