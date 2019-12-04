import 'package:dominote/controller/blocs/bloc_base.dart';
import 'package:dominote/controller/blocs/game_bloc.dart';
import 'package:dominote/model/Game.dart';
import 'package:dominote/model/Player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'game_widget.dart';

class GameWidgetBlocProvider extends StatefulWidget {
  Game _game;
  GameWidgetBlocProvider(Game game) {
    _game = game;
  }

  _GameWidgetBlocProviderState createState() => _GameWidgetBlocProviderState();
}

final GlobalKey<NavigatorState> keyGame = GlobalKey();

class _GameWidgetBlocProviderState extends State<GameWidgetBlocProvider> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      bloc: GameBloc(widget._game),
      child: Navigator(key: keyGame, onGenerateRoute: _getRoute),
    );
  }

  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/gameWidget':
        return PageTransition(
            settings: settings,
            child: GameWidget(),
            type: PageTransitionType.downToUp);

      default:
        return PageTransition(
            settings: settings,
            child: GameWidget(),
            type: PageTransitionType.downToUp);
    }
  }
}
