import 'package:dominote/controller/misc/service_locator.dart';
import 'package:dominote/controller/navigation/app_navigator.dart';
import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/game/components/t_game_view_model.dart';
import 'package:dominote/ui/screens/gameplay/gameplay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TGame extends StatelessWidget {
  final Hand hand;
  final double height = 20;

  TGame({
    this.hand,
  });

  TGameViewModel _createViewModel(BuildContext context) {
    return TGameViewModel(hand: hand, navigator: locator<AppNavigator>());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TGameViewModel>(
      create: (context) => _createViewModel(context),
      child: Consumer<TGameViewModel>(
        builder: (context, viewModel, staticChild) => Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Gameplay()));
              },
              child: Container(
                child: _buildTable(context, viewModel),
                width: 120,
                padding: EdgeInsets.all(10),
              ),
            )
          ],
        ),
      ),
    );
  }

  Table _buildTable(BuildContext context, TGameViewModel viewModel) {
    List<TableRow> tableRows = List<TableRow>();

    _buildHeader(context, tableRows, viewModel);
    _buildMatches(context, tableRows, viewModel);

    return Table(
        defaultColumnWidth: FlexColumnWidth(0.1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder(verticalInside: BorderSide(color: Theme.of(context).buttonColor, width: 2)),
        children: tableRows);
  }

  _buildMatches(BuildContext context, List<TableRow> tableRows, TGameViewModel viewModel) {
    List<TableCell> tableCellsPlays = List<TableCell>();

    int team1count = 0;
    int team2count = 0;

    /*viewModel.hand.matches.forEach((match) {
      team1count = team1count + match.score;
      tableCellsPlays.add(TableCell(
        child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text(match.score.toString()), Text("-"), Text(team1count.toString())],
            )),
      ));
      tableCellsPlays.add(TableCell(
        child: Container(height: height, alignment: Alignment.center, child: Text("")),
      ));
      tableRows.add(TableRow(children: tableCellsPlays));
    });*/

    tableCellsPlays.add(TableCell(
      child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[Text("2"), Text("-"), Text(team1count.toString())],
          )),
    ));
    tableCellsPlays.add(TableCell(
      child: Container(height: height, alignment: Alignment.center, child: Text("")),
    ));
    tableRows.add(TableRow(children: tableCellsPlays));
  }

  _buildHeader(BuildContext context, List<TableRow> tableRows, TGameViewModel viewModel) {
    List<TableCell> tableCells = List<TableCell>();
    tableCells.add(TableCell(
      child: Container(
          height: height,
          alignment: Alignment.center,
          child: Text(hand.players[0].number.toString() + " - " + hand.players[1].number.toString())),
    ));
    tableCells.add(TableCell(
      child: Container(
          height: height,
          alignment: Alignment.center,
          child: Text(hand.players[2].number.toString() + " - " + hand.players[3].number.toString())),
    ));
    tableRows.add(TableRow(
        children: tableCells,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).buttonColor, width: 2)))));
  }
}
