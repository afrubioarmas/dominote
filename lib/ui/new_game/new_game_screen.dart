import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/controller/misc/service_locator.dart';
import 'package:dominote/controller/navigation/app_navigator/app_navigator.dart';
import 'package:dominote/ui/common_components/my_primary_button.dart';
import 'package:dominote/ui/common_components/my_text_field.dart';
import 'package:dominote/ui/new_game/new_game_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewGameScreen extends StatelessWidget {
  NewGameViewModel _createViewModel(BuildContext context) {
    return NewGameViewModel(navigator: locator<AppNavigator>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Language.getStrings("NewGame")),
        centerTitle: true,
      ),
      body: Container(
        child: ChangeNotifierProvider<NewGameViewModel>(
          create: (context) => _createViewModel(context),
          child: Consumer<NewGameViewModel>(
            builder: (context, viewModel, staticChild) => ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildHeadline(context, viewModel),
                      _buildListSection(context, viewModel)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildListSection(BuildContext context, NewGameViewModel viewModel) {
    return Column(
      children: <Widget>[
        Container(
          child: viewModel.players.length > 0
              ? Table(
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  columnWidths: {0: FixedColumnWidth(20), 2: FixedColumnWidth(60)},
                  children: _buildList(context, viewModel))
              : Text(Language.getStrings("NoPlayersAdded")),
        ),
        viewModel.players.length > 3
            ? MyPrimaryButton(
                color: Theme.of(context).buttonColor,
                child: Text(Language.getStrings("StartGame")),
                action: () {
                  viewModel.onStartGame();
                },
              )
            : Container(),
      ],
    );
  }

  _buildList(BuildContext context, NewGameViewModel viewModel) {
    var playersListWidget = List<TableRow>();
    if (viewModel.players.length > 0) {
      for (int i = 0; i < viewModel.players.length; i++) {
        playersListWidget.add(TableRow(
          children: <Widget>[
            TableCell(
              child: Text(
                (i + 1).toString() + ". ",
                style: Theme.of(context).textTheme.display1.copyWith(fontSize: 18),
              ),
            ),
            TableCell(
              child: Text(
                viewModel.players[i].name,
                style: Theme.of(context).textTheme.display1.copyWith(fontSize: 18),
              ),
            ),
            TableCell(
              child: MyPrimaryButton(
                color: Theme.of(context).colorScheme.error,
                child: Icon(Icons.delete_forever),
                action: () {
                  viewModel.onPlayerDelete(i);
                },
              ),
            )
          ],
        ));
      }
    }
    return playersListWidget;
  }

  _buildHeadline(BuildContext context, NewGameViewModel viewModel) {
    return Column(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              Language.getStrings("Players"),
              style: Theme.of(context).textTheme.headline,
            )),
        Container(
          padding: EdgeInsets.only(top: 20),
          child: viewModel.players.length < 5
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: 200,
                      height: 80,
                      child: MyTextField(
                          hint: Language.getStrings("EnterPlayerName"),
                          label: Language.getStrings("Name"),
                          controller: viewModel.nameTextController),
                    ),
                    MyPrimaryButton(
                      child: Text(Language.getStrings("Add")),
                      color: Theme.of(context).buttonColor,
                      action: () {
                        viewModel.onPlayerSubmit();
                      },
                    ),
                  ],
                )
              : Container(),
        ),
      ],
    );
  }
}
