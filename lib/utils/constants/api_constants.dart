
/// -- LIST OF CONSTANTS USED IN APIs --


class APIConstants {

  /// Base URL
  static const String baseUrl = 'http://myglobalapp.in/global/API005/';

  /// Endpoints

  // Login
  static const String loginEndpoint = 'login';

  // Get Profile Personal
  static const String getProfileEndpoint = 'profile_personal';
  // Add more endpoints as needed

  // Full URLs
  static String getFullUrl(String endpoint) {
    return '$baseUrl$endpoint';
  }


}