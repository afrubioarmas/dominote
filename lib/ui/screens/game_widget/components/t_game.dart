import 'package:dominote/ui/screens/gameplay/gameplay.dart';
import 'package:flutter/material.dart';

class Tgame extends StatelessWidget {
  final String team1;
  final String team2;
  final double height;

  Tgame({this.team1, this.team2, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Gameplay()));
      },
      child: Container(
        child: buildTable(context),
        width: 120,
        padding: EdgeInsets.all(10),
      ),
    );
  }

  Table buildTable(BuildContext context) {
    List<TableRow> tableRows = List<TableRow>();
    //Header
    List<TableCell> tableCells = List<TableCell>();
    tableCells.add(TableCell(
      child: Container(
          height: height, alignment: Alignment.center, child: Text(team1)),
    ));
    tableCells.add(TableCell(
      child: Container(
          height: height, alignment: Alignment.center, child: Text(team2)),
    ));
    tableRows.add(TableRow(
        children: tableCells,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Theme.of(context).buttonColor, width: 2)))));
    //Header end

    List<TableCell> tableCellsPlays = List<TableCell>();
    tableCellsPlays.add(TableCell(
      child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[Text("34"), Text("-"), Text("34")],
          )),
    ));
    tableCellsPlays.add(TableCell(
      child: Container(
          height: height, alignment: Alignment.center, child: Text("")),
    ));
    tableRows.add(TableRow(children: tableCellsPlays));

    List<TableCell> tableCellsPlays2 = List<TableCell>();
    tableCellsPlays2.add(
      TableCell(
        child: Container(
            height: height,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text("34"), Text("-"), Text("68")],
            )),
      ),
    );
    tableCellsPlays2.add(TableCell(
      child: Container(
          height: height, alignment: Alignment.center, child: Text("")),
    ));
    tableRows.add(TableRow(children: tableCellsPlays2));

    List<TableCell> tableCellsPlays3 = List<TableCell>();
    tableCellsPlays3.add(TableCell(
      child: Container(
          height: height,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[Text("32"), Text("-"), Text("100")],
          )),
    ));
    tableCellsPlays3.add(TableCell(
      child: Container(
          height: height, alignment: Alignment.center, child: Text("")),
    ));

    tableRows.add(TableRow(children: tableCellsPlays3));

    return Table(
        defaultColumnWidth: FlexColumnWidth(0.1),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        border: TableBorder(
            verticalInside:
                BorderSide(color: Theme.of(context).buttonColor, width: 2)),
        children: tableRows);
  }
}
