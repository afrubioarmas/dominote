import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/Game.dart';
import 'package:dominote/model/User.dart';
import 'package:dominote/view/common_components/my_flushbar_helper.dart';
import 'package:dominote/view/common_components/my_primary_button.dart';
import 'package:flushbar/flushbar.dart';
import 'package:dominote/view/common_components/my_text_field.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewGame extends StatefulWidget {
  _NewGamestate createState() => _NewGamestate();
}

class _NewGamestate extends State<NewGame> {
  TextEditingController textNameController = TextEditingController();
  Game newGame;
  List<User> players = List<User>();
  @override
  Widget build(BuildContext context) {
    var playersListWidget = List<TableRow>();
    if (players.length > 0) {
      for (int i = 0; i < players.length; i++) {
        playersListWidget.add(TableRow(
          children: <Widget>[
            TableCell(
              child: Text(
                (i + 1).toString() + ". ",
                style:
                    Theme.of(context).textTheme.display1.copyWith(fontSize: 18),
              ),
            ),
            TableCell(
              child: Text(
                players[i].name,
                style:
                    Theme.of(context).textTheme.display1.copyWith(fontSize: 18),
              ),
            ),
            TableCell(
              child: MyPrimaryButton(
                color: Theme.of(context).colorScheme.error,
                child: Icon(Icons.delete_forever),
                action: () {
                  setState(() {
                    players.remove(players[i]);
                  });
                },
              ),
            )
          ],
        ));
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(Language.getStrings("NewGame")),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 20,
            ),
            Text(
              Language.getStrings("Players"),
              style: Theme.of(context).textTheme.headline,
            ),
            Container(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    height: 80,
                    child: MyTextField(
                        hint: Language.getStrings("EnterPlayerName"),
                        label: Language.getStrings("Name"),
                        controller: textNameController),
                  ),
                  MyPrimaryButton(
                    child: Text(Language.getStrings("Add")),
                    color: Theme.of(context).buttonColor,
                    action: () {
                      if (textNameController.text.length > 2) {
                        if (players.length < 7) {
                          setState(() {
                            players.add(User(name: textNameController.text));
                          });
                          MyFlushbarHelper.showSuccess(
                              Language.getStrings("PlayerAdded") +
                                  ": " +
                                  textNameController.text,
                              context);
                          textNameController.text = "";
                        } else {
                          MyFlushbarHelper.showError(
                              Language.getStrings("CantAddMoreThan7Players"),
                              context);
                        }
                      } else {
                        MyFlushbarHelper.showError(
                            Language.getStrings(
                                "PlayersNameCantBeLess2Characters"),
                            context);
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: playersListWidget.length > 0
                            ? Table(
                                defaultVerticalAlignment:
                                    TableCellVerticalAlignment.middle,
                                columnWidths: {
                                  0: FixedColumnWidth(20),
                                  2: FixedColumnWidth(60)
                                },
                                children: playersListWidget)
                            : Text(Language.getStrings("NoPlayersAdded")),
                      ),
                      Container(
                        height: 20,
                      ),
                      players.length > 3
                          ? MyPrimaryButton(
                              color: Theme.of(context).buttonColor,
                              child: Text(Language.getStrings("StartGame")))
                          : Container(),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
