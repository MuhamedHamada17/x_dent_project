import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/di/dependency_injection.dart';
import 'package:x_dent_project/x_dent_app.dart';
import 'bloc_observer.dart';
import 'core/routing/app_router.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(xDentApp(appRouter: AppRouter()));
}
