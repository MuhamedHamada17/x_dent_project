import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/di/dependency_injection.dart';
import 'package:x_dent_project/features/forget_password/forget/ui/forget_screen.dart';
import 'package:x_dent_project/features/forget_password/otp/ui/otp_screen.dart';
import 'package:x_dent_project/features/forget_password/reset_password/ui/reset_password_screen.dart';
import 'package:x_dent_project/features/login/login_doctor/logic/login_cubit.dart';
import 'package:x_dent_project/features/login/login_patient/ui/login_patient_screen.dart';
import 'package:x_dent_project/features/splash/splash_screen.dart';
import 'package:x_dent_project/features/on_boarding/on_boarding_screen.dart';
import '../../features/login/login_doctor/ui/login_doctor_screen.dart';
import 'app_router.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginPatientScreen:
        return MaterialPageRoute(builder: (_) => const LoginPatientScreen());
      case Routes.loginDoctorScreen:
        return MaterialPageRoute(
          builder: (context) => const LoginDoctorScreen(),
        );
      case Routes.forgetScreen:
        return MaterialPageRoute(builder: (_) => const ForgetScreen());
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}