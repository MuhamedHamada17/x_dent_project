import 'package:flutter/cupertino.dart';
import 'package:x_dent_project/x_dent_app.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/routes.dart';

void main() {
  setupGetIt();
  runApp( xDentApp(
    appRouter: AppRouter(),
  ) as Widget);
}
