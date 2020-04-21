import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/controller/navigation/app_navigator.dart';
import 'package:dominote/model/Game.dart';
import 'package:dominote/model/Player.dart';
import 'package:dominote/ui/common_components/my_notification.dart';
import 'package:flutter/material.dart';

class NewGameViewModel extends ChangeNotifier {
  final AppNavigator _navigator;

  NewGameViewModel({@required AppNavigator navigator})
      : assert(navigator != null),
        _navigator = navigator;

  final List<Player> _players = List<Player>();
  final TextEditingController nameTextController = TextEditingController();

  List<Player> get players => _players;

  void onViewStarted() {
    _players.add(Player("Andres"));
    _players.add(Player("Oscar"));
    _players.add(Player("Dani"));
    _players.add(Player("Felo"));
    notifyListeners();
  }

  void onStartGame() {
    _navigator.navigateToGame(Game(_players));
  }

  void onPlayerSubmit() {
    if (nameTextController.text.length > 2) {
      if (players.length < 7) {
        _players.add(Player(nameTextController.text));
        notifyListeners();
        MyNotification.showSuccess(
          subtitle: Language.getStrings("PlayerAdded") +
              ": " +
              nameTextController.text,
        );
        nameTextController.text = "";
      } else {
        MyNotification.showError(
            subtitle: Language.getStrings("CantAddMoreThan7Players"));
      }
    } else {
      MyNotification.showError(
          subtitle: Language.getStrings("PlayersNameCantBeLess2Characters"));
    }
  }

  void onPlayerDelete(int index) {
    _players.removeAt(index);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
  }
}
