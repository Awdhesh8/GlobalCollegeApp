
/// <-- LIST OF CONSTANTS USED IN APIs -->
class APIConstants {
  static const String baseUrl = 'http://myglobalapp.in/global/API005/';

  static const String loginEndpoint = 'login';
  static const String getProfileEndpoint = 'profile_personal';
  static const String getRankAttend = 'get_rankattend';
  static const String getBloodGroup = 'get_bloodg';
  static const String updateProfile = 'update_profile';
  static const String getEducationalProfile = 'profile_educational';
  static const String getTimeTable = 'student_timetable';
  static const String getBooks = 'book_search';
  static const String getEBooks = 'Ebook_search';
  static const String lockOrUnlockBooks = 'lock_book';
  static const String issuedBooks = 'issued_book';
  static const String libraryHistory = 'book_history';
  static const String attendanceCalender = 'newattendance_details';
  static const String feesDetails = 'feesummary';
  static const String cancelLeave = 'cancelleave';



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
//Testing Check from Mac ----> check this out check check 123
//
// }

