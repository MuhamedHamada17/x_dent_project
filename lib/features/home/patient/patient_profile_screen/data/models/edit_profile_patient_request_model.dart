import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_patient_request_model.freezed.dart';
part 'edit_profile_patient_request_model.g.dart';

@freezed
class EditProfilePatientRequest with _$EditProfilePatientRequest {
  const factory EditProfilePatientRequest({
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
  }) = _EditProfilePatientRequest;

  factory EditProfilePatientRequest.fromJson(Map<String, dynamic> json) =>
      _$EditProfilePatientRequestFromJson(json);
}