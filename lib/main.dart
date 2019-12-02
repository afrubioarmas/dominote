import 'package:dominote/view/screens/new_game.dart';
import 'package:dominote/view/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dominotae',
        theme: darkTheme,
        home: NewGame());
  }
}
