import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/logout_patient_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/logout_patient_repo.dart';
import 'logout_patient_state.dart';

class LogoutPatientCubit extends Cubit<LogoutPatientState> {
  final LogoutPatientRepo _logoutPatientRepo;

  LogoutPatientCubit(this._logoutPatientRepo) : super(const LogoutPatientState.initial());

  Future<void> logout() async {
    emit(const LogoutPatientState.loading());

    // جلب التوكن من SharedPreferences
    final token = await SharedPrefHelper.getSecuredString('access_token');

    final response = await _logoutPatientRepo.logout(
      token,
      LogoutPatientRequest(),
    );

    response.when(
      success: (logoutResponse) async {
        // حذف التوكن والبيانات من SharedPreferences
        await SharedPrefHelper.removeData('access_token');
        await SharedPrefHelper.removeData('first_name');
        await SharedPrefHelper.removeData('last_name');
        await SharedPrefHelper.removeData('full_name');

        emit(LogoutPatientState.success(logoutResponse));
      },
      failure: (error) {
        emit(LogoutPatientState.error(error: error.apiErrorModel.message ?? 'Logout failed'));
      },
    );
  }
}