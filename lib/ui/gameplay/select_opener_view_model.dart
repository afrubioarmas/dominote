import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/hand.dart';
import 'package:dominote/model/player.dart';
import 'package:dominote/ui/common_components/my_notification.dart';
import 'package:dominote/ui/game/game_view_model.dart';
import 'package:flutter/material.dart';

class SelectOpenerViewModel extends ChangeNotifier {
  final Hand _hand;
  final GameViewModel _gameViewModel;

  SelectOpenerViewModel({@required GameViewModel gameViewModel, @required Hand hand})
      : assert(hand != null),
        assert(gameViewModel != null),
        _hand = hand,
        _gameViewModel = gameViewModel;

  Hand get hand => _hand;

  List<Player> get players => _hand.players;

  TextEditingController controller = TextEditingController();

  String _radioValue = "";

  String get radioValue => _radioValue;

  set radioValue(String value) {
    _radioValue = value;
    notifyListeners();
  }

  void submitOpener(BuildContext context) {
    try {
      _validations();
      _hand.indexFirstOpening = int.parse(_radioValue);
      FocusScope.of(context).requestFocus(FocusNode());
    } catch (error) {
      MyNotification.showError(subtitle: error);
    } finally {
      controller.text = "";
      _gameViewModel.notifyListeners();
    }
  }

  _validations() {
    if (_radioValue == "") {
      throw (Language.getStrings("NoFirstOpenerSelected"));
    }
  }
}
