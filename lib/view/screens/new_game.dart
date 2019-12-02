import 'package:dominote/model/Game.dart';
import 'package:dominote/model/User.dart';
import 'package:dominote/view/common_components/my_primary_button.dart';
import 'package:dominote/view/common_components/my_text_field.dart';
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
    } else {
      playersListWidget.add(TableRow(children: [Text("No players added.")]));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("New Game"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  height: 30,
                ),
                Text(
                  "Players",
                  style: Theme.of(context).textTheme.headline,
                ),
                Container(
                  height: 30,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 200,
                        height: 80,
                        child: MyTextField(
                            hint: "Enter player name",
                            label: "Name",
                            controller: textNameController),
                      ),
                      MyPrimaryButton(
                        child: Text("Add"),
                        color: Theme.of(context).colorScheme.primary,
                        action: () {
                          if (textNameController.text.length > 2) {
                            setState(() {
                              players.add(User(name: textNameController.text));
                            });
                            textNameController.text = "";
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                ),
                Container(
                  width: 300,
                  child: Table(
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      columnWidths: {
                        0: FixedColumnWidth(20),
                        2: FixedColumnWidth(60)
                      },
                      children: playersListWidget),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
