import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/Game.dart';
import 'package:dominote/model/Player.dart';
import 'package:dominote/ui/screens/game_widget/components/t_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/scoreboard.dart';

class GameWidget extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<GameWidget> {

  List<Player> players = [
    Player(name: "Andres"),
    Player(name: "Juan"),
    Player(name: "Oscar"),
    Player(name: "Pedro")
    ];
  
  @override
  Widget build(BuildContext context) {

    List<Widget> playersLegend = List<Widget>();
    
    for (int i = 0; i < players.length; i++) {
      playersLegend.add(Text(
          (i + 1).toString() + ": " + players[i].name,
          style: Theme.of(context).textTheme.subtitle));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(Language.getStrings("Scoreboard"),
            style: Theme.of(context).textTheme.title),
        centerTitle: true,
      ),
      body:
        Container(
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
                    Scoreboard(game: Game(players)),
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
          )
       
      
    );
  }
}
