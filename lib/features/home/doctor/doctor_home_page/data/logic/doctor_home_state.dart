import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/models/doctor_home_response_model.dart';

part 'doctor_home_state.freezed.dart';
part 'doctor_home_state.g.dart';

@freezed
class DoctorHomeState with _$DoctorHomeState {
  const factory DoctorHomeState.initial() = _Initial;
  const factory DoctorHomeState.loading() = _Loading;
  const factory DoctorHomeState.loaded(DoctorHomeResponseModel data) = _Loaded;
  const factory DoctorHomeState.error(ApiErrorModel error) = _Error;

  factory DoctorHomeState.fromJson(Map<String, dynamic> json) =>
      _$DoctorHomeStateFromJson(json);
}
