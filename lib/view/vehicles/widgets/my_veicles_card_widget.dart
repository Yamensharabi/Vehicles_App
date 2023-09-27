import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/svgs.dart';
import '../../../core/custom_widget/custom_text.dart';

class MyVehiclesCardWidget extends StatelessWidget {
  const MyVehiclesCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColors.grey, width: 6)),
        height: 200,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.grey,
                child: SvgPicture.asset(AppSvgs.car),
              ),
              CustomText(
                  text: "سعر الكيلو:", textStyle: context.textTheme.bodyLarge),
              CustomText(
                  text: "نسبة الشركة:", textStyle: context.textTheme.bodyLarge)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 5),
              CustomText(
                  text: "اودي 2020", textStyle: context.textTheme.bodyLarge),
              CustomText(
                  text: "1كم/50 ل.س", textStyle: context.textTheme.bodyLarge),
              CustomText(
                  text: "1كم/50 ل.س", textStyle: context.textTheme.bodyLarge)
            ],
          )
        ]),
      ),
    );
  }
}
