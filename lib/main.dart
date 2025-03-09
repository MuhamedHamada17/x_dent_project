import 'core/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'core/di/dependency_injection.dart';
import 'package:x_dent_project/x_dent_app.dart';

void main() {
  // test the push
  int x = 5;
  var k = 15;
  setupGetIt();
  int Y = 5;
  runApp(xDentApp(appRouter: AppRouter()));
}