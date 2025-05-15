import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/data/repos/add_rating_repo.dart';
import 'add_rating_state.dart';

class AddRatingCubit extends Cubit<AddRatingState> {
  AddRatingCubit() : super(const AddRatingState.initial());

  final AddRatingRepo _addRatingRepo = GetIt.instance<AddRatingRepo>();

  Future<void> submitReview({
    required String token,
    required int doctorId,
    required String review,
    required String rating,
  }) async {
    emit(const AddRatingState.loading());
    try {
      debugPrint('AddRatingCubit: Attempting to submit review for doctorId: $doctorId');
      final result = await _addRatingRepo.submitReview(
        token: token,
        doctorId: doctorId,
        review: review,
        rating: rating,
      );
      result.when(
        success: (response) {
          debugPrint('AddRatingCubit: Success: ${response.message}');
          emit(AddRatingState.success(response));
        },
        failure: (error) {
          debugPrint('AddRatingCubit: Error: ${error.apiErrorModel.message}');
          emit(AddRatingState.error(error: error.apiErrorModel));
        },
      );
    } catch (e) {
      debugPrint('AddRatingCubit: Exception: $e');
      emit(AddRatingState.error(
        error: ApiErrorModel(
          message: e.toString(),
          statusCode: ResponseCode.DEFAULT,
        ),
      ));
    }
  }
}