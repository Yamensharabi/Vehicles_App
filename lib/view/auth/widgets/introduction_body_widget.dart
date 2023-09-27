import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/routes.dart';
import '../../../core/custom_widget/custom_text.dart';

class BuildIntroScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String supTitle;
  final bool isShow;
  const BuildIntroScreen(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.supTitle,
      required this.isShow});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            AppImages.onboarding_line1,
          ),
        ),
        SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.offNamed(Routes.signInScreen);
                          },
                          child: CustomText(
                              text: "تخطي",
                              textStyle: context.textTheme.bodyMedium),
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "تطبيق خدني معك",
                                textStyle: context.textTheme.bodyLarge!
                                    .copyWith(
                                        fontSize: 25,
                                        decoration: TextDecoration.underline)),
                            Center(
                              child: CustomText(
                                text:
                                    "تطبيق لتقدر تلاقي بسهولة  سائق على طريقك\n لياخدك معو لتوصل بطريقة آمنة وسريعة \nومريحة",
                                textStyle: context.textTheme.titleMedium!
                                    .copyWith(fontSize: 20),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Center(child: Image.asset(AppImages.onboarding1)),
                            isShow
                                ? Row(
                                    children: [
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Get.offNamed(Routes.signInScreen);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.secondaryColor),
                                          child: Padding(
                                            padding: const EdgeInsets.all(18.0),
                                            child: Center(
                                              child: CustomText(
                                                  text: "يلا نبلش",
                                                  textStyle: context
                                                      .textTheme.titleLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              AppColors.grey)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox()
                          ],
                        ),
                      ),
                    )
                  ]),
            )),
      ],
    );
  }
}
