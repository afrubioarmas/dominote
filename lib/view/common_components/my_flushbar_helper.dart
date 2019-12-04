import 'package:dominote/controller/helpers/language.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class MyFlushbarHelper {
  static showSuccess(String message, context) {
    Flushbar(
      title: Language.getStrings("Success"),
      message: message,
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
    )..show(context);
  }

  static showError(String message, context) {
    Flushbar(
      title: Language.getStrings("Error"),
      message: message,
      duration: Duration(seconds: 3),
      backgroundColor: Theme.of(context).colorScheme.error,
    )..show(context);
  }
}
