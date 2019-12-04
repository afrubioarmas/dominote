import 'dart:async';
import 'package:dominote/model/Game.dart';
import 'package:rxdart/rxdart.dart';
import 'bloc_base.dart';

class GameBloc implements BlocBase {
  Game game;

  final BehaviorSubject<Game> _gameData = BehaviorSubject<Game>();
  StreamSink<Game> get _inGameData => _gameData.sink;
  Stream<Game> get outGameData => _gameData.stream;

  GameBloc(Game game) {
    game = game;
    _inGameData.add(game);
  }

  @override
  void dispose() {
    _gameData.close();
  }
}
