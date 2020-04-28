import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/common_components/my_primary_button.dart';
import 'package:dominote/ui/game/game_view_model.dart';
import 'package:dominote/ui/gameplay/add_match_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddMatch extends StatelessWidget {
  final Hand hand;

  AddMatch({@required this.hand});

  AddMatchViewModel _createViewModel(BuildContext context, GameViewModel gameViewModel) {
    return AddMatchViewModel(hand: hand, gameViewModel: gameViewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, gameViewModel, staticChild) => ChangeNotifierProvider<AddMatchViewModel>(
        create: (context) => _createViewModel(context, gameViewModel),
        child: Consumer<AddMatchViewModel>(
          builder: (context, addMatchViewModel, staticChild) => Container(
            color: Theme.of(context).cardColor,
            height: 180,
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Language.getStrings("AddPoints"), style: Theme.of(context).textTheme.title),
                  Container(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio(
                            value: "one",
                            groupValue: addMatchViewModel.radioValue,
                            onChanged: (id) {
                              addMatchViewModel.radioValue = id;
                            },
                          ),
                          Text(addMatchViewModel.players[0].name + " - " + addMatchViewModel.players[1].name),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(addMatchViewModel.players[2].name + " - " + addMatchViewModel.players[3].name),
                          Radio(
                            value: "two",
                            groupValue: addMatchViewModel.radioValue,
                            onChanged: (id) {
                              addMatchViewModel.radioValue = id;
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
                          Text(Language.getStrings("Points") + ": "),
                          Container(
                            padding: EdgeInsets.only(left: 20),
                            width: 70,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              controller: addMatchViewModel.controller,
                            ),
                          ),
                        ],
                      ),
                      MyPrimaryButton(
                        color: Theme.of(context).buttonColor,
                        child: Icon(Icons.add),
                        action: () {
                          addMatchViewModel.addScore();
                        },
                      )
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
}
