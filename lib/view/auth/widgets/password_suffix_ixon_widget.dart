import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth/auth_controller.dart';

class PasswordSuffixIcon extends StatelessWidget {
  const PasswordSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthControllerImp>(
      builder: (controller) {
        return IconButton(
          onPressed: () {
            controller.changeVisibility();
          },
          icon: controller.isVisibility
              ? const Icon(Icons.visibility_off, color: Colors.grey)
              : const Icon(Icons.visibility, color: Colors.grey),
        );
      },
    );
  }
}
