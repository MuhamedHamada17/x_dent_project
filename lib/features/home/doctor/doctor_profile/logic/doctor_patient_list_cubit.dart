// doctor_patient_list_cubit.dart
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/models/doctor_patient_list_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/data/repos/doctor_patient_list_repo.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_list_state.dart';

class DoctorPatientListCubit
    extends Cubit<DoctorPatientListState<DoctorPatientListModel>> {
  final DoctorPatientListRepository repository;

  DoctorPatientListCubit(this.repository)
      : super(const DoctorPatientListState.initial());

  Future<void> fetchDoctorPatientList({
    required String token,
  }) async {
    emit(const DoctorPatientListState.loading());
    try {
      final response = await repository.getDoctorPatientList(
        token: token,
      );
      emit(DoctorPatientListState.success(response));
    } catch (e) {
      emit(DoctorPatientListState.error(
        error: ApiErrorModel(
          message: e.toString(),
          statusCode: e is DioException && e.response != null
              ? e.response!.statusCode ?? 500
              : 500,
        ),
      ));
    }
  }
}
