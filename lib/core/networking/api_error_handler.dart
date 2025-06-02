import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORIZED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int API_LOGIC_ERROR = 422;

  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String BAD_REQUEST = "Bad request. Please try again.";
  static const String UNAUTHORIZED = "Unauthorized access.";
  static const String FORBIDDEN = "You don’t have permission to access.";
  static const String NOT_FOUND = "Requested resource not found.";
  static const String INTERNAL_SERVER_ERROR = "Internal server error.";
  static const String API_LOGIC_ERROR = "API logic error.";

  // رسائل الأخطاء المحلية
  static const String CONNECT_TIMEOUT = "Connection timeout.";
  static const String CANCEL = "Request was cancelled.";
  static const String RECEIVE_TIMEOUT = "Receive timeout.";
  static const String SEND_TIMEOUT = "Send timeout.";
  static const String CACHE_ERROR = "Cache error occurred.";
  static const String NO_INTERNET_CONNECTION = "No internet connection.";
  static const String DEFAULT = "Unexpected error occurred.";
}

class ErrorHandler implements Exception {
  final ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) : apiErrorModel = _handleError(error);
}

ApiErrorModel _handleError(dynamic error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(
          success: false,
          message: ResponseMessage.CONNECT_TIMEOUT,
          statusCode: ResponseCode.CONNECT_TIMEOUT,
        );
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
          success: false,
          message: ResponseMessage.SEND_TIMEOUT,
          statusCode: ResponseCode.SEND_TIMEOUT,
        );
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
          success: false,
          message: ResponseMessage.RECEIVE_TIMEOUT,
          statusCode: ResponseCode.RECEIVE_TIMEOUT,
        );
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return ApiErrorModel(
          success: false,
          message: ResponseMessage.CANCEL,
          statusCode: ResponseCode.CANCEL,
        );
      case DioExceptionType.connectionError:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
      default:
        return ApiErrorModel(
          success: false,
          message: ResponseMessage.DEFAULT,
          statusCode: ResponseCode.DEFAULT,
        );
    }
  } else {
    return ApiErrorModel(
      success: false,
      message: ResponseMessage.DEFAULT,
      statusCode: ResponseCode.DEFAULT,
    );
  }
}

ApiErrorModel _handleBadResponse(Response? response) {
  if (response != null && response.data != null) {
    try {
      return ApiErrorModel.fromJson(response.data);
    } catch (_) {
      return ApiErrorModel(
        success: false,
        message: response.statusMessage ?? ResponseMessage.DEFAULT,
        statusCode: response.statusCode ?? ResponseCode.DEFAULT,
      );
    }
  } else {
    return ApiErrorModel(
      success: false,
      message: ResponseMessage.DEFAULT,
      statusCode: ResponseCode.DEFAULT,
    );
  }
}
