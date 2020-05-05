import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/game.dart';
import 'package:dominote/ui/game/components/scoreboard_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Scoreboard extends StatelessWidget {
  final Game game;

  Scoreboard({this.game});

  ScoreboardViewModel _buildViewModel(Game game) {
    return ScoreboardViewModel(game: game);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScoreboardViewModel>(
      create: (context) => _buildViewModel(game),
      child: Consumer<ScoreboardViewModel>(
        builder: (context, scoreboardViewModel, staticChild) => Table(
          border: TableBorder.all(color: Theme.of(context).buttonColor),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: buildScoreboard(scoreboardViewModel),
        ),
      ),
    );
  }

  List<TableRow> buildScoreboard(ScoreboardViewModel scoreboardViewModel) {
    List<TableRow> scoreBoardRows = List<TableRow>();

    scoreBoardRows.add(_buildFirstRow(scoreboardViewModel));

    for (int i = 0; i < scoreboardViewModel.game.players.length; i++) {
      //First Column
      List<TableCell> tableCells = List<TableCell>();
      tableCells.add(_buildCell((i + 1).toString()));
      //End first column

      for (int j = 0; j < scoreboardViewModel.game.players.length; j++) {
        tableCells.add(_buildCell(
          i == j ? "X" : scoreboardViewModel.getScoreOnCoordinate(i + 1, j + 1).toString(),
        ));
      }

      scoreBoardRows.add(TableRow(children: tableCells));
    }

    scoreBoardRows.add(_buildTotalRow(scoreboardViewModel));

    return scoreBoardRows;
  }

  TableRow _buildFirstRow(ScoreboardViewModel scoreboardViewModel) {
    List<TableCell> tableCells = List<TableCell>();
    tableCells.add(_buildCell("X"));
    for (int i = 0; i < scoreboardViewModel.game.players.length; i++) {
      tableCells.add(_buildCell((i + 1).toString()));
    }
    return TableRow(children: tableCells);
  }

  TableCell _buildCell(String content) {
    return TableCell(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text(
          content,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  TableRow _buildTotalRow(ScoreboardViewModel scoreboardViewModel) {
    List<TableCell> tableCells = List<TableCell>();
    tableCells.add(_buildCell(Language.getStrings("TotalScore")));
    for (int i = 0; i < scoreboardViewModel.game.players.length; i++) {
      tableCells.add(_buildCell(scoreboardViewModel.getTotalScore(i + 1).toString()));
    }
    return TableRow(
        decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 3, style: BorderStyle.solid)),
        children: tableCells);
  }
}
