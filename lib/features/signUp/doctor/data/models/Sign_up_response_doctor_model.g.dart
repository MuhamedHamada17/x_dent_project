// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sign_up_response_doctor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponseDoctorModel _$SignUpResponseDoctorModelFromJson(
        Map<String, dynamic> json) =>
    SignUpResponseDoctorModel(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SignUpResponseDoctorModelToJson(
        SignUpResponseDoctorModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
      'success': instance.success,
      'statusCode': instance.statusCode,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      role: json['role'] as String?,
      myspec: json['myspec'] as String?,
      degree: json['degree'] as String?,
      university: json['university'] as String?,
      yearGraduated: json['yearGraduated'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      if (instance.phone case final value?) 'phone': value,
      if (instance.address case final value?) 'address': value,
      'role': instance.role,
      'myspec': instance.myspec,
      if (instance.degree case final value?) 'degree': value,
      if (instance.university case final value?) 'university': value,
      if (instance.yearGraduated case final value?) 'yearGraduated': value,
    };
