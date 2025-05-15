class ApiConstants {
  static const String apiBaseUrl = "https://laravel-production-d517.up.railway.app";

  static const String login = "/api/auth/login";
  static const String signupPatient = "/api/auth/patient/register";
  static const String cancelledAppointment = "/api/patient/cancelled/appointments";
  static const String upcomingAppointment = "/api/patient/pending/appointments";
  static const String confirmedAppointment = "/api/patient/confirmed/appointments";
  static const String changePasswordPatient = "/api/profile/change-password";
  static const String editProfilePatient = "/api/profile/edit";
  static const String logoutPatient = "/api/auth/logout";
  static const String treatmentPlanPatient = "/api/patient/treatment-plans";
  static const String forgetPassword = "/api/auth/forgot-password";
  static const String otp = "/api/auth/forgot-password/code";
  static const String resetPassword = "/api/auth/reset-password";
  static const String cancelAppointment = "/api/patient/{id}/cancel";
  static const String getAllDoctors = "/api/doctors";
  static const String filterSpecializationDoctors = "/api/doctors/filter";
  static const String availableSlots = "/api/doctors/{doctorId}/appointments/available_slots";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}