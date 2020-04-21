import 'package:bot_toast/bot_toast.dart';
import 'package:dominote/ui/screens/splashscreen/splashscreen.dart';
import 'package:dominote/ui/theme.dart';
import 'package:flutter/material.dart';

import 'controller/helpers/language.dart';
import 'controller/misc/service_locator.dart';
import 'controller/navigation/app_navigator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Language(context);
    return BotToastInit(
      child: MaterialApp(
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          title: 'Dominote',
          theme: darkTheme,
          navigatorKey: locator<AppNavigator>().navigatorKey,
          onGenerateRoute: locator<AppNavigator>().onGenerateRoute,
          home: SplashScreen()),
    );
  }
}
