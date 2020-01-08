import 'package:dominote/controller/blocs/bloc_base.dart';
import 'package:dominote/controller/blocs/game_bloc.dart';
import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/Game.dart';
import 'package:dominote/view/screens/game_widget/components/t_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'components/scoreboard.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(Language.getStrings("Scoreboard"),
            style: Theme.of(context).textTheme.title),
        centerTitle: true,
      ),
      body: StreamBuilder<Game>(
        stream: bloc.outGameData,
        builder: (BuildContext context, AsyncSnapshot<Game> snapshot) {
          if (snapshot.data == null) return CupertinoActivityIndicator();

          List<Widget> playersLegend = List<Widget>();
          for (int i = 0; i < snapshot.data.players.length; i++) {
            playersLegend.add(Text(
                (i + 1).toString() + ": " + snapshot.data.players[i].name,
                style: Theme.of(context).textTheme.subtitle));
          }

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 20,
                    ),
                    Wrap(spacing: 10, children: playersLegend),
                    Container(
                      height: 20,
                    ),
                    Scoreboard(game: snapshot.data),
                  ],
                ),
                Container(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    children: <Widget>[
                      Tgame(
                        height: 20,
                        team1: "1 - 2",
                        team2: "3 - 4",
                      ),
                      Tgame(
                        height: 20,
                        team1: "1 - 3",
                        team2: "2 - 4",
                      ),
                      Tgame(
                        height: 20,
                        team1: "1 - 4",
                        team2: "2 - 3",
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
