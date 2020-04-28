import 'package:dominote/model/hand.dart';
import 'package:dominote/model/player.dart';
import 'package:dominote/ui/game/game_view_model.dart';
import 'package:dominote/ui/t_game/t_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TGame extends StatelessWidget {
  final Hand hand;
  final bool preview;
  final double height = 20;

  TGame({@required this.hand, this.preview = false});

  TGameViewModel _createViewModel(BuildContext context, GameViewModel gameViewModel) {
    return TGameViewModel(hand: hand, gameViewModel: gameViewModel);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameViewModel>(
      builder: (context, gameViewModel, staticChild) => ChangeNotifierProvider<TGameViewModel>(
        create: (context) => _createViewModel(context, gameViewModel),
        child: Consumer<TGameViewModel>(
          builder: (context, tGameViewModel, staticChild) => Column(
            children: <Widget>[
              preview
                  ? InkWell(
                      onTap: () {
                        tGameViewModel.onTap();
                      },
                      child: _buildContent(context, tGameViewModel))
                  : _buildContent(context, tGameViewModel)
            ],
          ),
        ),
      ),
    );
  }

  _buildContent(BuildContext context, TGameViewModel tGameViewModel) {
    return Container(
      child: _buildTable(context, tGameViewModel),
      padding: EdgeInsets.all(10),
    );
  }

  Table _buildTable(BuildContext context, TGameViewModel viewModel) {
    List<TableRow> tableRows = List<TableRow>();

    tableRows.add(_buildHeader(context, viewModel));
    _buildMatches(context, tableRows, viewModel);

    return Table(
        defaultColumnWidth: FlexColumnWidth(0.1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder(verticalInside: BorderSide(color: Theme.of(context).buttonColor, width: 2)),
        children: tableRows);
  }

  _buildMatches(BuildContext context, List<TableRow> tableRows, TGameViewModel viewModel) {
    int team1count = 0;
    int team2count = 0;
    int rowCount = 0;

    while (rowCount < viewModel.hand.matchesTeam1.length || rowCount < viewModel.hand.matchesTeam2.length) {
      List<TableCell> tableCellsPlays = List<TableCell>();
      if (viewModel.hand.matchesTeam1.length > rowCount) {
        team1count = team1count + viewModel.hand.matchesTeam1[rowCount];
        tableCellsPlays.add(_buildTableCellWithScore(
            viewModel.hand.matchesTeam1[rowCount], team1count, context, viewModel, Team.team1, rowCount));
      } else {
        tableCellsPlays.add(_buildEmptyTableCell());
      }

      if (viewModel.hand.matchesTeam2.length > rowCount) {
        team2count = team2count + viewModel.hand.matchesTeam2[rowCount];
        tableCellsPlays.add(_buildTableCellWithScore(
            viewModel.hand.matchesTeam2[rowCount], team2count, context, viewModel, Team.team2, rowCount));
      } else {
        tableCellsPlays.add(_buildEmptyTableCell());
      }
      tableRows.add(TableRow(children: tableCellsPlays));
      rowCount++;
    }
  }

  TableCell _buildTableCellWithScore(
      int newScore, int count, BuildContext context, TGameViewModel viewModel, Team team, int index) {
    return TableCell(
      child: !preview
          ? InkWell(
              onLongPress: () {
                viewModel.showEditingDialog(context, index, team);
              },
              child: Container(
                  height: height,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[Text(newScore.toString()), Text("-"), Text(count.toString())],
                  )),
            )
          : Container(
              height: height,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[Text(newScore.toString()), Text("-"), Text(count.toString())],
              )),
    );
  }

  TableCell _buildEmptyTableCell() {
    return TableCell(
      child: Container(height: height, alignment: Alignment.center, child: Text("")),
    );
  }

  TableRow _buildHeader(BuildContext context, TGameViewModel viewModel) {
    List<TableCell> tableCells = List<TableCell>();
    tableCells.add(TableCell(
      child: Container(
          height: height,
          alignment: Alignment.center,
          child: !preview
              ? Text(_returnNumberAndNameOf(hand.players[0]) + " - " + _returnNumberAndNameOf(hand.players[1]))
              : Text(hand.players[0].number.toString() + " - " + hand.players[1].number.toString())),
    ));
    tableCells.add(TableCell(
        child: Container(
            height: height,
            alignment: Alignment.center,
            child: !preview
                ? Text(_returnNumberAndNameOf(hand.players[2]) + " - " + _returnNumberAndNameOf(hand.players[3]))
                : Text(hand.players[2].number.toString() + " - " + hand.players[3].number.toString()))));
    return TableRow(
        children: tableCells,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).buttonColor, width: 2))));
  }

  _returnNumberAndNameOf(Player player) {
    return player.number.toString() + ". " + player.name.toString();
  }
}
