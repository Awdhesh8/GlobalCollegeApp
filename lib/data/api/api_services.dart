import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/personalization/screens/settings/edit_profile/edit_Profile.dart';
import '../../features/time_table/time_table.dart';
import '../../utils/constants/api_constants.dart';
import '../../utils/constants/colors.dart';

class ApiService {
  /// User Login --->>>
  static Future<Map<String, dynamic>> loginUser(
      String username, String password) async {
    try {
      var headers = {
        'Cookie':
            'ci_session=trb1cdm1k01ka4jrt6t55nrstv6frt8p; remember_code=529f1face76aad1813e947055101a76386950be0.e599f6271f11ddc484b1e8288df76ed79742de7399f1cd73f46f29113b68db349035fc15cdae996a5df0a4faec0d53c40d3b666f6336fc9ea236da0428f702c6'
      };

      var request = http.MultipartRequest('POST',
          Uri.parse(APIConstants.getFullUrl(APIConstants.loginEndpoint)));
      request.fields.addAll({
        'APIKEY': 'GNCS0225',
        'USERNAME': username,
        'PASSWORD': password,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final Map<String, dynamic> data =
            json.decode(await response.stream.bytesToString());
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
      'POST',
      Uri.parse(APIConstants.getFullUrl(APIConstants.getProfileEndpoint)),
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
        if (responseData.containsKey('response') &&
            responseData['response'] != null) {
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
        throw Exception(
            'Failed to load blood groups: ${response.reasonPhrase}');
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
        http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
            'form_file', imageData,
            filename: imagePath);
        request.files.add(multipartFile);
      } else {
        // Assume local file image
        var imageFile =
            await http.MultipartFile.fromPath('form_file', imagePath);
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
  Future<Map<String, dynamic>> fetchEducationalDetails() async {
    // Removed static keyword
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id') ?? '';
    var userType = prefs.getString('user_type') ?? '';

    var headers = {'Cookie': 'ci_session=s63p3q25pe1l70smdpptatqmg0j2vb8p'};

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
      Map<String, dynamic> data =
          json.decode(await response.stream.bytesToString());
      return data;
    } else {
      throw Exception('Failed to load timetable');
    }
  }

  /// <<<---- Library --->>>

  /// Library Search --->
  static Future<List<Map<String, dynamic>>> bookSearch(
      String searchKeyword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id') ?? '';
    var userType = prefs.getString('user_type') ?? '';
    var employerId = prefs.getString('emp_id') ?? '';

    try {
      var headers = {
        'Cookie': 'ci_session=1t3b502csempj6ti9mak02q48j6h2k1g',
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(APIConstants.getFullUrl(APIConstants.getBooks)),
      );

      request.fields.addAll({
        'APIKEY': 'GNCS0225',
        'srch_keyword': searchKeyword,
        'USER_ID': userId,
      });
      print(request);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseBody);

        return List<Map<String, dynamic>>.from(jsonResponse['response']);
      } else {
        print(response.reasonPhrase);
        return []; // Return an empty list in case of an error
      }
    } catch (error) {
      print('Error: $error');
      return []; // Return an empty list in case of an error
    }
  }

  /// Lock unlock Books
  Future<void> updateLockStatus(String bookId, bool newLockStatus, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id') ?? '';

    try {
      var headers = {'Cookie': 'ci_session=41u6ft1qdlm59a6h30cuc0or6p46ot2m'};
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(APIConstants.getFullUrl(APIConstants.lockOrUnlockBooks))
        // Uri.parse('http://myglobalapp.in/global/API005/lock_book'),
      );

      // Set request fields
      request.fields.addAll({
        'APIKEY': 'GNCS0225',
        'USER_ID': userId,
        'book_id': bookId,
        'lock_status': newLockStatus.toString(),
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(await response.stream.bytesToString());
        // Print the response data
        print('Response Data: $responseData');

        // Handle the response data as needed
        var status = responseData['status'];
        var message = responseData['message'];

        if (status == '1') {
          // Update was successful, handle accordingly
          print('Lock Status Updated Successfully');

          // Show a SnackBar with the success message
          Get.snackbar('Lock Status : ', '$message',colorText: EColors.textColorPrimary1,);
          // Get.snackbar('Lock Status : $message', 'You can now take the book from the college library.');

          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text('Lock Status Updated Successfully. You can now take the book from the college library.'),
          //     duration: Duration(seconds: 4),
          //   ),
          // );
        } else {
          // Update failed, handle accordingly
          print('Lock Status Update Failed: $message');

          // Show a SnackBar with the failure message
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     content: Text('Lock Status Update Failed: $message'),
          //     duration: Duration(seconds: 2),
          //   ),
          // );
          Get.snackbar('Lock Status Update Failed: ', '$message');
        }
      } else {
        // Print the reason phrase in case of non-200 status code
        print('Error: ${response.reasonPhrase}');

        // Show a SnackBar with the error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${response.reasonPhrase}'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      // Handle any other errors that might occur during the request
      print('Error updating lock status: $error');

      // Show a SnackBar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating lock status: $error'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  /// eLibrary
  static Future<List<Map<String, dynamic>>> getEBooks(
      String searchKeyword) async {
    try {
      var headers = {
        'Cookie': 'ci_session=7am93kpc7ut7avqqauh42l8t8pk9a1u8',
      };

      var request = http.MultipartRequest(
        'POST',
        Uri.parse(APIConstants.getFullUrl(APIConstants.getEBooks)),
      );

      request.fields.addAll({
        'APIKEY': 'GNCS0225',
        'srch_keyword': searchKeyword,
      });
      print(request);
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseBody);

        return List<Map<String, dynamic>>.from(jsonResponse['response']);
      } else {
        print(response.reasonPhrase);
        return []; // Return an empty list in case of an error
      }
    } catch (error) {
      print('Error: $error');
      return []; // Return an empty list in case of an error
    }
  }

  /// IssueBooks History ---->>>
  static Future<Map<String, dynamic>> issuedBooks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userType = prefs.getString('user_type') ?? '';
    var empID = prefs.getString('emp_id') ?? '';

    print("EMP_ID: $empID");
    // print("USER_TYPE: $userType");

    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded', // Set the correct content type
      'Cookie': 'ci_session=emi9l982e536e4alkaneli56uq6vghqb',
    };

    var body = {
      'APIKEY': 'GNCS0225',
      'emp_id': empID,
      'USER_TYPE': userType,
    };

    var uri = Uri.parse(APIConstants.getFullUrl(APIConstants.issuedBooks));
    var response = await http.post(uri, headers: headers, body: body);

    /*
    print('Link URL: ${response.request}');
    print("Headers: ${response.headers}");
    print("Code: ${response.statusCode}");
    print('Body: ${response.body}');
    print(empID);
    print("Print Response : $response");
    */

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load Issue Book History Data');
    }
  }

  /// Book History ---->>>
  static Future<Map<String, dynamic>> libraryHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userType = prefs.getString('user_type') ?? '';
    var empID = prefs.getString('emp_id') ?? '';

    print("EMP_ID: $empID");
    print("USER_TYPE: $userType");

    var headers = {
      'Cookie': 'ci_session=06idajds6tidndrcefdn7cqj6qvqu2k5; remember_code=3fe3befddf2e48650ddc76d5d6697a61cfbf4ed6.156bad30a0afd8ce50fb8553e490c99d170e19371cf15b4366cad31d125d8279806b12813a77c9d93859ad8b3d4c157324dbf43326429d7138599ed5aa06965a',
    };

    var body = {
      'APIKEY': 'GNCS0225',
      'emp_id': empID,
      'USER_TYPE': userType,
    };

    var uri = Uri.parse(APIConstants.getFullUrl(APIConstants.libraryHistory));
    var response = await http.post(uri, headers: headers, body: body);


    print('Link URL: ${response.request}');
    print("Headers: ${response.headers}");
    print("Code: ${response.statusCode}");
    print('Body: ${response.body}');
    print(empID);
    print("Print Response : $response");


    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load History Data');
    }
  }

  /// Attendance (In Calender)



}
