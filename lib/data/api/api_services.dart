import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/personalization/screens/settings/edit_profile/edit_Profile.dart';
import '../../features/time_table/time_table.dart';
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
  static Future<List<BloodGroup>> fetchBloodGroups() async {
    try {
      final response = await http.post(
        Uri.parse(APIConstants.getFullUrl(APIConstants.getBloodGroup)),
        headers: APIConstants.headers,
        body: {'APIKEY': 'GNCS0225'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['status'] == "1") {
          List<dynamic> bloodGroupData = data['response'];
          List<BloodGroup> bloodGroups = bloodGroupData
              .map((bloodGroupJson) => BloodGroup.fromJson(bloodGroupJson))
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
  static Future<void> updateProfile({
    required String contactNumber,
    required String email,
    required String samagraId,
    required String laptop,
    required String bloodGroup,
    required String laptopBrand,
    required String laptopRam,
    required String laptopProcessor,
    required String laptopConfig,
    required String imagePath,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userId = prefs.getString('user_id') ?? '';
      String userType = prefs.getString('user_type') ?? '';

      var headers = APIConstants.headers;
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(APIConstants.getFullUrl(APIConstants.updateProfile)),
      );

      request.fields.addAll({
        'APIKEY': 'GNCS0225',
        'USER_ID': userId, // Ensure this is not an empty string
        'USER_TYPE': userType,
        'contact_no': contactNumber,
        'stud_email': email,
        'samagra_id': samagraId,
        'laptop': laptop,
        'stud_bgroup': bloodGroup,
        'lap_brand': laptopBrand,
        'lap_ram': laptopRam,
        'lap_processor': laptopProcessor,
        'lap_config': laptopConfig,
      });

      // Check if imagePath is a network URL starting with 'http' or 'https'
      if (imagePath.startsWith('http')) {
        // Add the image URL directly to the request
        request.fields['form_file'] = imagePath;
      } else if (imagePath.startsWith('assets')) {
        // Load the asset image and add it to the request
        ByteData byteData = await rootBundle.load(imagePath);
        List<int> imageData = byteData.buffer.asUint8List();
        http.MultipartFile multipartFile = http.MultipartFile.fromBytes('form_file', imageData, filename: imagePath);
        request.files.add(multipartFile);
      } else {
        // Assume local file image
        var imageFile = await http.MultipartFile.fromPath('form_file', imagePath);
        request.files.add(imageFile);
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  /// Get Educational Info --->>>
  Future<Map<String, dynamic>> fetchEducationalDetails() async { // Removed static keyword
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id') ?? '';
    var userType = prefs.getString('user_type') ?? '';

    var headers = {
      'Cookie': 'ci_session=s63p3q25pe1l70smdpptatqmg0j2vb8p'
    };

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://myglobalapp.in/global/API005/profile_educational'),
    );
    request.fields.addAll({
      'APIKEY': 'GNCS0225',
      'USER_ID': userId,
      'USER_TYPE': userType,
    });

    request.headers.addAll(headers);

    print('Sending request to API...');
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      print('Response received from API: $responseBody');
      var parsedResponse = json.decode(responseBody);

      if (parsedResponse['status'] == "1") {
        print('API call successful');
        return {'success': true, 'data': parsedResponse};
      } else {
        print('API call failed. Error message: ${parsedResponse['message']}');
        return {'success': false, 'error': parsedResponse['message']};
      }
    } else {
      print('API request failed with status: ${response.statusCode}');
      return {
        'success': false,
        'error': 'Request failed with status: ${response.statusCode}'
      };
    }
  }

  /// Get Time Table  --->>>>
  static Future<Map<String, dynamic>> fetchTimetable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id') ?? '';
    var userType = prefs.getString('user_type') ?? '';

    print(userId);
    print(userType);

    var headers = {
      'Cookie': 'ci_session=ga2gv43kdoaqr8bs0f91tqof0rss55r4',
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse(APIConstants.getFullUrl(APIConstants.getTimeTable)));
    // var request = http.MultipartRequest('POST', Uri.parse('http://myglobalapp.in/global/API005/student_timetable'));
    request.fields.addAll({
      'APIKEY': 'GNCS0225',
      'USER_ID': userId,
      'USER_TYPE': userType,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(await response.stream.bytesToString());
      return data;
    } else {
      throw Exception('Failed to load timetable');
    }
  }

  /// <<<---- Library --->>>

  /// eLibrary Search --->
  Future<void> bookSearch(String searchKeyword) async {
    try {
      var headers = {
        'Cookie': 'ci_session=sa8mcpj64kero3hpjg1uvt0ai3p9f685',
      };

       var request = http.MultipartRequest(
           'POST', Uri.parse(APIConstants.getFullUrl(APIConstants.getBooks)));
      request.fields.addAll({
        'APIKEY': 'GNCS0225',
        'srch_keyword': searchKeyword, // take this from the controller
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        // You can process the response data further if needed
      } else {
        print(response.reasonPhrase);
      }
    } catch (error) {
      print('Error: $error');
      // Handle errors appropriately
    }
  }

}
