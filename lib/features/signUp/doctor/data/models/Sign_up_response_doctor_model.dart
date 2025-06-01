import 'package:json_annotation/json_annotation.dart';

part 'Sign_up_response_doctor_model.g.dart';

@JsonSerializable()
class SignUpResponseDoctorModel {
  final String? message;
  final Data? data;
  final bool? success;
  final int? statusCode;

  SignUpResponseDoctorModel({
    this.message,
    this.data,
    this.success,
    this.statusCode,
  });

  factory SignUpResponseDoctorModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseDoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseDoctorModelToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  final String? email;

  @JsonKey(includeIfNull: false)
  final String? phone;

  @JsonKey(includeIfNull: false)
  final String? address;

  final String? role;

  @JsonKey(name: 'myspec')
  final String? myspec;

  @JsonKey(includeIfNull: false)
  final String? degree;

  @JsonKey(includeIfNull: false)
  final String? university;

  @JsonKey(includeIfNull: false)
  final String? yearGraduated;

  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.role,
    this.myspec,
    this.degree,
    this.university,
    this.yearGraduated,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
