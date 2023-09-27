import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicles_app/core/custom_widget/custom_text.dart';

import '../../../core/constants/colors.dart';
import '../../../core/custom_widget/buttons/my_button.dart';
import '../../../core/custom_widget/custom_appbar.dart';
import '../widgets/my_veicles_card_widget.dart';

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 50.h,
            child: Center(
              child: CustomText(
                  text: "إضافة مركبة",
                  textStyle: context.textTheme.titleLarge!
                      .copyWith(color: AppColors.grey)),
            ),
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(40)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const CustomAppBar(
                title: "مركباتي",
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return MyVehiclesCardWidget();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
