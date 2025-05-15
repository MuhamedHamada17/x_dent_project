import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/time_slots_model.dart';

part 'time_slots_state.freezed.dart';

@freezed
class TimeSlotsState with _$TimeSlotsState {
  const factory TimeSlotsState.initial() = _Initial;
  const factory TimeSlotsState.loading() = _Loading;
  const factory TimeSlotsState.success(TimeSlotsResponse response) = _Success;
  const factory TimeSlotsState.error({required ApiErrorModel error}) = _Error;
}