// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllDoctorsResponse _$GetAllDoctorsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAllDoctorsResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      statusCode: (json['status_code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => DoctorData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllDoctorsResponseToJson(
        GetAllDoctorsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'status_code': instance.statusCode,
      'data': instance.data,
    };

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
