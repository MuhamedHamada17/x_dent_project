import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/show_patient_xray_repo.dart';
import 'show_patient_xray_state.dart';

class ShowPatientXrayCubit extends Cubit<ShowPatientXrayState> {
  final ShowPatientXrayRepo repo;

  ShowPatientXrayCubit(this.repo) : super(const ShowPatientXrayState.initial());

  Future<void> fetchXray(String token, int patientId) async {
    print(
        'ShowPatientXrayCubit: Fetching X-rays for patient ID: $patientId and token: $token');
    try {
      if (token.isEmpty || token == 'Bearer ') {
        emit(const ShowPatientXrayState.error('يجب تسجيل الدخول أولاً'));
        return;
      }
      emit(const ShowPatientXrayState.loading());
      final response = await repo.getXray(token, patientId);
      print(
          'ShowPatientXrayCubit: Successfully fetched X-ray list with status: ${response.status}');
      emit(ShowPatientXrayState.success(response));
    } catch (e) {
      final message = e.toString().contains('Token')
          ? 'يجب تسجيل الدخول أولاً'
          : 'حدث خطأ: ${e.toString()}';
      print('ShowPatientXrayCubit: Error: $message');
      emit(ShowPatientXrayState.error(message));
    }
  }
}
