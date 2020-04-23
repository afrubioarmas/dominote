import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/t_game/t_game.dart';
import 'package:flutter/material.dart';

import 'add_match.dart';

class GameplayScreen extends StatelessWidget {
  final Hand hand;
  final double height = 20;

  GameplayScreen({
    this.hand,
  });

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
                TGame(
                  hand: hand,
                )
              ],
            ),
          ),
          AddMatch()
        ],
      ),
    );
  }
}
