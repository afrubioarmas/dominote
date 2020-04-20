import 'package:dominote/ui/screens/game_widget/components/t_game.dart';
import 'package:dominote/ui/screens/gameplay/add_match.dart';
import 'package:flutter/material.dart';

class Gameplay extends StatefulWidget {
  @override
  _GameplayState createState() => _GameplayState();
}

class _GameplayState extends State<Gameplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Tgame(
                  height: 30,
                  team1: "Andres - Dani",
                  team2: "Oscar - Felo",
                ),
              ],
            ),
          ),
          AddMatch()
        ],
      ),
    );
  }
}
