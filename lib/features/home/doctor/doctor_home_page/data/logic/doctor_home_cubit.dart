import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/logic/doctor_home_state.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/repos/doctor_home_repo.dart';

class DoctorHomeCubit extends Cubit<DoctorHomeState> {
  final DoctorHomeRepository _repository;

  DoctorHomeCubit(this._repository) : super(const DoctorHomeState.initial());

  Future<void> fetchDoctorHomeData(String token) async {
    emit(const DoctorHomeState.loading());
    try {
      final homeData = await _repository.getDoctorHomeData(token);
      emit(DoctorHomeState.loaded(homeData));
    } catch (e) {
      emit(
        DoctorHomeState.error(
          e is ApiErrorModel
              ? e
              : ApiErrorModel(message: e.toString(), statusCode: 400),
        ),
      );
    }
  }
}
