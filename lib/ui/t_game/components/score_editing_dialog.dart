import 'package:dominote/controller/helpers/language.dart';
import 'package:dominote/model/hand.dart';
import 'package:dominote/ui/common_components/my_primary_button.dart';
import 'package:flutter/material.dart';

class ScoreEditingDialog extends StatelessWidget {
  final TextEditingController controller;
  final int index;
  final Team team;
  final Function deleteAction;
  final Function editAction;

  ScoreEditingDialog(
      {@required this.controller,
      @required this.team,
      @required this.deleteAction,
      @required this.editAction,
      @required this.index});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Language.getStrings("EditingScore")),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.numberWithOptions(),
        ),
      ),
      actions: <Widget>[
        MyPrimaryButton(
          color: Theme.of(context).buttonColor,
          child: Icon(Icons.edit),
          action: () {
            editAction(team, index, context);
          },
        ),
        MyPrimaryButton(
          color: Theme.of(context).colorScheme.error,
          child: Icon(Icons.delete_forever),
          action: () {
            deleteAction(team, index, context);
          },
        ),
      ],
    );
  }
}
