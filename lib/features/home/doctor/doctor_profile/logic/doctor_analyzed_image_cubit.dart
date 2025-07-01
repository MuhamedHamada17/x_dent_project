import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/doctor_analyzed_image_repo.dart';
import 'doctor_analyzed_image_state.dart';

class DoctorAnalyzedImageCubit extends Cubit<DoctorAnalyzedImageState> {
  final DoctorAnalyzedImageRepo repo;

  DoctorAnalyzedImageCubit(this.repo)
      : super(const DoctorAnalyzedImageState.initial());

  Future<void> fetchAnalyzedImage(String token, int patientId) async {
    print(
        'DoctorAnalyzedImageCubit: Fetching analyzed images for patient ID: $patientId and token: $token');
    try {
      if (token.isEmpty || token == 'Bearer ') {
        emit(const DoctorAnalyzedImageState.error('يجب تسجيل الدخول أولاً'));
        return;
      }
      emit(const DoctorAnalyzedImageState.loading());
      final response = await repo.getAnalyzedImage(token, patientId);
      print(
          'DoctorAnalyzedImageCubit: Successfully fetched analyzed image list with status: ${response.status}, images: ${response.data.length}');
      emit(DoctorAnalyzedImageState.success(response));
    } catch (e) {
      final message = e.toString().contains('Token')
          ? 'يجب تسجيل الدخول أولاً'
          : 'حدث خطأ: ${e.toString()}';
      print('DoctorAnalyzedImageCubit: Error: $message');
      emit(DoctorAnalyzedImageState.error(message));
    }
  }
}
