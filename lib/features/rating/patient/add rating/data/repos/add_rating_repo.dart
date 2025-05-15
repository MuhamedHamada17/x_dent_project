import 'package:flutter/cupertino.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/data/models/add_rating_request_model.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/data/models/add_rating_response_model.dart';

class AddRatingRepo {
  final ApiService _apiService;

  AddRatingRepo(this._apiService);

  Future<ApiResult<AddRatingResponse>> submitReview({
    required String token,
    required int doctorId,
    required String review,
    required String rating,
  }) async {
    try {
      debugPrint(
          'AddRatingRepo: Sending review - token: $token, doctorId: $doctorId, review: $review, rating: $rating');
      final response = await _apiService.submitReview(
        'Bearer $token',
        doctorId,
        AddRatingRequest(
          review: review,
          rating: rating,
        ),
      );
      debugPrint('AddRatingRepo: Review submitted successfully for doctorId: $doctorId, response: ${response.message}');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('AddRatingRepo: Error submitting review: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}