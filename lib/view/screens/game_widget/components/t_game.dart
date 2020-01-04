import 'package:flutter/material.dart';

class Tgame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: buildTable(context),
      width: 120,
      padding: EdgeInsets.all(10),
    );
  }

  Table buildTable(BuildContext context) {
    List<TableRow> tableRows = List<TableRow>();
    //Header
    List<TableCell> tableCells = List<TableCell>();
    tableCells.add(TableCell(
      child: Container(alignment: Alignment.center, child: Text("1 - 2")),
    ));
    tableCells.add(TableCell(
      child: Container(alignment: Alignment.center, child: Text("3 - 4")),
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
      child: Container(alignment: Alignment.center, child: Text("34-34")),
    ));
    tableCellsPlays.add(TableCell(
      child: Container(alignment: Alignment.center, child: Text("")),
    ));
    tableRows.add(TableRow(children: tableCellsPlays));

    List<TableCell> tableCellsPlays2 = List<TableCell>();
    tableCellsPlays2.add(TableCell(
      child: Container(alignment: Alignment.center, child: Text("12-46")),
    ));
    tableCellsPlays2.add(TableCell(
      child: Container(alignment: Alignment.center, child: Text("")),
    ));
    tableRows.add(TableRow(children: tableCellsPlays2));

    List<TableCell> tableCellsPlays3 = List<TableCell>();
    tableCellsPlays3.add(TableCell(
      child: Container(alignment: Alignment.center, child: Text("12-46")),
    ));
    tableCellsPlays3.add(TableCell(
      child: Container(alignment: Alignment.center, child: Text("")),
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
