import 'package:flutter/material.dart';

class MyPrimaryButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final Function action;

  MyPrimaryButton({this.child, this.color, this.action});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: child,
      color: color,
      onPressed: action,
    );
  }
}
