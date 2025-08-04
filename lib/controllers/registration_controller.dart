import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_api/utils/api_end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../views/homepage.dart';

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerEmail);

      Map<String, dynamic> body = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };

      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['token'];
          final prefs = await _prefs;
          await prefs.setString('token', token);

          nameController.clear();
          emailController.clear();
          passwordController.clear();

          Get.off(Homepage());

          Get.snackbar("Success", "Registered successfully!");
        } else {
          final message = json['message'] ?? "Something went wrong.";
          Get.snackbar("Error", message);
        }
      } else {
        // Error body might not be JSON
        String message = "Unknown Error";
        if (response.body.isNotEmpty) {
          try {
            final errorJson = jsonDecode(response.body);
            message = errorJson['message'] ?? message;
          } catch (e) {
            print("Failed to parse error response: $e");
          }
        } else {
          print("Empty response body from API");
        }

        Get.snackbar("Error", message);
      }
    } catch (e) {
      print("Exception: $e");
      Get.snackbar("Exception", e.toString());
    }
  }

}
