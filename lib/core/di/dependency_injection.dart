import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/patient/patient_appoinment_sreen/data/repos/appointment_patient_repo.dart';
import '../../features/home/patient/patient_appoinment_sreen/logic/appointment_patient_cubit.dart';
import '../../features/login/login_doctor/data/repos/login_repo.dart';
import '../../features/login/login_doctor/logic/login_cubit.dart';
import '../../features/signUp/patient/data/repos/sign_patient_repo.dart';
import '../../features/signUp/patient/logic/sign_up_patient_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  print('ApiService registered');

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  print('LoginRepo and LoginCubit registered');

  // Sign-up
  getIt.registerLazySingleton<SignPatientRepo>(() => SignPatientRepo(getIt()));
  getIt.registerFactory<SignUpPatientCubit>(() => SignUpPatientCubit(getIt()));
  print('SignPatientRepo and SignUpPatientCubit registered');

  // Appointments
  getIt.registerLazySingleton<AppointmentPatientRepo>(() => AppointmentPatientRepo(getIt()));
  getIt.registerFactory<AppointmentPatientCubit>(
        () => AppointmentPatientCubit(getIt<AppointmentPatientRepo>()),
  );
  print('AppointmentPatientRepo and AppointmentPatientCubit registered');
}