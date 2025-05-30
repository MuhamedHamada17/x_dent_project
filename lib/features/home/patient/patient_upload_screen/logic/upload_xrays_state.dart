import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/patient/patient_upload_screen/data/models/upload_xrays_response_model.dart';
part 'upload_xrays_state.freezed.dart';
part 'upload_xrays_state.g.dart';

@freezed
class UploadXraysState with _$UploadXraysState {
  const factory UploadXraysState.initial() = UploadXraysInitial;
  const factory UploadXraysState.loading() = UploadXraysLoading;
  const factory UploadXraysState.success(UploadXraysResponse response) = UploadXraysSuccess;
  const factory UploadXraysState.error(ApiErrorModel error) = UploadXraysError;

  factory UploadXraysState.fromJson(Map<String, dynamic> json) =>
      _$UploadXraysStateFromJson(json);
}