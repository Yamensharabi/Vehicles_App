// ignore_for_file: avoid_print, unnecessary_nullable_for_final_variable_declarations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:vehicles_app/view/vehicles/screens/my_vehicles_screen.dart';
import '../../../core/constants/api_links.dart';
import '../../../core/constants/colors.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  Future<void> login() async {
    print("start");

    try {
      var headers = {'content-Type': 'application/json'};
      var url = Uri.parse(ApiLinks.baseUrl + ApiLinks.authEndPoints.login);
      Map body = {
        'phone_number': phoneController.text,
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        if (json['status'] == 'success') {
          var token = json['data']['token'];
          print(token);
          final SharedPreferences? prefs = await _pref;

          await prefs?.setString('token', token);
          phoneController.clear();
          passwordController.clear();
          Get.to(() => const MyVehiclesScreen());
        } else {
          throw Exception('Login failed');
        }
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      print(e);
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: Text("خطأ !", style: context.textTheme.titleLarge),
            content: Text(
              'رجاء ادخل رقم الهاتف وكلمة السر بشكل صحيح',
              style: context.textTheme.titleMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK',
                    style: context.textTheme.titleMedium!
                        .copyWith(color: AppColors.secondaryColor)),
              ),
            ],
          );
        },
      );
    }
  }
}
