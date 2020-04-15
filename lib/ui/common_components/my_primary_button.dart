import 'package:flutter/material.dart';

class MyPrimaryButton extends StatelessWidget {
  Widget child;
  Color color;
  Function action;

  MyPrimaryButton({this.child, this.color, this.action});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: child,
      color: color,
      onPressed: action == null ? () {} : action,
    );
  }
}
