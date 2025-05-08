import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/repos/appointment_patient_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/logic/appointment_patient_cubit.dart';
import 'package:x_dent_project/features/login/login_doctor/data/repos/login_repo.dart';
import 'package:x_dent_project/features/login/login_doctor/logic/login_cubit.dart';
import 'package:x_dent_project/features/signUp/patient/data/repos/sign_patient_repo.dart';
import 'package:x_dent_project/features/signUp/patient/logic/sign_up_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/change_password_patient_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/change_password_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/edit_profile_patient_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/edit_profile_patient_cubit.dart';
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

  // Change Password
  getIt.registerLazySingleton<ChangePasswordPatientRepo>(() => ChangePasswordPatientRepo(getIt()));
  getIt.registerFactory<ChangePasswordPatientCubit>(() => ChangePasswordPatientCubit(getIt()));
  print('ChangePasswordPatientRepo and ChangePasswordPatientCubit registered');

  // Edit Profile
  getIt.registerLazySingleton<EditProfilePatientRepo>(() => EditProfilePatientRepo(getIt()));
  getIt.registerFactory<EditProfilePatientCubit>(() => EditProfilePatientCubit(getIt()));
  print('EditProfilePatientRepo and EditProfilePatientCubit registered');
}