import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import '../data/repos/get_all_doctors_repo.dart';
import 'get_all_doctors_state.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsState> {
  final GetAllDoctorsRepo _getAllDoctorsRepo;

  GetAllDoctorsCubit(this._getAllDoctorsRepo) : super(const GetAllDoctorsState.initial());

  Future<void> fetchDoctors() async {
    emit(const GetAllDoctorsState.loading());
    final (response, error) = await _getAllDoctorsRepo.getAllDoctors();
    if (response != null) {
      emit(GetAllDoctorsState.success(response));
    } else {
      emit(GetAllDoctorsState.error(
        error ?? ApiErrorModel(message: 'Unknown error', statusCode: -1),
      ));
    }
  }
}