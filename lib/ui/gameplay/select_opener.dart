import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/common_components/my_primary_button.dart';
import 'package:dominote/ui/game/game_view_model.dart';
import 'package:dominote/ui/gameplay/select_opener_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectOpener extends StatelessWidget {
  final Hand hand;

  SelectOpener({@required this.hand});

  SelectOpenerViewModel _createViewModel(BuildContext context, GameViewModel gameViewModel) {
    return SelectOpenerViewModel(hand: hand, gameViewModel: gameViewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, gameViewModel, staticChild) =>
          ChangeNotifierProvider<SelectOpenerViewModel>(
        create: (context) => _createViewModel(context, gameViewModel),
        child: Consumer<SelectOpenerViewModel>(
          builder: (context, selectOpenerViewModel, staticChild) => Container(
            color: Theme.of(context).cardColor,
            height: 180,
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context),
                  Row(
                    children: <Widget>[
                      _buildOpenerSelection(selectOpenerViewModel),
                      _buildButton(context, selectOpenerViewModel)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child:
          Text(Language.getStrings("SelectFirstOpener"), style: Theme.of(context).textTheme.title),
    );
  }

  Widget _buildOpenerSelection(SelectOpenerViewModel selectOpenerViewModel) {
    return Expanded(
      flex: 2,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildSelectorLeft(selectOpenerViewModel, 0),
              _buildSelectorRight(selectOpenerViewModel, 1),
            ],
          ),
          Row(
            children: <Widget>[
              _buildSelectorLeft(selectOpenerViewModel, 2),
              _buildSelectorRight(selectOpenerViewModel, 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectorLeft(SelectOpenerViewModel selectOpenerViewModel, int index) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Radio(
            value: index.toString(),
            groupValue: selectOpenerViewModel.radioValue,
            onChanged: (id) {
              selectOpenerViewModel.radioValue = id;
            },
          ),
          Text(selectOpenerViewModel.players[index].name),
        ],
      ),
    );
  }

  Expanded _buildSelectorRight(SelectOpenerViewModel selectOpenerViewModel, int index) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(selectOpenerViewModel.players[index].name),
          Radio(
            value: index.toString(),
            groupValue: selectOpenerViewModel.radioValue,
            onChanged: (id) {
              selectOpenerViewModel.radioValue = id;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, SelectOpenerViewModel selectOpenerViewModel) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: MyPrimaryButton(
          color: Theme.of(context).buttonColor,
          child: Icon(Icons.check),
          action: () {
            selectOpenerViewModel.submitOpener(context);
          },
        ),
      ),
    );
  }
}
