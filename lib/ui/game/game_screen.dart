import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/controller/misc/service_locator.dart';
import 'package:dominote/controller/navigation/app_navigator.dart';
import 'package:dominote/model/game.dart';
import 'package:dominote/model/player.dart';
import 'package:dominote/ui/game/components/scoreboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../t_game/t_game.dart';
import 'game_view_model.dart';

class GameScreen extends StatelessWidget {
  final Game game;

  const GameScreen({@required this.game}) : assert(game != null);

  GameViewModel _createViewModel(BuildContext context) {
    return GameViewModel(game: game, navigator: locator<AppNavigator>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(Language.getStrings("Scoreboard"), style: Theme.of(context).textTheme.title),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider<GameViewModel>(
        create: (context) => _createViewModel(context),
        child: Consumer<GameViewModel>(
          builder: (context, viewModel, staticChild) => ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _buildPlayersLegend(context, viewModel),
                  _buildScoreBoard(viewModel),
                  _buildTGames(viewModel, context),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildPlayersLegend(BuildContext context, GameViewModel viewModel) {
    List<Widget> playersLegend = List<Widget>();
    List<Player> players = viewModel.players;
    for (int i = 0; i < players.length; i++) {
      playersLegend.add(Text((i + 1).toString() + ": " + players[i].name, style: Theme.of(context).textTheme.subtitle));
    }
    return Wrap(spacing: 10, children: playersLegend);
  }

  _buildTGames(GameViewModel viewModel, BuildContext context) {
    List<Widget> tgames = [];
    viewModel.game.hands.forEach((hand) {
      tgames.add(Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: TGame(
          hand: hand,
        ),
      ));
    });

    return Container(
      child: Wrap(alignment: WrapAlignment.center, spacing: 20, runSpacing: 20, children: tgames),
    );
  }

  _buildScoreBoard(GameViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Scoreboard(
        game: viewModel.game,
      ),
    );
  }
}
