import 'package:dominote/controller/blocs/bloc_base.dart';
import 'package:dominote/controller/blocs/game_bloc.dart';
import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/Game.dart';
import 'package:dominote/model/Player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<GameWidget> {
  GameBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<GameBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(Language.getStrings("Scoreboard"),
                          style: Theme.of(context).textTheme.headline),
                    ],
                  ),
                  Container(
                    height: 20,
                  ),
                  StreamBuilder<Game>(
                      stream: bloc.outGameData,
                      builder:
                          (BuildContext context, AsyncSnapshot<Game> snapshot) {
                        if (snapshot.data == null)
                          return CupertinoActivityIndicator();
                        return Table(
                          border: TableBorder.all(
                              color: Theme.of(context).buttonColor),
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: buildScoreboard(snapshot.data),
                        );
                      }),
                ],
              )
            ],
          )),
    );
  }

  List<TableRow> buildScoreboard(Game game) {
    List<TableRow> scoreBoardRows = List<TableRow>();
    for (int i = 0; i < game.players.length; i++) {
      TableRow tableRow;
      List<TableCell> tableCells = List<TableCell>();
      for (int j = 0; j < game.players.length; j++) {
        tableCells.add(TableCell(
            child: Container(
          height: 50,
          child: Text(
            i.toString() + "-" + j.toString(),
            textAlign: TextAlign.center,
          ),
        )));
      }
      tableRow = TableRow(children: tableCells);
      scoreBoardRows.add(tableRow);
    }

    return scoreBoardRows;
  }
}
