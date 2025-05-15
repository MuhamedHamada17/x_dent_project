import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';

part 'add_rating_state.freezed.dart';

@freezed
class AddRatingState<T> with _$AddRatingState<T> {
  const factory AddRatingState.initial() = _Initial;
  const factory AddRatingState.loading() = Loading;
  const factory AddRatingState.success(T data) = Success<T>;
  const factory AddRatingState.error({required ApiErrorModel error}) = Error;
}