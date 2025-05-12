import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/di/dependency_injection.dart';
import 'package:x_dent_project/x_dent_app.dart';
import 'bloc_observer.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  Bloc.observer = MyBlocObserver();

  // Check first launch and login state
  bool isFirstLaunch = await SharedPrefHelper.isFirstLaunch();
  debugPrint('main: isFirstLaunch: $isFirstLaunch');
  bool isLoggedIn = isFirstLaunch ? false : await SharedPrefHelper.checkIfLoggedInUser();
  debugPrint('main: isLoggedIn: $isLoggedIn');
  String initialRoute;

  if (isFirstLaunch) {
    initialRoute = Routes.onBoardingScreen;
  } else if (isLoggedIn) {
    String role = await SharedPrefHelper.getUserRole();
    debugPrint('main: role: $role');
    initialRoute = role == 'doctor' ? Routes.appLayoutDoctor : Routes.AppLayoutPatient;
  } else {
    initialRoute = Routes.loginPatientScreen; // Default to patient login
  }
  debugPrint('main: initialRoute: $initialRoute');

  runApp(
    xDentApp(
      appRouter: AppRouter(),
      initialRoute: initialRoute,
    ),
  );
}