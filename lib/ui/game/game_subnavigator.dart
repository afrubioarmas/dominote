import 'package:dominote/controller/misc/service_locator.dart';
import 'package:dominote/controller/navigation/game_navigator/game_navigator.dart';
import 'package:dominote/controller/navigation/game_navigator/game_routes.dart';
import 'package:dominote/model/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_view_model.dart';

class GameSubnavigator extends StatelessWidget {
  final Game game;

  const GameSubnavigator({@required this.game}) : assert(game != null);

  GameViewModel _createViewModel(BuildContext context) {
    return GameViewModel(game: game);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider<GameViewModel>(
        create: (context) => _createViewModel(context),
        child: Navigator(
          key: locator<GameNavigator>().navigatorKey,
          initialRoute: GameRoutes.game,
          onGenerateRoute: locator<GameNavigator>().onGenerateRoute,
        ));
  }
}
