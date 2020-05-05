import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/common_components/my_primary_button.dart';
import 'package:dominote/ui/game/game_view_model.dart';
import 'package:dominote/ui/gameplay/select_opener_view_model.dart';
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
      builder: (context, gameViewModel, staticChild) => ChangeNotifierProvider<SelectOpenerViewModel>(
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
                  _buildOpenerSelection(selectOpenerViewModel),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Text _buildHeader(BuildContext context) {
    return Text(Language.getStrings("SelectOpener"), style: Theme.of(context).textTheme.title);
  }

  Row _buildOpenerSelection(SelectOpenerViewModel selectOpenerViewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: "one",
                      groupValue: selectOpenerViewModel.radioValue,
                      onChanged: (id) {
                        selectOpenerViewModel.radioValue = id;
                      },
                    ),
                    Text(selectOpenerViewModel.players[0].name),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(selectOpenerViewModel.players[1].name),
                    Radio(
                      value: "two",
                      groupValue: selectOpenerViewModel.radioValue,
                      onChanged: (id) {
                        selectOpenerViewModel.radioValue = id;
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Radio(
                      value: "one",
                      groupValue: selectOpenerViewModel.radioValue,
                      onChanged: (id) {
                        selectOpenerViewModel.radioValue = id;
                      },
                    ),
                    Text(selectOpenerViewModel.players[0].name),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(selectOpenerViewModel.players[1].name),
                    Radio(
                      value: "two",
                      groupValue: selectOpenerViewModel.radioValue,
                      onChanged: (id) {
                        selectOpenerViewModel.radioValue = id;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Row _buildButton(BuildContext context, SelectOpenerViewModel selectOpenerViewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(Language.getStrings("Points") + ": "),
            Container(
              padding: EdgeInsets.only(left: 20),
              width: 70,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: selectOpenerViewModel.controller,
              ),
            ),
          ],
        ),
        MyPrimaryButton(
          color: Theme.of(context).buttonColor,
          child: Icon(Icons.add),
          action: () {
            selectOpenerViewModel.addScore(context);
          },
        )
      ],
    );
  }
}
