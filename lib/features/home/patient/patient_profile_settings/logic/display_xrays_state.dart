import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/display_xrays_model.dart';

part 'display_xrays_state.freezed.dart';

@freezed
class DisplayXraysState with _$DisplayXraysState {
  const factory DisplayXraysState.initial() = _Initial;
  const factory DisplayXraysState.loading() = _Loading;
  const factory DisplayXraysState.success(DisplayXraysResponse xrays) = _Success;
  const factory DisplayXraysState.error(String message) = _Error;
}