import 'dart:convert';

import 'package:flutter/widgets.dart';

class Language {
  static const String def = "en";

  Language(context) {
    if (language == null) language = def;
    DefaultAssetBundle.of(context)
        .loadString("assets/languages/$language.json", cache: false)
        .then((value) {
      _strings = JsonDecoder().convert(value);
    }).catchError((onError) {
      print(onError);
    });
  }

  static dynamic _strings = Map();

  static String getStrings(String tag) => _strings[tag] ?? tag;

  static String language;

  static setLanguage(String current) {
    language = current;
  }
}
