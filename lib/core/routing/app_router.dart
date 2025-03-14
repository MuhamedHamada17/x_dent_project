import 'package:flutter/material.dart';
import 'package:x_dent_project/features/forget_password/forget/ui/forget_screen.dart';
import 'package:x_dent_project/features/login/login_doctor/ui/login_doctor_screen.dart';
import 'package:x_dent_project/features/login/login_patient/ui/login_patient_screen.dart';
import 'package:x_dent_project/features/on_boarding/on_boarding_screen.dart';
import 'package:x_dent_project/features/splash/splash_screen.dart';
import '../../features/signup/sign_up_patient/ui/signup_patient_screen.dart';
import '../../features/signup/sign_up_doctor/ui/signup_doctor_screen.dart';
import '../../features/home/ui/doctor_home_screen.dart';
import '../../features/home/ui/patient_home_screen.dart';
import '../../features/forget_password/otp/ui/otp_screen.dart';
import '../../features/forget_password/reset_password/ui/reset_password_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginPatientScreen:
        return MaterialPageRoute(builder: (_) => const LoginPatientScreen());
      case Routes.loginDoctorScreen:
        return MaterialPageRoute(builder: (_) => const LoginDoctorScreen());
      case Routes.signUpPatientScreen:
        return MaterialPageRoute(builder: (_) => const SignUpPatientScreen());
      case Routes.signUpDoctorScreen:
        return MaterialPageRoute(builder: (_) => const SignUpDoctorScreen());
      case Routes.doctorHomeScreen:
        return MaterialPageRoute(builder: (_) => const DoctorHomeScreen());
      case Routes.patientHomeScreen:
        return MaterialPageRoute(builder: (_) => const PatientHomeScreen());
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
