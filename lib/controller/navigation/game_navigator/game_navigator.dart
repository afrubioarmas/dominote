import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/game/game_screen.dart';
import 'package:dominote/ui/gameplay/gameplay_screen.dart';
import 'package:flutter/material.dart';

import 'game_routes.dart';

class GameNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> navigateToGame() {
    return _pushRoute(GameRoutes.game);
  }

  Future<void> navigateToGamePlay(Hand hand) {
    return _pushRoute(GameRoutes.gamePlay, arguments: hand);
  }

  popScreen() {
    navigatorKey.currentState.pop();
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GameRoutes.game:
        return MaterialPageRoute(builder: (context) => GameScreen());

      case GameRoutes.gamePlay:
        return MaterialPageRoute(builder: (context) => GameplayScreen(hand: settings.arguments));

      default:
        return null;
    }
  }

  Future<T> _pushRoute<T>(String routeName, {Object arguments, bool clearStack = false}) {
    if (clearStack) {
      return navigatorKey.currentState.pushNamedAndRemoveUntil<T>(routeName, (route) => false, arguments: arguments);
    } else {
      return navigatorKey.currentState.pushNamed<T>(routeName, arguments: arguments);
    }
  }
}
