import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/controller/misc/service_locator.dart';
import 'package:dominote/controller/navigation/app_navigator/app_navigator.dart';
import 'package:dominote/controller/navigation/game_navigator/game_navigator.dart';
import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/common_components/my_notification.dart';
import 'package:dominote/ui/game/game_view_model.dart';
import 'package:flutter/material.dart';

import 'components/score_editing_dialog.dart';

class TGameViewModel extends ChangeNotifier {
  final GameNavigator _navigator = locator<GameNavigator>();
  final Hand _hand;
  final GameViewModel _gameViewModel;
  final AppNavigator _appNavigator = locator<AppNavigator>();

  TGameViewModel({@required Hand hand, @required GameViewModel gameViewModel})
      : assert(hand != null),
        assert(gameViewModel != null),
        _hand = hand,
        _gameViewModel = gameViewModel;

  Hand get hand => _hand;

  TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  void onTap() {
    _navigator.navigateToGamePlay(_hand);
  }

  void editScore(Team team, int index, BuildContext context) {
    try {
      _validations();
      if (team == Team.team1) {
        _hand.matchesTeam1[index] = int.parse(_controller.text);
      } else {
        _hand.matchesTeam2[index] = int.parse(_controller.text);
      }
    } catch (error) {
      MyNotification.showError(subtitle: error);
    } finally {
      controller.text = "";
      _gameViewModel.notifyListeners();
    }
    MyNotification.showSuccess(subtitle: Language.getStrings("ScoreEdited"));
    FocusScope.of(context).requestFocus(FocusNode());
    _appNavigator.popScreen();
  }

  _validations() {
    if (controller.text == "") {
      throw (Language.getStrings("EmptyScore"));
    }

    if (int.parse(controller.text) > 100) {
      throw (Language.getStrings("ScoreMoreThan100"));
    }
  }

  void deleteScore(Team team, int index, BuildContext context) {
    if (team == Team.team1) {
      _hand.matchesTeam1.removeAt(index);
    } else {
      _hand.matchesTeam2.removeAt(index);
    }
    _gameViewModel.notifyListeners();
    MyNotification.showSuccess(subtitle: Language.getStrings("ScoreDeleted"));
    _appNavigator.popScreen();
  }

  void showEditingDialog(BuildContext context, int index, Team team) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ScoreEditingDialog(
            index: index,
            team: team,
            controller: _controller,
            editAction: editScore,
            deleteAction: deleteScore,
          );
        });
  }
}
