
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/on_boarding/on_boarding_screen.dart';
import 'app_router.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguement=settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder:
            (_)=>const OnBoardingScreen());
      default:
        return MaterialPageRoute(builder: (_)=>
            Scaffold(
              body: Center(child: Text("No route defined for ${settings.name}"),),
            ));

    }
  }
}