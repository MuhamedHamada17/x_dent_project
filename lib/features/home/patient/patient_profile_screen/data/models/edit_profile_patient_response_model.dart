import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_patient_response_model.freezed.dart';
part 'edit_profile_patient_response_model.g.dart';

@freezed
class EditProfilePatientResponse with _$EditProfilePatientResponse {
  const factory EditProfilePatientResponse({
    required String status,
    required String message,
    Doctor? doctor,
  }) = _EditProfilePatientResponse;

  factory EditProfilePatientResponse.fromJson(Map<String, dynamic> json) =>
      _$EditProfilePatientResponseFromJson(json);
}

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required int id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? role,
    String? description,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);
}