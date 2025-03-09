import 'package:json_annotation/json_annotation.dart';

part 'login_response_body.g.dart';

@JsonSerializable()
class LoginResponseBody {
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'token_type')
  final String tokenType;

  final UserData data;

  LoginResponseBody({
    required this.accessToken,
    required this.tokenType,
    required this.data,
  });

  factory LoginResponseBody.fromJson(Map<String, dynamic> json) => _$LoginResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseBodyToJson(this);
}

@JsonSerializable()
class UserData {
  final int id;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String email;
  final String? phone;
  final String? address;
  final String role;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  final Patient? patient;

  UserData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.address,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.patient,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class Patient {
  final int id;
  final String description;

  @JsonKey(name: 'user_id')
  final int userId;

  Patient({
    required this.id,
    required this.description,
    required this.userId,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
