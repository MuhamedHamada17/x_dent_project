import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/doctor_analyzed_image_model.dart';

part 'doctor_analyzed_image_state.freezed.dart';

@freezed
class DoctorAnalyzedImageState with _$DoctorAnalyzedImageState {
  const factory DoctorAnalyzedImageState.initial() = _Initial;
  const factory DoctorAnalyzedImageState.loading() = _Loading;
  const factory DoctorAnalyzedImageState.success(
      DoctorAnalyzedImageResponse response) = _Success;
  const factory DoctorAnalyzedImageState.error(String message) = _Error;
}
