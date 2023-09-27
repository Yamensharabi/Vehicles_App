import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:vehicles_app/view/auth/screens/onboarding_screen.dart';
import '../../../core/constants/api_links.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  Future<void> registerWithEmail() async {
    try {
      var headers = {'content-Type': 'application/json'};
      var url = Uri.parse(ApiLinks.baseUrl + ApiLinks.authEndPoints.register);
      Map body = {
        'fullname': nameController.text,
        'phone_number': phoneController.text,
        'password': passwordController.text,
        'password_confirmation': confirmPasswordController.text,
      };
      http.Response response =
          await http.post(url, body: json.encode(body), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        if (json['status'] == 'success') {
          var token = json['data']['token'];
          print(token);
          final SharedPreferences? prefs = await _pref;

          await prefs?.setString('token', token);
          nameController.clear();
          phoneController.clear();
          passwordController.clear();
          Get.off(() => OnboardingScreen());
        } else {
          throw Exception(json['message']);
        }
      } else {
        throw Exception('Failed to register');
      }
    } catch (e) {
      print(e);
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text("Error"),
              contentPadding: const EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
