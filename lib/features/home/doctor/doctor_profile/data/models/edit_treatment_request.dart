import 'package:json_annotation/json_annotation.dart';

part 'edit_treatment_request.g.dart';

@JsonSerializable()
class EditTreatmentRequest {
  final String name;
  final String date;

  EditTreatmentRequest({
    required this.name,
    required this.date,
  });

  factory EditTreatmentRequest.fromJson(Map<String, dynamic> json) =>
      _$EditTreatmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditTreatmentRequestToJson(this);
}
