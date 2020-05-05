import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/gameplay/gameplay_view_model.dart';
import 'package:dominote/ui/gameplay/select_opener.dart';
import 'package:dominote/ui/t_game/t_game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_match.dart';

class GameplayScreen extends StatelessWidget {
  final Hand hand;

  GameplayScreen({
    this.hand,
  });

  GamePlayViewModel _createViewModel(Hand hand) {
    return GamePlayViewModel(hand: hand);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GamePlayViewModel>(
      create: (context) => _createViewModel(hand),
      child: Consumer<GamePlayViewModel>(
        builder: (context, gamePlayViewModel, staticChild) => Scaffold(
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
              gamePlayViewModel.shouldRenderSelectOpener()
                  ? Positioned(
                      width: MediaQuery.of(context).size.width,
                      bottom: 0,
                      child: SelectOpener(hand: gamePlayViewModel.hand))
                  : gamePlayViewModel.shouldRenderAddMatch()
                      ? Positioned(
                          width: MediaQuery.of(context).size.width,
                          bottom: 0,
                          child: AddMatch(
                            hand: hand,
                          ),
                        )
                      : Container()
            ]),
          ),
        ),
      ),
    );
  }
}
