import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/models/show_patient_xray_model.dart';

part 'show_patient_xray_state.freezed.dart';

@freezed
class ShowPatientXrayState with _$ShowPatientXrayState {
  const factory ShowPatientXrayState.initial() = _Initial;
  const factory ShowPatientXrayState.loading() = _Loading;
  const factory ShowPatientXrayState.success(ShowPatientXrayResponse response) =
      _Success;
  const factory ShowPatientXrayState.error(String message) = _Error;
}
