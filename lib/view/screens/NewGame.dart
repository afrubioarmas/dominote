import 'package:dominote/model/Game.dart';
import 'package:dominote/model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewGame extends StatefulWidget {
  _NewGamestate createState() => _NewGamestate();
}

class _NewGamestate extends State<NewGame> {
  Game newGame;
  List<User> players = List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Game"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[],
      ),
    );
  }
}
