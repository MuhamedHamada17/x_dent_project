class DoctorHomeResponseModel {
  String? status;
  int? totalAppointments;
  int? pendingAppointmentsCount;
  int? canceledAppointmentsCount;
  int? completedAppointmentsCount;
  List<PendingAppointments>? pendingAppointments;

  DoctorHomeResponseModel({
    this.status,
    this.totalAppointments,
    this.pendingAppointmentsCount,
    this.canceledAppointmentsCount,
    this.completedAppointmentsCount,
    this.pendingAppointments,
  });

  DoctorHomeResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalAppointments = json['total_appointments'];
    pendingAppointmentsCount = json['pending_appointments_count'];
    canceledAppointmentsCount = json['canceled_appointments_count'];
    completedAppointmentsCount = json['completed_appointments_count'];
    if (json['pending_appointments'] != null) {
      pendingAppointments = <PendingAppointments>[];
      json['pending_appointments'].forEach((v) {
        pendingAppointments!.add(PendingAppointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['total_appointments'] = totalAppointments;
    data['pending_appointments_count'] = pendingAppointmentsCount;
    data['canceled_appointments_count'] = canceledAppointmentsCount;
    data['completed_appointments_count'] = completedAppointmentsCount;
    if (pendingAppointments != null) {
      data['pending_appointments'] =
          pendingAppointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PendingAppointments {
  int? id;
  String? day;
  String? status;
  String? appointmentDate;
  String? appointmentTime;
  Patient? patient;
  String? createdAt;
  String? updatedAt;

  PendingAppointments({
    this.id,
    this.day,
    this.status,
    this.appointmentDate,
    this.appointmentTime,
    this.patient,
    this.createdAt,
    this.updatedAt,
  });

  PendingAppointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    status = json['status'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['status'] = status;
    data['appointment_date'] = appointmentDate;
    data['appointment_time'] = appointmentTime;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Patient {
  int? id;
  String? name;
  int? age;
  Null phone;
  Null message;

  Patient({this.id, this.name, this.age, this.phone, this.message});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    phone = json['phone'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['phone'] = phone;
    data['message'] = message;
    return data;
  }
}
