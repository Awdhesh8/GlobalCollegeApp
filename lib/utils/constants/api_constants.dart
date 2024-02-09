
/// <-- LIST OF CONSTANTS USED IN APIs -->
class APIConstants {
  static const String baseUrl = 'http://myglobalapp.in/global/API005/';

  static const String loginEndpoint = 'login';
  static const String getProfileEndpoint = 'profile_personal';
  static const String getRankattend = 'get_rankattend';
  static const String getBloodGroup = 'get_bloodg';
  static const String updateProfile = 'update_profile';


  // Add more endpoints as needed

  static String getFullUrl(String endpoint) {
    return '$baseUrl$endpoint';
  }

  /// getProfileData ---
  static const Map<String, String> headers = {
    'Cookie':
    'ci_session=kpcb9645ohr4uu75n4mpp1pvgskhvpet; remember_code=2f44a97999d2b9906e7f718ffaa382b8757fddb1.a09e1027dfa46dd3dab3b6622e55761679815d5e3ac1292b9de93c63c28f1f28110005db701c9c83323d761faa75f923ccfca06e7c8ba4787a14ade3c965a5c7'
  };


}



//
// /// -- LIST OF CONSTANTS USED IN APIs --
//
//
// class APIConstants {
//
//   /// Base URL
//   static const String baseUrl = 'http://myglobalapp.in/global/API005/';
//
//   /// Endpoints
//
//   // Login
//   static const String loginEndpoint = 'login';
//
//   // Get Profile Personal
//   static const String getProfileEndpoint = 'profile_personal';
//   // Add more endpoints as needed
//
//   // Full URLs
//   static String getFullUrl(String endpoint) {
//     return '$baseUrl$endpoint';
//   }
//
//
// }