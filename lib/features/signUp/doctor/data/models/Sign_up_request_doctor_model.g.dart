// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sign_up_request_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestDoctorModel _$SignUpRequestDoctorModelFromJson(
        Map<String, dynamic> json) =>
    SignUpRequestDoctorModel(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      role: json['role'] as String,
      myspec: json['myspec'] as String,
      password: json['password'] as String,
      confirmPassword: json['password_confirmation'] as String,
      degree: json['degree'] as String?,
      university: json['university'] as String?,
      yearGraduated: json['yearGraduated'] as String?,
    );

Map<String, dynamic> _$SignUpRequestDoctorModelToJson(
        SignUpRequestDoctorModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      if (instance.phone case final value?) 'phone': value,
      if (instance.address case final value?) 'address': value,
      'role': instance.role,
      'myspec': instance.myspec,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
      if (instance.degree case final value?) 'degree': value,
      if (instance.university case final value?) 'university': value,
      if (instance.yearGraduated case final value?) 'yearGraduated': value,
    };
