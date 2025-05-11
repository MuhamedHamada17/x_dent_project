import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:flutter/material.dart';

import '../models/otp_request_body.dart';
import '../models/otp_response_body.dart';

class OtpRepo {
  final ApiService _apiService;

  OtpRepo(this._apiService);

  Future<ApiResult<OtpResponseBody>> verifyOtpCode(OtpRequestBody request) async {
    try {
      debugPrint('OtpRepo: Sending OTP verification request: ${request.toJson()}');
      final response = await _apiService.verifyOtpCode(request);
      debugPrint('OtpRepo: Response received: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('OtpRepo: Error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}