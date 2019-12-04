import 'package:dominote/view/screens/new_game.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5))
        .then((onValue) {})
        .catchError((onError) {});
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => NewGame()));
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
