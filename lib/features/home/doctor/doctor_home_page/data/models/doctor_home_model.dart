class HomeModel {
  String? status;
  int? totalAppointments;
  int? pendingAppointmentsCount;
  int? canceledAppointmentsCount;
  int? completedAppointmentsCount;
  List<PendingAppointments>? pendingAppointments;

  HomeModel({
    this.status,
    this.totalAppointments,
    this.pendingAppointmentsCount,
    this.canceledAppointmentsCount,
    this.completedAppointmentsCount,
    this.pendingAppointments,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalAppointments = json['total_appointments'];
    pendingAppointmentsCount = json['pending_appointments_count'];
    canceledAppointmentsCount = json['canceled_appointments_count'];
    completedAppointmentsCount = json['completed_appointments_count'];
    if (json['pending_appointments'] != null) {
      pendingAppointments = <PendingAppointments>[];
      json['pending_appointments'].forEach((v) {
        pendingAppointments!.add(new PendingAppointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_appointments'] = this.totalAppointments;
    data['pending_appointments_count'] = this.pendingAppointmentsCount;
    data['canceled_appointments_count'] = this.canceledAppointmentsCount;
    data['completed_appointments_count'] = this.completedAppointmentsCount;
    if (this.pendingAppointments != null) {
      data['pending_appointments'] =
          this.pendingAppointments!.map((v) => v.toJson()).toList();
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
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    data['status'] = this.status;
    data['appointment_date'] = this.appointmentDate;
    data['appointment_time'] = this.appointmentTime;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Patient {
  int? id;
  String? name;
  int? age;
  Null? phone;
  Null? message;

  Patient({this.id, this.name, this.age, this.phone, this.message});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    phone = json['phone'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['age'] = this.age;
    data['phone'] = this.phone;
    data['message'] = this.message;
    return data;
  }
}
