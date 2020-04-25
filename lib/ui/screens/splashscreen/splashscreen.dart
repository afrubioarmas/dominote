import 'package:dominote/controller/misc/service_locator.dart';
import 'package:dominote/controller/navigation/app_navigator/app_navigator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  AppNavigator _navigator;

  @override
  void initState() {
    super.initState();
    _navigator = locator<AppNavigator>();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5)).then((onValue) {}).catchError((onError) {});
    _navigator.navigateToNewGame(clearStack: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.height * 0.2,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
