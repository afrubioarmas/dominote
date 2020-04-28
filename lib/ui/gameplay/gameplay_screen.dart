import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/t_game/t_game.dart';
import 'package:flutter/material.dart';

import 'add_match.dart';

class GameplayScreen extends StatelessWidget {
  final Hand hand;

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: <Widget>[
          ListView(
            children: <Widget>[
              TGame(
                preview: false,
                hand: hand,
              ),
              Container(
                height: 180,
              )
            ],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0,
            child: AddMatch(
              hand: hand,
            ),
          )
        ]),
      ),
    );
  }
}
