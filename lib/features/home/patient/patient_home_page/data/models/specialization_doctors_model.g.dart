// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialization_doctors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecializationDoctorsResponse _$SpecializationDoctorsResponseFromJson(
        Map<String, dynamic> json) =>
    SpecializationDoctorsResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      status_code: (json['status_code'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => DoctorData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationDoctorsResponseToJson(
        SpecializationDoctorsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'status_code': instance.status_code,
      'data': instance.data,
    };

DoctorData _$DoctorDataFromJson(Map<String, dynamic> json) => DoctorData(
      id: (json['id'] as num).toInt(),
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      price: (json['price'] as num?)?.toInt(),
      reviews_count: (json['reviews_count'] as num).toInt(),
      average_rating: (json['average_rating'] as num).toInt(),
      role: json['role'] as String,
      degree: json['degree'] as String,
      university: json['university'] as String,
      year_graduated: json['year_graduated'] as String?,
      location: json['location'] as String?,
      cv_file: json['cv_file'] as String?,
      specialization: (json['specialization'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      schedules: (json['schedules'] as List<dynamic>)
          .map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
    );

Map<String, dynamic> _$DoctorDataToJson(DoctorData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'price': instance.price,
      'reviews_count': instance.reviews_count,
      'average_rating': instance.average_rating,
      'role': instance.role,
      'degree': instance.degree,
      'university': instance.university,
      'year_graduated': instance.year_graduated,
      'location': instance.location,
      'cv_file': instance.cv_file,
      'specialization': instance.specialization,
      'schedules': instance.schedules,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
      id: (json['id'] as num).toInt(),
      doctor_id: (json['doctor_id'] as num).toInt(),
      available_days: json['available_days'] as String,
      start_time: json['start_time'] as String,
      end_time: json['end_time'] as String,
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
    );

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctor_id,
      'available_days': instance.available_days,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
