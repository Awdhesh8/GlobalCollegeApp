import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/api_constants.dart';

class ApiService {

  /// User Login --->>>
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
      'POST', Uri.parse(APIConstants.getFullUrl(APIConstants.getProfileEndpoint)),
    );
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

        // Check if 'response' key is present and not null
        if (responseData.containsKey('response') && responseData['response'] != null) {
          return responseData;
        } else {
          print('Error: Missing or null "response" key in the API response.');
          return null;
        }
      } else {
        print('API error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error in API call: $e');
      return null;
    }
  }

  /// Get Rank Attendance -->>>
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

  /// Get Blood Group --->>>
  static Future<List<String>> fetchBloodGroups() async {
    try {
      final response = await http.post(
        Uri.parse(APIConstants.getFullUrl(APIConstants.getBloodGroup)), // Modify this line
        headers: APIConstants.headers,
        body: {'APIKEY': 'GNCS0225'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['status'] == "1") {
          List<dynamic> bloodGroupData = data['response'];
          List<String> bloodGroups = bloodGroupData
              .map((bloodGroup) => bloodGroup['bloodg'].toString())
              .toList();
          return bloodGroups;
        } else {
          throw Exception(data['message']);
        }
      } else {
        throw Exception('Failed to load blood groups: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Exception while fetching blood groups: $e');
    }
  }

  /// Edit Profile --->>>>
  static Future<void> updateProfile(Map<String, String> data, String imagePath) async {
    try {
      var headers = {
        'Cookie': 'ci_session=g6gqltpt0vbrgjfi4n29vnb2dmbsi99n'
      };
      var request = http.MultipartRequest('POST', Uri.parse('http://myglobalapp.in/global/API005/update_profile'));
      request.fields.addAll(data);
      if (imagePath.isNotEmpty && imagePath.startsWith('http')) {
        // Only add the image file if the imagePath is a URL
        request.files.add(await http.MultipartFile.fromPath('form_file', imagePath));
      }

      // Print the request being sent to the API
      print('API Request: ${request.fields}');

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // Print the response status code and body if successful
        print('Response status code: ${response.statusCode}');
        print('Response body: ${await response.stream.bytesToString()}');
      } else {
        // Print the response reason phrase if not successful
        print(response.reasonPhrase);
      }
    } catch (e) {
      // Handle errors
      print('Error in API call: $e');
    }
  }


}


