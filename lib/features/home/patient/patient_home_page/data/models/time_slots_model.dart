import 'package:json_annotation/json_annotation.dart';

part 'time_slots_model.g.dart';

@JsonSerializable()
class TimeSlotsResponse {
  final String status;
  @JsonKey(name: 'available_slots')
  final List<String> slots;

  TimeSlotsResponse({
    required this.status,
    required this.slots,
  });

  factory TimeSlotsResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotsResponseToJson(this);
}