import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vehicles_app/core/custom_widget/sized_boxes/vertical_sized_box.dart';

import '../constants/colors.dart';
import '../constants/svgs.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final Widget? trailing;
  const CustomAppBar({super.key, this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: trailing ??
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: AppColors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: SvgPicture.asset(AppSvgs.chevron_right),
                        ),
                      ),
                    ),
              ),
              Text(
                title ?? '',
                style: context.textTheme.titleLarge,
              ),
              const SizedBox()
            ],
          ),
        ),
        const VerticalSizedBox(
          10,
        ),
      ],
    );
  }
}
