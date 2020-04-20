import 'package:dominote/my_app.dart';
import 'package:flutter/material.dart';
import 'controller/misc/service_locator.dart';

Future<void> main() async {
  await locator.registerDependencies();
  runApp(MyApp());
}
