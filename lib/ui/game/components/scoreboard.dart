import 'package:dominote/model/game.dart';
import 'package:flutter/material.dart';

class Scoreboard extends StatelessWidget {
  final Game game;

  Scoreboard({this.game});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Theme.of(context).buttonColor),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: buildScoreboard(),
    );
  }

  List<TableRow> buildScoreboard() {
    List<TableRow> scoreBoardRows = List<TableRow>();

    //First Row
    List<TableCell> tableCells = List<TableCell>();
    tableCells.add(
      TableCell(
        child: Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(
            "x",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
    scoreBoardRows.add(TableRow(children: tableCells));

    for (int i = 0; i < game.players.length; i++) {
      tableCells.add(
        TableCell(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            child: Text(
              (i + 1).toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    //End first row

    for (int i = 0; i < game.players.length; i++) {
      //First Column
      List<TableCell> tableCells = List<TableCell>();
      tableCells.add(
        TableCell(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            child: Text(
              (i + 1).toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
      //End first column

      for (int j = 0; j < game.players.length; j++) {
        tableCells.add(
          TableCell(
            child: Container(
              alignment: Alignment.center,
              height: 50,
              child: Text(
                i == j ? "x" : "score",
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }

      scoreBoardRows.add(TableRow(children: tableCells));
    }

    return scoreBoardRows;
  }
}
