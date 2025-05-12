import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';

import '../data/models/get_all_doctors_model.dart';

part 'get_all_doctors_state.freezed.dart';

@freezed
class GetAllDoctorsState with _$GetAllDoctorsState {
  const factory GetAllDoctorsState.initial() = _Initial;
  const factory GetAllDoctorsState.loading() = _Loading;
  const factory GetAllDoctorsState.success(GetAllDoctorsResponse data) = _Success;
  const factory GetAllDoctorsState.error(ApiErrorModel error) = _Error;
}