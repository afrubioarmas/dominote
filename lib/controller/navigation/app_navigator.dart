import 'package:dominote/model/Game.dart';
import 'package:dominote/ui/new_game/new_game_screen.dart';
import 'package:dominote/ui/screens/game_widget/game_widget.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> navigateToNewGame({bool clearStack}) {
    return _pushRoute(AppRoutes.new_game, clearStack: clearStack);
  }

  Future<void> navigateToGame(Game game) {
    return _pushRoute(AppRoutes.game, arguments: game);
  }

  popScreen() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.new_game:
        return MaterialPageRoute(builder: (context) => NewGameScreen());

      case AppRoutes.game:
        return MaterialPageRoute(
            builder: (context) => GameScreen(/*game: game*/));

      default:
        return null;
    }
  }

  Future<T> _pushRoute<T>(String routeName,
      {Object arguments, bool clearStack = false}) {
    if (clearStack) {
      return navigatorKey.currentState.pushNamedAndRemoveUntil<T>(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      return navigatorKey.currentState
          .pushNamed<T>(routeName, arguments: arguments);
    }
  }
}
