import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/api_constants.dart';

class ApiService {
  static Future<Map<String, dynamic>> loginUser(String username, String password) async {
    try {
      var headers = {
        'Cookie': 'ci_session=trb1cdm1k01ka4jrt6t55nrstv6frt8p; remember_code=529f1face76aad1813e947055101a76386950be0.e599f6271f11ddc484b1e8288df76ed79742de7399f1cd73f46f29113b68db349035fc15cdae996a5df0a4faec0d53c40d3b666f6336fc9ea236da0428f702c6'
      };

      var request = http.MultipartRequest('POST', Uri.parse(APIConstants.getFullUrl(APIConstants.loginEndpoint)));
      request.fields.addAll({
        'APIKEY': 'GNCS0225',
        'USERNAME': username,
        'PASSWORD': password,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(await response.stream.bytesToString());
        return data;
      } else {
        throw Exception('Failed to login. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: $e');
    }
  }

  /// Get Profile Data --->>>

  static Future<Map<String, dynamic>?> getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('user_id') ?? '';
    String userType = prefs.getString('user_type') ?? '';

    var request = http.MultipartRequest(
        'POST', Uri.parse(APIConstants.getFullUrl(APIConstants.getProfileEndpoint)));
    request.fields.addAll({
      'APIKEY': 'GNCS0225',
      'USER_ID': userId,
      'USER_TYPE': userType,
    });

    request.headers.addAll(APIConstants.headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseData = json.decode(await response.stream.bytesToString());
        return responseData;
      } else {
        print('API error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error in API call: $e');
      return null;
    }
  }

  ///
  static Future<Map<String, dynamic>?> getRankAndAttendanceData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('user_id') ?? '';
    String userType = prefs.getString('user_type') ?? '';

    var request = http.MultipartRequest(
        'POST', Uri.parse(APIConstants.getFullUrl('get_rankattend')));
    request.fields.addAll({
      'APIKEY': 'GNCS0225',
      'USER_ID': userId,
      'USER_TYPE': userType,
    });

    request.headers.addAll(APIConstants.headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseData = json.decode(await response.stream.bytesToString());
        return responseData;
      } else {
        print('API error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error in API call: $e');
      return null;
    }
  }

}


// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ApiService {
//   static const String baseUrl = 'http://myglobalapp.in/global/API005/';
//   static const String loginEndpoint = 'login';
//
//   static Future<Map<String, dynamic>> loginUser(String username, String password) async {
//     try {
//       var headers = {
//         'Cookie': 'ci_session=trb1cdm1k01ka4jrt6t55nrstv6frt8p; remember_code=529f1face76aad1813e947055101a76386950be0.e599f6271f11ddc484b1e8288df76ed79742de7399f1cd73f46f29113b68db349035fc15cdae996a5df0a4faec0d53c40d3b666f6336fc9ea236da0428f702c6'
//       };
//
//       var request = http.MultipartRequest('POST', Uri.parse('$baseUrl$loginEndpoint'));
//       request.fields.addAll({
//         'APIKEY': 'GNCS0225',
//         'USERNAME': username,
//         'PASSWORD': password,
//       });
//
//       request.headers.addAll(headers);
//
//       http.StreamedResponse response = await request.send();
//
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(await response.stream.bytesToString());
//         return data;
//       } else {
//         throw Exception('Failed to login. Status Code: ${response.statusCode}');
//       }
//     } catch (e) {
//       throw Exception('An error occurred: $e');
//     }
//   }
//
//
//   /// get profile
//
//   static var headers = {
//     'Cookie':
//     'ci_session=kpcb9645ohr4uu75n4mpp1pvgskhvpet; remember_code=2f44a97999d2b9906e7f718ffaa382b8757fddb1.a09e1027dfa46dd3dab3b6622e55761679815d5e3ac1292b9de93c63c28f1f28110005db701c9c83323d761faa75f923ccfca06e7c8ba4787a14ade3c965a5c7'
//   };
//
//   static Future<Map<String, dynamic>?> getProfileData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String userId = prefs.getString('user_id') ?? '';
//     String userType = prefs.getString('user_type') ?? '';
//
//     var request = http.MultipartRequest(
//         'POST', Uri.parse('http://myglobalapp.in/global/API005/profile_personal'));
//     request.fields.addAll({
//       'APIKEY': 'GNCS0225',
//       'USER_ID': userId,
//       'USER_TYPE': userType,
//     });
//
//     request.headers.addAll(headers);
//
//     try {
//       http.StreamedResponse response = await request.send();
//
//       if (response.statusCode == 200) {
//         var responseData = json.decode(await response.stream.bytesToString());
//         return responseData;
//       } else {
//         print('API error: ${response.reasonPhrase}');
//         return null;
//       }
//     } catch (e) {
//       print('Error in API call: $e');
//       return null;
//     }
//   }
//
// }
