import 'package:json_annotation/json_annotation.dart';
part 'specialization_doctors_model.g.dart';

@JsonSerializable()
class SpecializationDoctorsResponse {
  final bool success;
  final String message;
  final int status_code;
  final List<DoctorData> data;

  SpecializationDoctorsResponse({
    required this.success,
    required this.message,
    required this.status_code,
    required this.data,
  });

  factory SpecializationDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDoctorsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SpecializationDoctorsResponseToJson(this);
}

@JsonSerializable()
class DoctorData {
  final int id;
  final String first_name;
  final String last_name;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final int? price;
  final int reviews_count;
  final int average_rating;
  final String role;
  final String degree;
  final String university;
  final String? year_graduated;
  final String? location;
  final String? cv_file;
  final List<String> specialization;
  final List<Schedule> schedules;
  final String created_at;
  final String updated_at;

  DoctorData({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.price,
    required this.reviews_count,
    required this.average_rating,
    required this.role,
    required this.degree,
    required this.university,
    this.year_graduated,
    this.location,
    this.cv_file,
    required this.specialization,
    required this.schedules,
    required this.created_at,
    required this.updated_at,
  });

  factory DoctorData.fromJson(Map<String, dynamic> json) =>
      _$DoctorDataFromJson(json);
  Map<String, dynamic> toJson() => _$DoctorDataToJson(this);
}

@JsonSerializable()
class Schedule {
  final int id;
  final int doctor_id;
  final String available_days;
  final String start_time;
  final String end_time;
  final String? created_at;
  final String? updated_at;

  Schedule({
    required this.id,
    required this.doctor_id,
    required this.available_days,
    required this.start_time,
    required this.end_time,
    this.created_at,
    this.updated_at,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}