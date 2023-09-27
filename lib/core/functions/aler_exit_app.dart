import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

Future<bool> alertExitApp(BuildContext context) {
  Get.defaultDialog(
    title: "تنبيه",
    titleStyle: context.textTheme.bodyMedium,
    middleText: "هل تريد الخروج من التطبيق",
    actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
        ),
        onPressed: () {
          exit(0);
        },
        child: const Text("تأكيد"),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text("الغاء"),
      ),
    ],
  );
  return Future.value(true);
}
