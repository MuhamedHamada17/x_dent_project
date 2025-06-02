import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/repos/specialization_doctors_repo.dart';
import 'specialization_doctors_state.dart';

class SpecializationDoctorsCubit extends Cubit<SpecializationDoctorsState> {
  SpecializationDoctorsCubit() : super(SpecializationDoctorsInitial());

  final SpecializationDoctorsRepo _specializationDoctorsRepo =
  GetIt.instance<SpecializationDoctorsRepo>();

  Future<void> filterDoctors({
    required String specialization,
    int? reviewRating,
    int? minPrice,
    int? maxPrice,
  }) async {
    print('filterDoctors called with specialization: $specialization, reviewRating: $reviewRating, minPrice: $minPrice, maxPrice: $maxPrice');
    emit(SpecializationDoctorsLoading());
    try {
      final result = await _specializationDoctorsRepo.filterDoctorsBySpecialization(
        specialization: specialization,
        reviewRating: reviewRating,
        minPrice: minPrice,
        maxPrice: maxPrice,
      );
      result.when(
        success: (response) {
          print('SpecializationDoctorsCubit: Response Data: ${response.data}');
          if (response.data.isEmpty) {
            emit(SpecializationDoctorsError(
                'There are no doctors matching specialty $specialization '));
            return;
          }
          // Save doctors list to SharedPreferences
          SharedPrefHelper.saveDoctors(specialization, response.data);
          // Save each doctor individually
          for (var doctor in response.data) {
            if (doctor.id == 0) {
              print('Warning: Skipping doctor with invalid ID: ${doctor.toJson()}');
              continue;
            }
            SharedPrefHelper.saveDoctorData(doctor.id, doctor);
          }
          emit(SpecializationDoctorsSuccess(response));
        },
        failure: (error) {
          print('SpecializationDoctorsCubit: Error: ${error.apiErrorModel.message}');
          emit(SpecializationDoctorsError(error.apiErrorModel.message));
        },
      );
    } catch (e) {
      print('SpecializationDoctorsCubit: Exception: $e');
      emit(SpecializationDoctorsError('An unexpected error occurred:$e'));
    }
  }
}