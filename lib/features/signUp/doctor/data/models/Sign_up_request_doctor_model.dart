import 'package:json_annotation/json_annotation.dart';

part 'Sign_up_request_doctor_model.g.dart';

@JsonSerializable()
class SignUpRequestDoctorModel {
  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String email;

  @JsonKey(includeIfNull: false)
  final String? phone;

  @JsonKey(includeIfNull: false)
  final String? address;

  final String role;

  @JsonKey(name: 'myspec') // حقل myspec كنص
  final String myspec;

  @JsonKey(name: 'password')
  final String password;

  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;

  @JsonKey(includeIfNull: false)
  final String? degree;

  @JsonKey(includeIfNull: false)
  final String? university;

  @JsonKey(includeIfNull: false)
  final String? yearGraduated;

  SignUpRequestDoctorModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    this.address,
    required this.role,
    required this.myspec,
    required this.password,
    required this.confirmPassword,
    this.degree,
    this.university,
    this.yearGraduated,
  });

  factory SignUpRequestDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestDoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestDoctorModelToJson(this);
}
