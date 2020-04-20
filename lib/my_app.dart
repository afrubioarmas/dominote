import 'package:dominote/ui/screens/splashscreen/splashscreen.dart';
import 'package:dominote/ui/theme.dart';
import 'package:flutter/material.dart';

import 'controller/helpers/language.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Language(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dominote',
        theme: darkTheme,
        home: SplashScreen());
  }
}
